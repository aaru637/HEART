import React from "react";
import heart from "../../../../assets/images/profile.png";
import { Avatar } from "@mui/material";
import { AddRounded } from "@mui/icons-material";
const StoryCardComponent = ({ id }) => {
  return (
    <div className="py-2 flex flex-col gap-3 items-center text-center cursor-pointer hover:scale-110 hover:transition-all">
      <div
        className={`border-[2.9px] relative ${
          id === "id" ? "border-green-400" : "border-blue-500"
        } rounded-full w-fit`}
      >
        <Avatar
          alt="avatar"
          src={heart}
          sx={{ width: 60, height: 60 }}
          className="border-[2px] border-black bg-purple-400"
        />
        {id === "id" && (
          <div className="rounded-[100%] flex items-center justify-center absolute top-[40px] border-[3px] border-black left-[36px] bg-blue-500 w-fit">
            <AddRounded className="text-center" sx={{ fontSize: "1.2rem" }} />
          </div>
        )}
      </div>
      <p className="overflow-hidden font-sora font-semibold text-center w-[5rem] text-xs">
        {id === "id" ? "Add Story" : "Emma"}
      </p>
    </div>
  );
};

export default StoryCardComponent;
