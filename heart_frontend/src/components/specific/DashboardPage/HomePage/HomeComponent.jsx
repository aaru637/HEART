import React, { useEffect, useState } from "react";
import StoryCardComponent from "./StoryCardComponent";
import ContentNavigationButtonComponent from "./ContentNavigationButtonComponent";
import PostsLayout from "../../../layout/PostsLayout";
// import getImages from "../../../../services/ImageService";
import videos from "../../../../assets/videos/3D LOGO ANIMATION.mp4";
import CommentsComponent from "./Comments/CommentsComponent";

const HomeComponent = () => {
  const [openDrawer, setOpenDrawer] = useState(false);
  const [index, setIndex] = useState("recent");
  const [items, setItems] = useState([]);

  // const getData = async () => {
  //   let data = await getImages();
  //   setItems(data);
  // };

  const handleCommentModal = () => {
    setOpenDrawer(!openDrawer);
  };
  useEffect(() => {
    const data = {
      id: 12,
      video: videos,
    };
    // getData();
    setItems([data, data, data, data]);
  }, []);
  return (
    <div className="flex flex-col justify-start items-start text-white mt-[5.5rem] mb-[5rem]">
      <div
        style={{ scrollbarWidth: "none" }}
        className="flex overflow-x-auto overflow-y-hidden w-screen gap-2 px-2 h-fit"
      >
        <StoryCardComponent id={"id"} />
      </div>
      {/** Content Navigation Buttons */}
      <div className="flex justify-evenly items-center w-full my-7">
        <ContentNavigationButtonComponent
          text={"Recent"}
          index={index}
          value={"recent"}
          setIndex={setIndex}
        />
        <ContentNavigationButtonComponent
          text={"Following"}
          index={index}
          value={"following"}
          setIndex={setIndex}
        />
        <ContentNavigationButtonComponent
          text={"Trending"}
          index={index}
          value={"trending"}
          setIndex={setIndex}
        />
      </div>

      {index === "recent" ? (
        <PostsLayout
          data={items}
          openDrawer={openDrawer}
          handleCommentModal={handleCommentModal}
        />
      ) : index === "following" ? (
        <p>Following</p>
      ) : (
        <p>Trending</p>
      )}
      <CommentsComponent
        openDrawer={openDrawer}
        setOpenDrawer={setOpenDrawer}
      />
    </div>
  );
};

export default HomeComponent;
