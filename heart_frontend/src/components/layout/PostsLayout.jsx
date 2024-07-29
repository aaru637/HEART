import React from "react";
import useScreenWidth from "../../hooks/ScreenWidth";
import PostCardComponent from "../specific/DashboardPage/HomePage/PostCard/PostCardComponent";
import Masonry from "react-responsive-masonry";

const PostsLayout = ({ data, openDrawer, handleCommentModal }) => {
  const [dimension] = useScreenWidth();
  return (
    <Masonry columnsCount={dimension}>
      {data.map((item, index) => (
        <PostCardComponent
          key={index}
          item={item}
          openDrawer={openDrawer}
          handleCommentModal={handleCommentModal}
        />
      ))}
    </Masonry>
  );
};

export default PostsLayout;
