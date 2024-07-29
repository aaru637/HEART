import Lottie from "lottie-react";
import React from "react";
import { passwordResetAnimation } from "../../utils/PasswordResetEmailPageUtils";

const PasswordResetEmailAnimation = () => {
  return <Lottie animationData={passwordResetAnimation} loop={true} />;
};

export default PasswordResetEmailAnimation;
