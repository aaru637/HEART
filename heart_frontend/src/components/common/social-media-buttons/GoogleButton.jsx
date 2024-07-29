import React from "react";
import google from "../../../assets/icons/google.png";
import "./social-media-button-styles.css";

const GoogleButton = () => {
  return (
    <button className="google-btn flex flex-row justify-center items-center w-[120px] sm:w-[150px] gap-2 p-2">
      <img src={google} alt="google" width={25} height={25} />
      <div className="text-[0.8rem] sm:text-[0.9rem] font-bold text-white">
        Google
      </div>
    </button>
  );
};

export default GoogleButton;
