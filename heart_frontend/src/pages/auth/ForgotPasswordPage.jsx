import React from "react";
import ForgotPasswordForm from "../../components/specific/ForgotPasswordPage/ForgotPasswordForm";
import { MdChevronLeft } from "react-icons/md";
import { useNavigate } from "react-router-dom";
import "../../components/specific/ForgotPasswordPage/forgot-password-page-style.css";

const ForgotPasswordPage = () => {
  let navigate = useNavigate();
  return (
    <div className="bg-black min-h-screen flex flex-col gap-2 p-8 md:p-16 text-white">
      <MdChevronLeft
        className="w-[2rem] h-[2rem] cursor-pointer"
        onClick={() => navigate("/auth/login", { replace: true })}
      />
      <ForgotPasswordForm />
    </div>
  );
};

export default ForgotPasswordPage;
