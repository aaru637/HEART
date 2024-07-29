import { configureStore } from "@reduxjs/toolkit";
import rootReducer from "../reducers/RootReducer";

const Store = configureStore({
  reducer: rootReducer,
});

export default Store;
