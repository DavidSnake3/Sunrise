// src/api/cruceros.ts
import axios from "axios";
import { handleResponse } from "./auth";
import { Barco } from "./barcos";
import { Destino } from "./destinos";
import { FechaCrucero } from "./fechaCrucero";
import { Puerto } from "./puertos";

export interface Crucero {
  id: number;
  nombre: string;
  foto: string;
  dias: number;
  descripcion: string;
  itinerarios?: Itinerario[];
  barco?: Barco;
  destino?: Destino;
  fechas?: FechaCrucero[];
  complementos?: any[];
}

export interface Itinerario {
  id: number;
  dia: number;
  puerto?: Puerto;
  descripcion: string;
  llegada: string;
  salida: string;
}

const API_URL = "http://localhost:8000/api";

export const crucerosGet = {
  async getAll(): Promise<Crucero[]> {
    const response = await axios.get(`${API_URL}/cruceros`);

    return response.data.data;
  },

  async getById(id: number): Promise<Crucero> {
    const response = await axios.get(`${API_URL}/cruceros?id=${id}`);

    return response.data.data;
  },

  async getItinerarios(id_crucero: number): Promise<Itinerario[]> {
    const response = await axios.get(
      `${API_URL}/itinerarios?crucero_id=${id_crucero}`,
    );

    return response.data.data;
  },
};
