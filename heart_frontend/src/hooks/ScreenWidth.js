import { useEffect, useState } from "react";

const useScreenWidth = () => {
  const [width, setWidth] = useState(window.innerWidth);

  useEffect(() => {
    const handleResize = () => {
      setWidth(window.innerWidth);
    };
    window.addEventListener("resize", handleResize);
    return () => {
      window.removeEventListener("resize", handleResize);
    };
  }, []);
  return [width < 640 ? 1 : width < 1060 ? 2 : 3, width];
};

export default useScreenWidth;
