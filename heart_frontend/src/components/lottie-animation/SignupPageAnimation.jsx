import Lottie from "lottie-react";
import React from "react";
import { signupAnimation } from "../../utils/SignupPageUtils";

const SignupPageAnimation = () => {
  return <Lottie animationData={signupAnimation} loop={true} />;
};

export default SignupPageAnimation;
