import { LocationOnRounded, MoreHoriz } from "@mui/icons-material";
import { Avatar } from "@mui/material";
import React from "react";
import ben from "../../../../../assets/images/BEN.jpg";

const PostCardHeaderComponent = ({ item }) => {
  return (
    <div className="flex justify-between items-center p-3">
      <div className="flex items-center justify-start gap-3 cursor-pointer">
        <Avatar
          src={ben}
          variant="rounded"
          sx={{
            width: 40,
            height: 40,
          }}
        />
        <div className="flex flex-col items-start justify-center gap-1">
          <p className="font-bree tracking-wide text-[12px] lg:text-[14px] font-[600] line-clamp-1 cursor-pointer">
            {"Dhineshkumar D"}
          </p>
          <div className="flex gap-1 items-center cursor-pointer">
            <LocationOnRounded
              sx={{ fontSize: 15 }}
              className="text-blue-500"
            />
            <p className="font-roboto font-[600] tracking-wide text-[11px] lg:text-[13px] text-blue-500 line-clamp-1 pr-5">
              {"GCE DPI"}
            </p>
          </div>
        </div>
      </div>
      <div className="pr-2 cursor-pointer">
        <MoreHoriz sx={{ width: 30, height: 30 }} />
      </div>
    </div>
  );
};

export default PostCardHeaderComponent;
