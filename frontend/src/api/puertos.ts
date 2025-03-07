// src/api/puertos.ts
import { handleResponse } from "./auth";

export interface Puerto {
  id_puerto: number;
  id_destino: number;
  nombre: string;
  pais: string;
  foto: string;
}

const API_URL = "http://localhost:8000/api";

export const puertoService = {
  async getByBarco(barcoId: number): Promise<Puerto[]> {
    const response = await fetch(`${API_URL}/puertos/por-barco/${barcoId}`);

    return handleResponse<Puerto[]>(response);
  },

  async getByDestino(destinoId: number): Promise<Puerto[]> {
    const response = await fetch(`${API_URL}/puertos/por-destino/${destinoId}`);

    return handleResponse<Puerto[]>(response);
  },

  async getAll(): Promise<Puerto[]> {
    const response = await fetch(`${API_URL}/puertos`);

    return handleResponse<Puerto[]>(response);
  },
};
