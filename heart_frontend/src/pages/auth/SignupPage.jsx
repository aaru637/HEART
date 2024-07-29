import React from "react";
import SignupDesign from "../../components/specific/SignupPage/SignupDesign";
import SignupForm from "../../components/specific/SignupPage/SignupForm";
import "../../components/specific/SignupPage/signup-page-style.css";

const SignupPage = () => {
  return (
    <div className="bg-black min-h-screen flex flex-col md:flex-row items-center self-end gap-2 md:justify-evenly justify-center p-8 text-white">
      <SignupDesign />
      <SignupForm />
    </div>
  );
};

export default SignupPage;
