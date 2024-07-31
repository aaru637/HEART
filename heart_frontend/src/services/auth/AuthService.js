import axiosInstance from "../../config/AxiosInstance";
const login = async (credentials) => {
  try {
    const response = await axiosInstance.post("/auth/login", credentials);
    localStorage.setItem("accessToken", response.data.accessToken);
    localStorage.setItem("refreshToken", response.data.refreshToken);
    localStorage.setItem("id", response.data.id);
    localStorage.setItem("SESSION_ID", response.data.SESSION_ID);
    return response.data;
  } catch (error) {
    console.log("Unable to login ", error);
    return "error";
  }
};

const logout = async (credentials) => {
  try {
    await axiosInstance.post("/auth/logout", credentials);
    localStorage.removeItem("accessToken");
    localStorage.removeItem("refreshToken");
    localStorage.removeItem("id");
    localStorage.removeItem("SESSION_ID");
    return true;
  } catch (error) {
    console.log("Unable to logout ", error);
    return "error";
  }
};

const signup = async (credentials) => {
  try {
    const response = await axiosInstance.post("/auth/signup", credentials);
    localStorage.setItem("accessToken", response.data.accessToken);
    localStorage.setItem("refreshToken", response.data.refreshToken);
    localStorage.setItem("id", response.data.id);
    localStorage.setItem("SESSION_ID", response.data.SESSION_ID);
    return response.data;
  } catch (error) {
    console.log("Unable to signup ", error);
    return "error";
  }
};

export default login;
export { logout, signup };
