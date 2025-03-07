import {
  createContext,
  useContext,
  useEffect,
  useState,
  ReactNode,
} from "react";

import { authService, UserData } from "../api/auth";

interface AuthContextType {
  user: UserData | null;
  loading: boolean;
  login: (token: string) => void;
  logout: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType>({} as AuthContextType);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<UserData | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const token = localStorage.getItem("authToken");

    if (token) {
      checkAuth(token);
    } else {
      setLoading(false);
    }
  }, []);

  const checkAuth = async (token: string) => {
    try {
      const userData = await authService.getMe(token);

      setUser(userData);
    } catch (error) {
      console.error("Error de autenticación:", error);
      logout();
    } finally {
      setLoading(false); // Asegurarnos de que loading sea false después de procesar el usuario
    }
  };
  const login = (token: string) => {
    console.log("Iniciando sesión con token:", token);
    localStorage.setItem("authToken", token); // Guardar token en localStorage
    setLoading(true);
    setTimeout(() => checkAuth(token), 100); // Verificar el token después de guardarlo
  };

  const logout = async () => {
    const token = localStorage.getItem("authToken");

    if (token) {
      await authService.logout(token); // Llamada a logout si existe el token
    }
    localStorage.removeItem("authToken");
    setUser(null); // Resetear estado
    setLoading(false); // Cuando haces logout, cambiar estado de loading
  };

  return (
    <AuthContext.Provider value={{ user, loading, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
