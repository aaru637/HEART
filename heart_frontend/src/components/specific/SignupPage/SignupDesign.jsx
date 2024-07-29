import React from "react";
import { ad } from "../../../utils/SignupPageUtils";
import SignupPageAnimation from "./../../lottie-animation/SignupPageAnimation";
import {
  ad_style,
  animation_design_style,
  parent_design,
} from "../../common/login-signup-styles/LoginSignupCommonStyles";

const SignupDesign = () => {
  return (
    <div className={parent_design}>
      <div className={animation_design_style}>
        <SignupPageAnimation />
      </div>
      <p className={ad_style}>{ad}</p>
    </div>
  );
};

export default SignupDesign;
