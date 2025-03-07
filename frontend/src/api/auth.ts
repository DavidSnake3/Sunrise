// src/api/auth.ts
interface LoginResponse {
  access_token: string;
  user: {
    id: number;
    nombre_completo: string;
    email: string;
  };
}

interface RegisterResponse extends LoginResponse {}

export interface UserData {
  id: number;
  nombre_completo: string;
  email: string;
  fecha_nacimiento: string;
  edad: number;
  genero: number;
  nacionalidad: string;
  telefono: string;
  admin: number;
}

const API_URL = "http://localhost:8000/api";

export const authService = {
  async login(email: string, password: string): Promise<LoginResponse> {
    const response = await fetch(`${API_URL}/auth/login`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({ email, password }),
    });

    return handleResponse<LoginResponse>(response);
  },

  async register(userData: {
    nombre_completo: string;
    email: string;
    password: string;
    password_confirmation: string;
    fecha_nacimiento: string;
    edad: number;
    genero: number;
    nacionalidad: string;
    telefono: string;
  }): Promise<RegisterResponse> {
    const response = await fetch(`${API_URL}/auth/register`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify(userData),
    });

    return handleResponse<RegisterResponse>(response);
  },

  async getMe(token: string): Promise<UserData> {
    try {
      const response = await fetch(`${API_URL}/me`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
      });

      if (!response.ok) {
        const errorData = await response.json(); // Obtén más detalles del error

        throw new Error(
          errorData.message || "Error al obtener los datos del usuario",
        );
      }

      return response.json();
    } catch (error) {
      console.error("Error en getMe:", error);
      throw error;
    }
  },

  async logout(token: string): Promise<void> {
    try {
      const response = await fetch(`${API_URL}/logout`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
      });

      if (!response.ok) {
        const errorData = await response.json(); // Obtén más detalles del error

        throw new Error(errorData.message || "Error al cerrar sesión");
      }
    } catch (error) {
      console.error("Error en logout:", error);
      throw error;
    }
  },

  async forgotPassword(email: string): Promise<void> {
    const response = await fetch(`${API_URL}/password/email`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({ email }),
    });

    if (!response.ok) {
      const errorData = await response.json();

      throw new Error(
        errorData.message || "Error al solicitar recuperación de contraseña",
      );
    }
  },

  async resetPassword(
    token: string,
    email: string, // Añade el email
    password: string,
    passwordConfirmation: string,
  ): Promise<void> {
    const response = await fetch(`${API_URL}/password/reset`, {
      // URL sin token
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({
        token, // Token en el body
        email, // Email del usuario
        password,
        password_confirmation: passwordConfirmation,
      }),
    });

    if (!response.ok) {
      const errorData = await response.json();

      throw new Error(
        errorData.message || "Error al restablecer la contraseña",
      );
    }
  },
};

export function handleResponse<T>(response: Response): Promise<T> {
  if (!response.ok) {
    return response.json().then((err) => {
      throw new Error(err.message);
    });
  }

  return response.json();
}
