import { combineReducers } from "redux";
import authReducer from "./AuthReducer";
import serverReducer from "./ServerReducer";

const rootReducer = combineReducers({
  auth: authReducer,
  server: serverReducer,
});

export default rootReducer;
