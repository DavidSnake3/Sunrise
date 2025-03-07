import { handleResponse } from "./auth";

export interface DetalleHabitacion {
  id_detalle: number;
  id_habitacion: number;
  descripcion_larga: string;
  metros_cuadrados: number;
  cantidad_camas: number;
  tipo_cama: string;
  amenidades: string[];
  capacidad_maxima: number;
  vista_mar: boolean;
  balcon: boolean;
}

const API_URL = "http://localhost:8000/api";

export const detalleHabitacionService = {
  async getByHabitacion(id_habitacion: number): Promise<DetalleHabitacion> {
    const response = await fetch(
      `${API_URL}/habitaciones/${id_habitacion}/detalles`,
    );

    return handleResponse<DetalleHabitacion>(response);
  },
};
