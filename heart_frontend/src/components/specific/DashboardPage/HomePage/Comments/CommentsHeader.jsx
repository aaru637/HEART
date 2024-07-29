import { Close } from "@mui/icons-material";
import React from "react";

const CommentsHeader = ({ setOpenDrawer }) => {
  return (
    <div className="flex bg-slate-900 text-white">
      <div className="w-full justify-center items-center flex">
        {"Comments"}
      </div>
      <div
        className="text-right cursor-pointer"
        onClick={() => setOpenDrawer(false)}
      >
        <Close fontSize="medium" />
      </div>
    </div>
  );
};

export default CommentsHeader;
