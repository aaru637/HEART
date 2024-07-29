import React, { useState } from "react";
import {
  BookmarkColor,
  BookmarkBorder,
  Comment,
  LikeBorder,
  LikeColor,
  Send,
} from "../../../../../utils/PostCardUtils";
import { Circle } from "@mui/icons-material";

const PostCardInteractionComponent = ({
  item,
  handleHeartAnimation,
  likeClicked,
  setLikeClicked,
  openDrawer,
  handleCommentModal,
}) => {
  const [bookmarkClicked, setBookmarkClicked] = useState(false);
  return (
    <div className="w-full px-4 py-3 flex justify-between">
      <div className="flex gap-5">
        {likeClicked ? (
          <LikeColor
            width={25}
            height={25}
            className="cursor-pointer"
            onClick={() => handleHeartAnimation()}
          />
        ) : (
          <LikeBorder
            width={25}
            height={25}
            className="cursor-pointer"
            onClick={() => {
              handleHeartAnimation();
            }}
          />
        )}
        <Comment
          width={25}
          height={25}
          className="cursor-pointer"
          onClick={() => handleCommentModal()}
        />
        <Send width={25} height={25} className="cursor-pointer" />
      </div>
      <div className="flex gap-4 items-center">
        <div className="flex gap-2 items-center text-gray-500">
          <Circle sx={{ fontSize: "10px" }} />
          <p className="font-sora font-bold text-[10px] lg:text-[12px] ">
            {"01 December 2024"}
          </p>
        </div>
        {bookmarkClicked ? (
          <BookmarkColor
            width={25}
            height={25}
            className="cursor-pointer"
            onClick={() => setBookmarkClicked(!bookmarkClicked)}
          />
        ) : (
          <BookmarkBorder
            width={25}
            height={25}
            className="cursor-pointer"
            onClick={() => setBookmarkClicked(!bookmarkClicked)}
          />
        )}
      </div>
    </div>
  );
};

export default PostCardInteractionComponent;
