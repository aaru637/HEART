import React from "react";
import VerifyEmailAddressDesign from "../../components/specific/VerifyEmailAddressPage/VerifyEmailAddressDesign";
import "../../components/specific/VerifyEmailAddressPage/verify-email-address-style.css";

const VerifyEmailAddressPage = () => {
  return (
    <div className="bg-black h-[100vh] flex flex-col items-center justify-end gap-2 p-8 text-white">
      <VerifyEmailAddressDesign />
    </div>
  );
};

export default VerifyEmailAddressPage;
