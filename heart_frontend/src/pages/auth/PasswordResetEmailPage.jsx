import React from "react";
import PasswordResetEmailDesign from "../../components/specific/PasswordResetEmailPage/PasswordResetEmailDesign";
import "../../components/specific/PasswordResetEmailPage/password-reset-email-page-style.css";

const PasswordResetEmailPage = () => {
  return (
    <div className="bg-black h-[100vh] flex flex-col items-center justify-end gap-2 p-8 text-white">
      <PasswordResetEmailDesign />
    </div>
  );
};

export default PasswordResetEmailPage;
