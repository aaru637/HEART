import React from "react";
import {
  content,
  cont,
  resend,
  header,
} from "../../../utils/VerifyEmailAddressPageUtils";
import { animation_design_style } from "../../common/login-signup-styles/LoginSignupCommonStyles";
import { useNavigate } from "react-router-dom";
import VerifyEmailAddressAnimation from "./../../lottie-animation/VerifyEmailAddressAnimation";

const VerifyEmailAddressDesign = () => {
  let navigate = useNavigate();
  const handleContinue = () => navigate("/auth/login", { replace: true });
  const handleResend = () => {};
  return (
    <div className="text-center flex flex-col justify-end items-center w-[50vw] gap-6">
      <div className={animation_design_style}>
        <VerifyEmailAddressAnimation />
      </div>
      <p className="text-[0.7rem] sm:text-lg md:text-[0.9rem] font-bold font-sora">
        {header}
      </p>
      <p className="text-[0.4rem] sm:text-sm md:text-[0.8rem] font-semibold font-sora text-center md:px-10 sm:px-3 px-1 w-full text-gray-400">
        {"dhandapanisakthi123@gmail.com"}
      </p>
      <p className="text-[0.4rem] sm:text-sm md:text-[0.8rem] font-semibold font-sora text-center md:px-10 sm:px-3 px-1 w-full text-gray-400">
        {content}
      </p>
      <button
        className="continue-btn font-sora font-extrabold text-sm md:text-[0.8rem]"
        onClick={handleContinue}
      >
        {cont}
      </button>
      <button
        className="resend-btn font-sora font-extrabold text-sm md:text-[0.8rem]"
        onClick={handleResend}
      >
        {resend}
      </button>
    </div>
  );
};

export default VerifyEmailAddressDesign;
