import { handleResponse } from "./auth";
import { Habitacion } from "./habitaciones";

const API_URL = "http://localhost:8000/api";

export interface PrecioHabitacion {
  id_precio: number;
  id_fecha: number;
  id_habitacion: number;
  precio: number;
  habitacion?: Habitacion;
}

export const precioHabitacionService = {
  getPrecio: async (
    id_habitacion: number,
    id_fecha: number,
  ): Promise<PrecioHabitacion> => {
    const response = await fetch(
      `${API_URL}/precio-habitacion/${id_habitacion}/${id_fecha}`,
    );

    return handleResponse(response);
  },

  getPrecioPorFecha: async (id_fecha: number): Promise<PrecioHabitacion[]> => {
    const response = await fetch(`${API_URL}/precio-habitacion/${id_fecha}`);

    return handleResponse(response);
  },

  getALL: async (): Promise<PrecioHabitacion[]> => {
    const response = await fetch(`${API_URL}/precio-habitacion`);

    return handleResponse(response);
  },
};
