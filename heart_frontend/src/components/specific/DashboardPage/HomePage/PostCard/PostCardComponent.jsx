import React, { useState } from "react";
import PostCardHeaderComponent from "./PostCardHeaderComponent";
import PostCardContentComponent from "./PostCardContentComponent";
import PostCardInteractionComponent from "./PostCardInteractionComponent";
import PostCardLikesComponent from "./PostCardLikesComponent";
import PostCardCommentsComponent from "./PostCardCommentsComponent";

const PostCardComponent = ({ item, openDrawer, handleCommentModal }) => {
  const [heartAnimation, setHeartAnimation] = useState(false);
  const [likeClicked, setLikeClicked] = useState(false);

  const handleHeartAnimation = () => {
    setLikeClicked(!likeClicked);
    if (!likeClicked) {
      setHeartAnimation(true);
      setTimeout(() => setHeartAnimation(false), 700);
    }
  };
  return (
    <div className="flex flex-col justify-start bg-black shadow-white shadow-inner text-white m-2 rounded-xl ">
      <PostCardHeaderComponent item={item} />
      <PostCardContentComponent
        item={item}
        handleHeartAnimation={handleHeartAnimation}
        heartAnimation={heartAnimation}
      />
      <PostCardInteractionComponent
        likeClicked={likeClicked}
        item={item}
        handleHeartAnimation={handleHeartAnimation}
        openDrawer={openDrawer}
        handleCommentModal={handleCommentModal}
      />
      <PostCardLikesComponent item={item} />
      <PostCardCommentsComponent
        item={item}
        handleCommentModal={handleCommentModal}
      />
    </div>
  );
};

export default PostCardComponent;
