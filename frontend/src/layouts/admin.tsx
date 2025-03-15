/* eslint-disable prettier/prettier */
import { useState, useEffect } from "react";
import { Routes, Route, Link, useLocation } from "react-router-dom";
import { Button, ScrollShadow } from "@heroui/react";

import { siteConfig } from "@/config/site";
import Dashboard from "@/pages/admin/dashboard";
import Destinos from "@/pages/admin/destinos";
import Barcos from "@/pages/admin/barcos";
import Cruceros from "@/pages/admin/cruceros";
import Reservas from "@/pages/admin/reservas";
import Usuarios from "@/pages/admin/usuarios";
import "../styles/admin/admin.css";
import { MenuIcon } from "@/components/icons";
import PuertosPage from "@/pages/admin/Puertos";
import FechasCruceroPage from "@/pages/admin/fechas-crucero";
import HabitacionesPage from "@/pages/admin/habitaciones";
import ItinerariosPage from "@/pages/admin/itinerarios";
import DetallesHabitacionPage from "@/pages/admin/detallesHabitacion";
import PreciosHabitacionPage from "@/pages/admin/preciosHabitacion";
import Pruebas from "@/pages/admin/pruebas";
import { Provider } from "@/types/provider";

export default function DefaultLayout() {
  const [select, setSelct] = useState(0);
  const [viewSidebar, setViewSidebar] = useState(true);

  const getSelectedIndex = () => {
    const currentPath = location.pathname;
    const selectedItem = siteConfig.navAdmin.findIndex(
      (item) => currentPath.startsWith(item.href) && item.href !== "/",
    );

    return selectedItem !== -1 ? selectedItem : 0;
  };

  useEffect(() => {
    // Actualiza el índice seleccionado cuando cambia la ruta
    setSelct(getSelectedIndex());
  }, [location.pathname]);

  const getIcon = (menu: string) => {
    switch (menu) {
      case "Dashboard":
        return <i className="fi fi-rr-dashboard-panel" />;
      case "Gestion de Destinos":
        return <i className="fi fi-rr-usa-map-pin" />;
      case "Gestion de Barcos":
        return <i className="fi fi-rr-ship" />;
      case "Gestion de Cruceros":
        return <i className="fi fi-rr-ship-side" />;
      case "Gestion de Reservas":
        return <i className="fi fi-rr-reservation-table" />;
      case "Gestion de Usuarios":
        return <i className="fi fi-rr-users-alt" />;
      case "Pruebas":
        return <i className="fi fi-rr-bullseye" />;
      default:
        break;
    }
  };

  return (
    <div className="h-[calc(100vh-60px)] flex flex-col">
      <main className="flex flex-grow overflow-hidden">
        <div className={`sidebar ${viewSidebar ? "view" : "hide"}`}>
          <div>
            {" "}
            {/* w-60 bg-primary p-1 border-r h-[calc(100vh-60px)] flex-shrink-0 */}
            <Button
              className={`icon justify-${viewSidebar ? "end" : "start"} btn`}
              onPress={() => setViewSidebar(!viewSidebar)}
            >
              <MenuIcon />
            </Button>
            <nav className="">
              {siteConfig.navAdmin.map((item, index) => (
                <Button
                  key={item.label}
                  as={Link}
                  className={`justify-start btn ${select === index ? "select" : ""}`}
                  to={item.href}
                  onPress={() => setSelct(index)}
                >
                  {getIcon(item.label)} {item.label}
                </Button>
              ))}
            </nav>
          </div>
          <footer className="w-full flex text-center items-center justify-center py-3">
            <p className="text-background">
              © 2025 <strong>Sunrise</strong>. Todos los derechos reservados.
            </p>
          </footer>
        </div>

        {/* Contenedor Dinámico con scroll */}
        <ScrollShadow className="flex-grow overflow-auto h-[calc(100vh-60px)]">
          <div className="flex-grow w-full flex p-3">
            <Routes>
              <Route element={<Dashboard />} path="" />
              <Route element={<Dashboard />} path="dashboard/*" />
              <Route element={<Destinos />} path="destinos/*" />
              <Route element={<Barcos />} path="barcos/*" />
              <Route element={<Cruceros />} path="cruceros/*" />
              <Route element={<Reservas />} path="reservas/*" />
              <Route element={<Usuarios />} path="usuarios/*" />
              <Route element={<Pruebas />} path="prueba/*" />
              <Route
                element={<PuertosPage />}
                path="destinos/puertos/:id_destino"
              />
              <Route
                element={<ItinerariosPage />}
                path="cruceros/itinerarios/:id_crucero"
              />
              <Route
                element={<FechasCruceroPage />}
                path="cruceros/fechas/:id_crucero"
              />
              <Route
                element={<PreciosHabitacionPage />}
                path="cruceros/fechas/precios/:id_fecha"
              />
              <Route
                element={<DetallesHabitacionPage />}
                path="barcos/habitaciones/detalles/:id_habitacion"
              />
              <Route
                element={<HabitacionesPage />}
                path="barcos/habitaciones/:id_barco"
              />
            </Routes>
          </div>
        </ScrollShadow>
      </main>
    </div>
  );
}
