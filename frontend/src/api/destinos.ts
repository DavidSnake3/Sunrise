import axios from "axios";

import { Puerto } from "./puertos";

export interface Destino {
  id: number;
  nombre: string;
  foto: string;
  puertos?: Puerto[];
}

const API_URL = "http://localhost:8000/api";

export const destinoService = {
  async getAll(): Promise<Destino[]> {
    const response = await axios.get(`${API_URL}/destinos`);

    return response.data.data;
  },

  async getById(id: number): Promise<Destino> {
    const response = await axios.get(`${API_URL}/destinos?id=${id}`);

    return response.data.data;
  },
  async store(destino: { nombre: string; foto: string }): Promise<Destino> {
    const response = await axios.post(`${API_URL}/destinos`, destino);

    return response.data.data;
  },

  async update(id: number, destino: Partial<Destino>): Promise<Destino> {
    const response = await axios.patch(`${API_URL}/destinos/${id}`, destino);

    return response.data.data;
  },

  async deactivate(id: number): Promise<{ message: string }> {
    const response = await axios.delete(`${API_URL}/destinos/${id}`);

    return response.data;
  },
};
