import { Route, Routes } from "react-router-dom";

import AdminRoute from "./route/AdminRoute";

import IndexPage from "@/pages/index";
import DestinoPage from "@/pages/destino";
import BarcoPage from "@/pages/barco";
import CruceroPage from "@/pages/crucero";
import AdminPage from "@/layouts/admin";
import NostrosPage from "@/pages/nostros";
import ResetPassword from "@/pages/ResetPassword";

function App() {
  return (
    <Routes>
      <Route element={<IndexPage />} path="/" />
      <Route element={<DestinoPage />} path="/destinos/*" />
      <Route element={<CruceroPage />} path="/cruceros/*" />
      <Route element={<BarcoPage />} path="/barcos/*" />
      <Route element={<NostrosPage />} path="/nosotros/*" />
      <Route element={<ResetPassword />} path="/reset-password/*" />
      {/* Ruta protegida para admin */}
      <Route
        element={
          <AdminRoute>
            <AdminPage />
          </AdminRoute>
        }
        path="/admin/*"
      />

    </Routes>
  );
}

export default App;
