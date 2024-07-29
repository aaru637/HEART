import React from "react";
import {
  content,
  done,
  header,
} from "../../../utils/PasswordResetEmailPageUtils";
import { animation_design_style } from "../../common/login-signup-styles/LoginSignupCommonStyles";
import PasswordResetEmailAnimation from "../../lottie-animation/PasswordResetEmailAnimation";
import { useNavigate } from "react-router-dom";

const PasswordResetEmailDesign = () => {
  let navigate = useNavigate();
  const handleDone = () => navigate("/auth/login", { replace: true });
  return (
    <div className="text-center flex flex-col justify-end items-center w-[50vw] gap-6">
      <div className={animation_design_style}>
        <PasswordResetEmailAnimation />
      </div>
      <p className="text-[0.7rem] sm:text-lg md:text-[0.9rem] font-bold font-sora">
        {header}
      </p>
      <p className="text-[0.4rem] sm:text-sm md:text-[0.8rem] font-semibold font-sora text-center md:px-10 sm:px-3 px-1 w-full text-gray-400">
        {content}
      </p>
      <button
        className="done-btn font-sora font-extrabold text-sm md:text-[0.8rem]"
        onClick={handleDone}
      >
        {done}
      </button>
    </div>
  );
};

export default PasswordResetEmailDesign;
