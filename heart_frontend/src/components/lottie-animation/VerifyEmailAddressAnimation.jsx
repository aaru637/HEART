import Lottie from "lottie-react";
import React from "react";
import { verifyEmailAnimation } from "../../utils/VerifyEmailAddressPageUtils";

const VerifyEmailAddressAnimation = () => {
  return <Lottie animationData={verifyEmailAnimation} loop={true} />;
};

export default VerifyEmailAddressAnimation;
