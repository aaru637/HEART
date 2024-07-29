import React from "react";
import PostCardDetailedComments from "./PostCardDetailedComments";

const PostCardCommentsComponent = ({ item, handleCommentModal }) => {
  return (
    <>
      {/* {item.comments.length === 0 ? (
        <></>
      ) : item.comments.length === 1 ? (
        <PostCardDetailedComments
          username={item.username}
          value={item.comments[0]}
        />
      ) : ( */}
      <>
        <PostCardDetailedComments
          username={"dhineshkumar_d_2002"}
          value={"fsfdsdf df bsd sdfg sd gsdfg sd gsdg dfg "}
        />
        <div className="px-4 pb-3 text-sm font-bold cursor-pointer font-bree text-gray-600 hover:text-slate-500 hover:drop-shadow-[0px_0px_10px_white]" onClick={() => handleCommentModal()}>
          {"View All Comments"}
        </div>
      </>
      {/* )} */}
    </>
  );
};

export default PostCardCommentsComponent;
