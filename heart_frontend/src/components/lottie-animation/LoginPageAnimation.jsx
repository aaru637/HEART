import Lottie from "lottie-react";
import React from "react";
import { loginAnimation } from "../../utils/LoginPageUtils";

const LoginPageAnimation = () => {
  return <Lottie animationData={loginAnimation} loop={true} />;
};

export default LoginPageAnimation;
