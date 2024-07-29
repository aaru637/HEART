import React, { useState } from "react";
import "../components/specific/DashboardPage/dashboard-page-style.css";
import DashboardBottomNavigationBar from "../components/specific/DashboardPage/DashboardBottomNavigationBar";
import { Outlet } from "react-router-dom";
import DashboardTopBar from "../components/specific/DashboardPage/DashboardTopBar";

const DashboardPage = () => {
  const [index, setIndex] = useState("home");
  return (
    <div className="bg-black min-h-screen text-white flex flex-col items-center">
      <DashboardTopBar setIndex={setIndex} index={index} />
      <DashboardBottomNavigationBar setIndex={setIndex} index={index} />
      <Outlet />
    </div>
  );
};

export default DashboardPage;
