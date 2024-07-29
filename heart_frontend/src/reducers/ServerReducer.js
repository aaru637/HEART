const initialState = {
  isServerDown: false,
};

const serverReducer = (state = initialState, action) => {
  switch (action.type) {
    case "SERVER_DOWN":
      state = { ...state, isServerDown: action.payload };
      return state;

    default:
      return state;
  }
};

export default serverReducer;
