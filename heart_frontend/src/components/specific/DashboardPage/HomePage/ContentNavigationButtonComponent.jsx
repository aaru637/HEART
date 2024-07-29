import React from "react";
import "../HomePage/home-page-style.css";

const ContentNavigationButtonComponent = ({ text, index, setIndex, value }) => {
  return (
    <button
      className={`btn font-sora font-extrabold text-[0.5rem] md:text-[0.65rem] py-[0.5rem] px-[1rem] hover:scale-110 ${
        index === value && "scale-110"
      }`}
      onClick={() => setIndex(value)}
    >
      {text}
    </button>
  );
};

export default ContentNavigationButtonComponent;
