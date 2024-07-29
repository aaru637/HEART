import { Modal } from "flowbite-react";
import React from "react";
import CommentsHeader from "./CommentsHeader";
import CommentsBody from "./CommentsBody";
import CommentsFooter from "./CommentsFooter";

const CommentsComponent = ({ openDrawer, setOpenDrawer }) => {
  return (
    <>
      <Modal
        show={openDrawer}
        onClose={() => setOpenDrawer(false)}
        position={"bottom-center"}
        className="w-full md:w-[60%] h-full max-h-[80%]"
      >
        <Modal.Header>
          <CommentsHeader setOpenDrawer={setOpenDrawer} />
          <CommentsBody />
          <CommentsFooter />
        </Modal.Header>
      </Modal>
    </>
  );
};

export default CommentsComponent;
