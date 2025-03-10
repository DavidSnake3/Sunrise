// src/api/puertos.ts
import axios from "axios";
import { handleResponse } from "./auth";
import { Destino } from "./destinos";

export interface Puerto {
  id: number;
  destino?: Destino;
  nombre: string;
  pais: string;
  foto: string;
}

const API_URL = "http://localhost:8000/api";

export const puertoService = {
  async getById(id: number): Promise<Puerto[]> {
    const response = await axios.get(`${API_URL}/puertos?id=${id}`);

    return response.data.data;
  },

  async getByDestino(destinoId: number): Promise<Puerto[]> {
    const response = await axios.get(
      `${API_URL}/puertos?destino_id=${destinoId}`,
    );

    return response.data.data;
  },

  async getAll(): Promise<Puerto[]> {
    const response = await axios.get(`${API_URL}/puertos`);

    return response.data.data;
  },
};
