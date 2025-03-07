import { useNavigate } from "react-router-dom"; // Para redirigir al login

import { useAuth } from "../contexts/AuthContext";

const AdminRoute = ({ children }: { children: JSX.Element }) => {
  const { user, loading } = useAuth();
  const navigate = useNavigate();

  // Si el usuario está cargando, no mostramos nada
  if (loading) return <div>Loading...</div>;

  // Si no hay usuario logueado o no es admin, redirigimos
  if (!user || user.admin !== 1) {
    navigate("/"); // Redirigir al login

    return null;
  }

  return children; // Si es admin, renderizamos la ruta protegida
};

export default AdminRoute;
