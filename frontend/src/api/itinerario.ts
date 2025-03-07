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

export const itinerarioService = {
  getByCrucero: async (id_crucero: number): Promise<Itinerario[]> => {
    const response = await fetch(`${API_URL}/itinerarios/${id_crucero}`);

    return handleResponse(response);
  },
};
