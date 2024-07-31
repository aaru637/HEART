import axios from "axios";
import Store from "../store/Store";
import { server } from "../actions/ServerAction";

// Creating Axios Instance
const axiosInstance = axios.create({
  baseURL: "http://127.0.0.1:8080/api/v1",
  headers: {
    "Content-Type": "application/json",
  },
});

// Function to refresh the access token
const refreshToken = async () => {
  try {
    const response = await axios.post("/auth/refresh-token", {
      token: localStorage.getItem("refresh-token"),
    });
    localStorage.setItem("accessToken", response.data.accessToken);
    return response.data.accessToken;
  } catch (error) {
    console.log("Unable to refresh token ", error);
    throw error;
  }
};

// Request interceptor to add the access token to headers
axiosInstance.interceptors.request.use(
  async (config) => {
    const token = localStorage.getItem("accessToken");
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
      config.headers.set("SESSION_ID", localStorage.getItem("SESSION_ID"));
    }
    return config;
  },
  (error) => {
    if (!error.response) {
      Store.dispatch(server(true));
    }
    return Promise.reject(error);
  }
);

// Response interceptor to handle 401 errors and refresh token logic
axiosInstance.interceptors.response.use(
  (response) => {
    return response;
  },
  async (error) => {
    if (!error.response) {
      Store.dispatch(server(true));
    }
    const originalRequest = error.config;
    if (error.response.status === 401 && !originalRequest._retry) {
      originalRequest._retry = true;
      try {
        const newAccessToken = await refreshToken();
        axios.defaults.headers.common[
          "Authorization"
        ] = `Bearer ${newAccessToken}`;
        originalRequest.headers["Authorization"] = `Bearer ${newAccessToken}`;
        return axiosInstance(originalRequest);
      } catch (error) {
        if (!error.response) {
          Store.dispatch(server(true));
        }
        return Promise.reject(error);
      }
    }
    return Promise.reject(error);
  }
);

export default axiosInstance;
