import login, { logout, signup } from "../services/auth/AuthService";

const initialState = {
  isAuthenticated: !!(
    localStorage.getItem("accessToken") && localStorage.getItem("id")
  ),
  id: localStorage.getItem("id"),
  accessToken: localStorage.getItem("accessToken"),
  refreshToken: localStorage.getItem("refreshToken"),
  SESSION_ID: localStorage.getItem("SESSION_TOKEN"),
};
const authReducer = async (state = initialState, action) => {
  switch (action.type) {
    case "LOGIN":
      const loginResponse = await login(action.payload);
      if (loginResponse === "error") {
        state = { ...state, isAuthenticated: false };
      } else {
        state = {
          ...state,
          isAuthenticated: true,
          id: loginResponse.id,
          accessToken: loginResponse.accessToken,
          refreshToken: loginResponse.refresToken,
          SESSION_ID: loginResponse.SESSION_ID,
        };
      }
      return state;

    case "LOGOUT":
      const logoutResponse = await logout(action.payload);
      if (logoutResponse) {
        state = {
          ...state,
          isAuthenticated: false,
          id: null,
          accessToken: null,
          refreshToken: null,
        };
      }
      return state;

    case "SIGNUP":
      const signUpResponse = await signup(action.payload);
      if (signUpResponse === "error") {
        state = { ...state, isAuthenticated: false };
      } else {
        state = {
          ...state,
          isAuthenticated: true,
          id: signUpResponse.id,
          accessToken: signUpResponse.accessToken,
          refreshToken: signUpResponse.refresToken,
        };
      }
      return state;

    default:
      return state;
  }
};

export default authReducer;
