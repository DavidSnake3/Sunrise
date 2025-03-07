// src/components/Navbar.tsx
import { useState, useEffect } from "react";
import { useLocation, Link as RouterLink, Link, useNavigate } from "react-router-dom";

import Logo2 from "/logo/Logo 6.png";

import {
  Navbar as HeroUINavbar,
  NavbarBrand,
  NavbarContent,
  NavbarItem,
  NavbarMenuToggle,
  NavbarMenu,
  NavbarMenuItem,
  Button,
  CircularProgress,
  Dropdown,
  DropdownTrigger,
  DropdownMenu,
  DropdownItem,
  Avatar,
  User,
} from "@heroui/react";

import { useAuth } from "../contexts/AuthContext";

import "../styles/Navbar.css";
import { Header } from "./header";
import Login from "./Login";
import SignUp from "./sign_UP";

import { siteConfig } from "@/config/site";

export const Navbar = () => {
  const navigate = useNavigate();
  const { user, logout, loading } = useAuth();
  const [isScrolled, setIsScrolled] = useState(false);
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const location = useLocation();

  // Estado para controlar el drawer de login
  const [isLoginOpen, setIsLoginOpen] = useState(false);

  // Estado para controlar el drawer de registro
  const [isSignUpOpen, setIsSignUpOpen] = useState(false);

  // Obtener el índice del item seleccionado
  const getSelectedIndex = () => {
    const currentPath = location.pathname;
    const selectedItem = siteConfig.navItems.findIndex(
      (item) => currentPath.startsWith(item.href) && item.href !== "/",
    );

    return selectedItem !== -1 ? selectedItem : 0;
  };

  const [navSelected, setNavSelected] = useState(getSelectedIndex());

  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 300) {
        setIsScrolled(true);
      } else {
        setIsScrolled(false);
      }
    };

    window.addEventListener("scroll", handleScroll);

    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  useEffect(() => {
    // Actualiza el índice seleccionado cuando cambia la ruta
    setNavSelected(getSelectedIndex());
  }, [location.pathname]);

  return (
    <>
      {!isMenuOpen && navSelected === 0 && <Header />}
      <HeroUINavbar
        disableAnimation
        className={`nav${!isScrolled && navSelected === 0 && !isMenuOpen ? " bg-primary" : "-scroll"}`}
        maxWidth="full"
        onMenuOpenChange={setIsMenuOpen}
      >
        <NavbarContent>
          <NavbarMenuToggle
            aria-label={isMenuOpen ? "Close menu" : "Open menu"}
            className="md:hidden"
          />
          <NavbarBrand>
            <a
              className={`nav-logo ${!isScrolled && !isMenuOpen && navSelected === 0 ? "hidden" : ""}`}
              onClick={() => navigate("/")}
            >
              <img alt="Sunrise" src={Logo2} />
            </a>
          </NavbarBrand>
        </NavbarContent>

        <NavbarContent className="hidden md:flex gap-4" justify="center">
          {siteConfig.navItems
            .filter(
              (item) => item.label !== "Administrativo" || (user && user.admin),
            ) // Mostrar solo si el usuario es admin
            .map((item, index) => (
              <NavbarMenuItem key={item.label}>
                <RouterLink
                  className={navSelected === index ? "select" : ""}
                  to={item.href}
                  onClick={() => setNavSelected(index)}
                >
                  {item.label}
                </RouterLink>
              </NavbarMenuItem>
            ))}
        </NavbarContent>

        <NavbarContent justify="end">
          {loading ? ( // Mientras se carga la autenticación, mostramos un mensaje
            <NavbarItem>
              <CircularProgress
                aria-label="Loading..."
                color={`${!isScrolled && !isMenuOpen ? "secondary" : "primary"}`}
              />
            </NavbarItem>
          ) : user ? (
            <div className="flex items-center gap-3 user">
              <Dropdown placement="bottom-start">
                <DropdownTrigger className="flex items-center gap-2">
                  <Link>
                    <div className="flex h-8 w-8 items-center justify-center rounded-full bg-white icon">
                      <span className="text-sm font-medium text-primary">
                        {user.nombre_completo[0].toUpperCase()}
                      </span>
                    </div>
                    <span className="text-white text hidden lg:flex">
                      Hola, {user.nombre_completo.split(" ")[0]}
                    </span>
                  </Link>
                </DropdownTrigger>
                <DropdownMenu
                  aria-label="User Actions"
                  variant="flat"
                  disabledKeys={["user"]}
                >
                  <DropdownItem key="user" className="lg:hidden">
                    <p className="font-bold">
                      Hola, {user.nombre_completo.split(" ")[0]}
                    </p>
                  </DropdownItem>
                  <DropdownItem key="settings">Mi perfil</DropdownItem>
                  <DropdownItem key="settings">Lista de amigos</DropdownItem>
                  <DropdownItem key="settings">Mis Rervaciones</DropdownItem>
                  <DropdownItem key="logout" color="danger" onPress={logout}>
                    <p className="logOut">Cerrar Sesion</p>
                  </DropdownItem>
                </DropdownMenu>
              </Dropdown>
            </div>
          ) : (
            <>
              <NavbarItem>
                <Button
                  className="login text-secondary-foreground"
                  color="primary"
                  variant="light"
                  onPress={() => setIsLoginOpen(true)}
                >
                  Iniciar Sesión
                </Button>
              </NavbarItem>
              <NavbarItem>
                <Button
                  as={RouterLink}
                  className="login text-secondary-foreground hidden lg:flex"
                  color="primary"
                  href="#"
                  variant="light"
                  onPress={() => setIsSignUpOpen(true)}
                >
                  Registrarse
                </Button>
              </NavbarItem>
            </>
          )}
        </NavbarContent>

        <NavbarMenu>
          {siteConfig.navItems.map((item, index) => (
            <NavbarMenuItem key={item.label}>
              <a
                className={`menu ${navSelected === index ? "select" : ""}`}
                href={item.href}
                onClick={() => {
                  setNavSelected(index);
                  setIsMenuOpen(false);
                }}
              >
                {item.label}
              </a>
            </NavbarMenuItem>
          ))}
        </NavbarMenu>
      </HeroUINavbar>

      {/* Renderiza el componente Login */}
      <Login
        isOpen={isLoginOpen}
        onOpenChange={setIsLoginOpen}
        onOpenSignUp={() => {
          setIsLoginOpen(false); // Cierra el drawer de login
          setIsSignUpOpen(true); // Abre el drawer de registro
        }}
      />

      {/* Renderiza el componente SignUp */}
      <SignUp
        isOpen={isSignUpOpen}
        onOpenChange={setIsSignUpOpen}
        onOpenLogin={() => {
          setIsLoginOpen(true); // Cierra el drawer de login
          setIsSignUpOpen(false); // Abre el drawer de registro
        }}
      />
    </>
  );
};
