export const login = (data) => {
  return {
    type: "LOGIN",
    payload: data,
  };
};

export const logout = (data) => {
  return {
    type: "LOGOUT",
    payload: data,
  };
};

export const signup = (data) => {
  return {
    type: "SIGNUP",
    payload: data,
  };
};
