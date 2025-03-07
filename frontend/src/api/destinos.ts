import { handleResponse } from "./auth";

export interface Destino {
  id_destino: number;
  nombre: string;
  foto: string;
  pais: string;
}

const API_URL = "http://localhost:8000/api";

export const destinoService = {
  async getAll(): Promise<Destino[]> {
    const response = await fetch(`${API_URL}/destinos`);

    return handleResponse<Destino[]>(response);
  },

  async getPuertos(destinoId: number): Promise<any[]> {
    const response = await fetch(`${API_URL}/destinos/${destinoId}/puertos`);

    return handleResponse(response);
  },
};
