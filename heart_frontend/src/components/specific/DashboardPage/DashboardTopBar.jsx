import React from "react";
import { heartLogoLight } from "../../../utils/DashboardPageUtils";
import { Notifications, Settings } from "@mui/icons-material";
import { CustomBottomBarIcons } from "./DashboardBottomNavigationBar";
import { useNavigate } from "react-router-dom";

const DashboardTopBar = ({ index, setIndex }) => {
  const navigate = useNavigate();
  return (
    <div className="fixed z-10 text-white bg-black top-0 left-0 right-0  h-[5rem] flex justify-between items-center px-4">
      <img
        src={heartLogoLight}
        width={90}
        height={90}
        alt="Heart Logo"
        className="cursor-pointer"
        onClick={() => {
          setIndex("home");
        }}
      />
      <div className="flex gap-5">
        <CustomBottomBarIcons
          Component={Notifications}
          index={index}
          navigate={navigate}
          setIndex={setIndex}
          value={"notifications"}
          key={"notifications"}
        />
        <CustomBottomBarIcons
          Component={Settings}
          index={index}
          navigate={navigate}
          setIndex={setIndex}
          value={"settings"}
          key={"settings"}
        />
      </div>
    </div>
  );
};

export default DashboardTopBar;
