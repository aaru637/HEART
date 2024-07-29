import React, { useState } from "react";
import { header, content, send } from "../../../utils/ForgotPasswordPageUtils";
import "react-toastify/dist/ReactToastify.css";
import { ToastContainer, toast } from "react-toastify";
import toastData from "../../../utils/toast/toastData";
import {
  header_style,
  input_field,
} from "../../common/login-signup-styles/LoginSignupCommonStyles";
import { useNavigate } from "react-router-dom";

const ForgotPasswordForm = () => {
  let navigate = useNavigate();
  const [email, setEmail] = useState("");

  const handleInputChange = (event) => {
    setEmail(event.target.value);
  };

  const handleSendEmail = () => {
    if (email === "") {
      toast.error("Email must not be empty.", toastData);
    } else {
      navigate("/auth/password-reset-email", { replace: true });
    }
  };
  return (
    <div className="flex flex-col gap-6 lg:gap-10 text-white m-4 justify-start md:w-[70vw] xl:w-[60vw]">
      <p className={header_style}>{header}</p>
      <p className="text-[0.6rem] sm:text-sm md:text-[0.8rem] font-semibold font-sora w-full">
        {content}
      </p>
      <input
        type="text"
        name="email"
        placeholder="Email"
        onChange={handleInputChange}
        value={email}
        className={`email-input-field ${input_field} ${
          email === "" ? "border-red-600" : "border-blue-600"
        }`}
      />
      <button
        className="send-email-btn font-sora font-extrabold  text-sm md:text-[0.8rem]"
        onClick={handleSendEmail}
      >
        {send}
      </button>
      <ToastContainer />
    </div>
  );
};

export default ForgotPasswordForm;
