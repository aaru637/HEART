import React from "react";
import { LikeColor } from "../../../../../utils/PostCardUtils";
import "./post-card-style.css";
import "react-lazy-load-image-component/src/effects/blur.css";
// import PostImageCard from "../../../../layout/PostImageCard";
import PostVideoCard from "../../../../layout/PostVideoCard";

const PostCardContentComponent = ({
  item,
  handleHeartAnimation,
  heartAnimation,
}) => {
  return (
    <div
      className="max-h-[600px] w-[100%] relative cursor-pointer"
      onDoubleClick={() => handleHeartAnimation()}
    >
      <div className="absolute w-full h-full flex justify-center items-center">
        {heartAnimation && (
          <LikeColor
            className={`w-1/3 h-1/3 z-[3] ${
              heartAnimation && "like-animation"
            }`}
          />
        )}
      </div>
      <PostVideoCard item={item} />
      {/* {item.type === "image" ? (
      ) : (
        <PostVideoCard item={item} />
      )} */}
    </div>
  );
};

export default PostCardContentComponent;
