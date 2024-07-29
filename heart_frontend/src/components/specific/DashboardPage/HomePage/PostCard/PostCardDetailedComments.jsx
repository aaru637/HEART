import React, { useState } from "react";
import { LikeBorder, LikeColor } from "../../../../../utils/PostCardUtils";

const PostCardDetailedComments = ({ value, username }) => {
  const [likeClicked, setLikeClicked] = useState(false);
  const [showMore, setShowMore] = useState(false);

  return (
    <div className="px-4 pb-3 flex gap-3 justify-between items-start">
      <div>
        <span className="text-sm font-bold cursor-pointer font-bree">
          {username}
        </span>{" "}
        <span className="text-xs font-semibold cursor-auto font-ubuntu">
          {!showMore ? value.substring(0, 51) : value}{" "}
          <span
            className="text-[0.8rem] font-bold font-ubuntu text-gray-500 cursor-pointer"
            onClick={() => {
              setShowMore(!showMore);
            }}
          >
            {!(value.length <= 50) && (showMore ? "...less" : "...more")}
          </span>
        </span>
      </div>
      <div>
        {likeClicked ? (
          <LikeColor
            width={25}
            height={25}
            className="cursor-pointer"
            onClick={() => setLikeClicked(!likeClicked)}
          />
        ) : (
          <LikeBorder
            width={25}
            height={25}
            className="cursor-pointer"
            onClick={() => {
              setLikeClicked(!likeClicked);
            }}
          />
        )}
      </div>
    </div>
  );
};

export default PostCardDetailedComments;
