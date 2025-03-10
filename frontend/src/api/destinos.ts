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
};
