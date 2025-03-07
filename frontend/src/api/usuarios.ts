import { handleResponse } from "./auth";

export interface Usuario {
  id_usuario: number;
  nombre_completo: string;
  admin: boolean;
  genero: string;
  edad: number;
  fecha_nacimiento: string;
  nacionalidad: string;
  telefono: string;
  email: string;
}

const API_URL = "http://localhost:8000/api";

export const usuarioService = {
  async getAll(): Promise<Usuario[]> {
    const response = await fetch(`${API_URL}/usuarios`);

    return handleResponse<Usuario[]>(response);
  },
};
