import React from "react";
import LoginDesign from "../../components/specific/LoginPage/LoginDesign";
import LoginForm from "../../components/specific/LoginPage/LoginForm";
import "../../components/specific/LoginPage/login-page-style.css";

const LoginPage = () => {
  return (
    <div className="bg-black min-h-screen flex flex-col md:flex-row items-center self-end gap-2 md:justify-evenly justify-center p-8 text-white">
      <LoginDesign />
      <LoginForm />
    </div>
  );
};

export default LoginPage;
