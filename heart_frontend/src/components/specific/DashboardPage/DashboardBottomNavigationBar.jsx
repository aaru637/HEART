import {
  AddBoxRounded,
  EmailRounded,
  Home,
  Person2,
  Search,
} from "@mui/icons-material";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import useScreenWidth from "../../../hooks/ScreenWidth";

const DashboardBottomNavigationBar = ({ index, setIndex }) => {
  let navigate = useNavigate();

  useEffect(() => {
    navigate(`/${index}`, { replace: true });
  }, [index, navigate]);
  return (
    <div className="fixed text-white bottom-0 left-0 right-0 w-full h-[3rem] bg-black flex justify-around items-center rounded-t-lg z-10">
      <CustomBottomBarIcons
        Component={Home}
        index={index}
        navigate={navigate}
        setIndex={setIndex}
        value={"home"}
        key={"home"}
      />
      <CustomBottomBarIcons
        Component={Search}
        index={index}
        navigate={navigate}
        setIndex={setIndex}
        value={"search"}
        key={"search"}
      />
      <CustomBottomBarIcons
        Component={AddBoxRounded}
        index={index}
        navigate={navigate}
        setIndex={setIndex}
        value={"add-post"}
        key={"add-post"}
      />
      <CustomBottomBarIcons
        Component={EmailRounded}
        index={index}
        navigate={navigate}
        setIndex={setIndex}
        value={"inbox"}
        key={"inbox"}
      />
      <CustomBottomBarIcons
        Component={Person2}
        index={index}
        navigate={navigate}
        setIndex={setIndex}
        value={"profile"}
        key={"profile"}
      />
    </div>
  );
};

const CustomBottomBarIcons = ({
  index,
  setIndex,
  navigate,
  Component,
  value,
}) => {
  const [, width] = useScreenWidth();
  return (
    <Component
      sx={{
        color: "white",
        fontSize: `${
          width < 640 ? "1.3rem" : width < 900 ? "1.5rem" : "1.7rem"
        }`,
      }}
      onClick={() => {
        setIndex(value);
        navigate(`/${value}`, { replace: true });
      }}
      className={`${
        index === value && "scale-125 drop-shadow-[0px_0px_3px_white]"
      } cursor-pointer hover:scale-125 hover:drop-shadow-[0px_0px_3px_white]`}
    />
  );
};

export { CustomBottomBarIcons };

export default DashboardBottomNavigationBar;
