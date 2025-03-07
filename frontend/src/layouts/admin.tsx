import React, { useState } from "react";
import { Routes, Route, Link, useLocation } from "react-router-dom";
import { siteConfig } from "@/config/site";
import { Navbar } from "@/components/navbar";
import Dashboard from "@/pages/admin/dashboard";
import Destinos from "@/pages/admin/destinos";
import Barcos from "@/pages/admin/barcos";
import Cruceros from "@/pages/admin/cruceros";
import Reservas from "@/pages/admin/reservas";
import Usuarios from "@/pages/admin/usuarios";
import Prueba from "@/pages/admin/pruebas";
import { Button, ScrollShadow } from "@heroui/react";
import "../styles/admin.css"
import { MenuIcon, DashBoardIcon, DestinoIcon } from "@/components/icons";


export default function DefaultLayout() {
  const [viewSidebar, setViewSidebar] = useState(true)
  const getIcon = (menu) => {
    switch (menu) {
      case "Dashboard":
        return <i class="fi fi-rr-dashboard-panel"></i>
        break;
      case "Gestion de Destinos":
        return <i class="fi fi-rr-usa-map-pin"></i>
        break;
        case "Gestion de Barcos":
          return <i class="fi fi-rr-ship"></i>
          break;
          case "Gestion de Cruceros":
          return <i class="fi fi-rr-ship-side"></i>
          break;
          case "Gestion de Reservas":
          return <i class="fi fi-rr-reservation-table"></i>
          break;
          case "Gestion de Usuarios":
            return <i class="fi fi-rr-users-alt"></i>
            break;
            case "Pruebas":
          return <i class="fi fi-rr-bullseye"></i>
          break;
      default:
        break;
    }
  }

console.log(useLocation().pathname)

  return (
    <div className="h-screen flex flex-col">
      {/* Navbar superior */}
      <Navbar />

      {/* Contenedor principal que ocupa el resto de la pantalla */}
      <main className="flex flex-grow overflow-hidden">
        {/* Navbar Lateral */}
        <div className={`sidebar ${viewSidebar ? "view" : "hide"}`}> {/* w-60 bg-primary p-1 border-r h-[calc(100vh-60px)] flex-shrink-0 */}
          <Button className={`icon justify-${viewSidebar ? "end" : "start"} btn`}  onPress={() => setViewSidebar(!viewSidebar)}><MenuIcon />
          </Button>
          <nav className="">
            {siteConfig.navAdmin.map((item, index) => (
              <Button
                key={item.label}
                className={`justify-start btn ${useLocation().pathname === item.href || (useLocation().pathname === "/admin" && item.label === "Dashboard") ? "select" : ""}`}
                as={Link}
                to={item.href}
              >
                {getIcon(item.label)} {item.label}
              </Button>
            ))}
          </nav>
        </div>

        {/* Contenedor Dinámico con scroll */}
        <ScrollShadow className="flex-grow overflow-auto h-[calc(100vh-60px)]">
          <div className="flex-grow w-full flex p-5">
            <Routes>
              <Route path="" element={<Dashboard />} />
              <Route path="dashboard" element={<Dashboard />} />
              <Route path="destinos" element={<Destinos />} />
              <Route path="barcos" element={<Barcos />} />
              <Route path="cruceros" element={<Cruceros />} />
              <Route path="reservas" element={<Reservas />} />
              <Route path="usuarios" element={<Usuarios />} />
              <Route path="prueba" element={<Prueba />} />
            </Routes>
          </div>
          <footer className="w-full flex items-center justify-center py-3 bg-gray-300">
            <p className="text-default-600">
              © 2025 <span className="text-primary">Sunrise</span>. Todos los derechos reservados.
            </p>
          </footer>
        </ScrollShadow>
      </main>

    </div>
  );
}
