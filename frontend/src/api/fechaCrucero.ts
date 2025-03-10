import axios from "axios";
import { handleResponse } from "./auth";
import { Habitacion } from "./habitaciones";

const API_URL = "http://localhost:8000/api";

export interface FechaCrucero {
  id: number;
  fecha_inicio: string;
  fecha_limite_pago: string;
  precios_habitaciones?: PrecioHabitacion[];
}

export interface PrecioHabitacion {
  id: number;
  precio: number;
  cantidad: number;
  habitacion?: Habitacion;
}

export const fechaCruceroService = {
  getByCrucero: async (id_crucero: number): Promise<FechaCrucero[]> => {
    const response = await axios.get(
      `${API_URL}/fechas?crucero_id=${id_crucero}`,
    );

    return response.data.data;
  },

  getPrecio: async (id_fecha: number): Promise<PrecioHabitacion[]> => {
    const response = await axios(
      `${API_URL}/precios_habitacion?fecha_id=${id_fecha}`,
    );

    return response.data.data;
  },
};
