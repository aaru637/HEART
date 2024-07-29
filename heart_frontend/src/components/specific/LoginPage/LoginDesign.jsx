import React from "react";
import LoginPageAnimation from "../../lottie-animation/LoginPageAnimation";
import { ad } from "../../../utils/LoginPageUtils";
import {
  ad_style,
  animation_design_style,
  parent_design,
} from "../../common/login-signup-styles/LoginSignupCommonStyles";

const LoginDesign = () => {
  return (
    <div className={parent_design}>
      <div className={animation_design_style}>
        <LoginPageAnimation />
      </div>
      <p className={ad_style}>{ad}</p>
    </div>
  );
};

export default LoginDesign;
