import React from "react";
import { Navigate, Outlet } from "react-router";

const PublicRoutes: React.FC = () => {
  const token = localStorage.getItem("token");

  return token ? <Navigate to="/" /> : <Outlet />;
};

export default PublicRoutes;
