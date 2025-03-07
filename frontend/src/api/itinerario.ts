// itinerarios.ts

import { handleResponse } from "./auth";

const API_URL = "http://localhost:8000/api";

export interface Itinerario {
  id_itinerario: number;
  id_crucero: number;
  dia: number;
  id_puerto: number;
  descripcion: string;
  hora_llegada: string;
  hora_salida: string;
}

export interface FechaCrucero {
  id_fecha: number;
  id_crucero: number;
  fecha_inicio: string;
  fecha_limite_pago: string;
  itinerarios?: Itinerario[];
}

export const itinerarioService = {
  getByCrucero: async (id_crucero: number): Promise<Itinerario[]> => {
    const response = await fetch(`${API_URL}/itinerarios/${id_crucero}`);

    return handleResponse(response);
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
