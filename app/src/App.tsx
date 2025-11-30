import React, { Suspense, lazy } from "react";
import { Route, Routes } from "react-router";

const PrivateRoutes = lazy(() => import("./lib/private-routes"));
const PublicRoutes = lazy(() => import("./lib/public-routes"));
const CreateWorkspace = lazy(() => import("./pages/create-workspace/create-workspace-page"));
const Workspace = lazy(() => import("./pages/workspace/workspace-page"));
const Login04 = lazy(() => import("./pages/login/login-page"));
const Suspense01 = lazy(() => import("./components/suspense-ui"));
const Home = lazy(() => import("./pages/home/Home"));
const Settings = lazy(() => import("./pages/settings/settings-page"));
const Catalouge = lazy(() => import("./pages/catalogue/catalogue-page"));

const App: React.FC = () => {
  return (
    <Suspense fallback={<Suspense01 />}>
      <Routes>
        <Route element={<PublicRoutes />}>
        <Route path="/login" element={<Login04 />} />
        <Route path="/create-workspace" element={<CreateWorkspace />} />
        </Route>
        <Route element={<PrivateRoutes />}>
          <Route path="/" element={<Home />} />
          <Route path="*" element={<Home />} />
          <Route path="/plans-settings" element={<Workspace />} />
          <Route path="/settings" element={<Settings />} />
          <Route path="/catalogue" element={<Catalouge />} />
        </Route>
      </Routes>
    </Suspense>
  );
};

export default App;
