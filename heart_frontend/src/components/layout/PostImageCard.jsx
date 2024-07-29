import React from "react";
import { LazyLoadImage } from "react-lazy-load-image-component";

const PostImageCard = ({ item }) => {
  return (
    <LazyLoadImage
      key={item.id}
      width={"100%"}
      height={"100%"}
      src={item.src.tiny}
      alt={item.alt}
      effect="blur"
      className="w-full h-full"
    />
  );
};

export default PostImageCard;
