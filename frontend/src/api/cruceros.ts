// src/api/cruceros.ts
import { handleResponse } from "./auth";

export interface Crucero {
  id_crucero: number;
  nombre: string;
  foto: string;
  cantidad_dias: number;
  id_barco: number;
  id_destino: number;
}

export interface FechaCrucero {
  id_fecha: number;
  id_crucero: number;
  fecha_inicio: string;
  fecha_limite_pago: string;
}

const API_URL = "http://localhost:8000/api";

export const cruceroService = {
  async getAll(): Promise<Crucero[]> {
    const response = await fetch(`${API_URL}/cruceros`, {
      method: "GET",
      headers: {
        Accept: "application/json",
      },
    });

    return handleResponse<Crucero[]>(response);
  },

  async getItinerarios(id_crucero: number): Promise<any[]> {
    const response = await fetch(`${API_URL}/itinerarios/${id_crucero}`, {
      method: "GET",
      headers: {
        Accept: "application/json",
      },
    });

    return handleResponse(response);
  },
};

export const fechaCruceroService = {
  async getAll(): Promise<FechaCrucero[]> {
    const response = await fetch(`${API_URL}/fechas-crucero`);

    return handleResponse(response);
  },

  getByCrucero: async (id_crucero: number): Promise<FechaCrucero[]> => {
    const response = await fetch(`${API_URL}/fechas-crucero/${id_crucero}`);

    return handleResponse(response);
  },
};
