import axios from "axios";
import { handleResponse } from "./auth";
import { Habitacion } from "./habitaciones";

export interface Barco {
  id: number;
  nombre: string;
  cant_pasajeros: number;
  cant_tripulantes: number;
  velocidad: number;
  tonelaje: number;
  altura: number;
  largo: number;
  ancho: number;
  año: number;
  habitaciones?: Habitacion[];
}

const API_URL = "http://localhost:8000/api";

export const barcoService = {
  async getAll(): Promise<Barco[]> {
    const response = await axios.get(`${API_URL}/barcos`);

    return response.data.data;
  },

  async getById(id_barco: number): Promise<Barco> {
    const response = await axios.get(`${API_URL}/barcos?id=${id_barco}`);

    return response.data.data;
  },
};
