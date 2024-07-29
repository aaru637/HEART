import React from "react";
import facebook from "../../../assets/icons/facebook.png";
const FacebookButton = () => {
  return (
    <button className="facebook-btn flex flex-row justify-center items-center w-[120px] sm:w-[150px] gap-2 p-2">
      <img src={facebook} alt="facebook" width={25} height={25} />
      <div className="text-[0.8rem] sm:text-[0.9rem] font-bold text-white">
        Facebook
      </div>
    </button>
  );
};

export default FacebookButton;
