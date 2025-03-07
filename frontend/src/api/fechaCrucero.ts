import { handleResponse } from "./auth";

const API_URL = "http://localhost:8000/api";

export interface FechaCrucero {
  id_fecha: number;
  id_crucero: number;
  fecha_inicio: string;
  fecha_limite_pago: string;
}

export const fechaCruceroService = {
  getByCrucero: async (id_crucero: number): Promise<FechaCrucero[]> => {
    const response = await fetch(`${API_URL}/fechas-crucero/${id_crucero}`);

    return handleResponse(response);
  },
};
