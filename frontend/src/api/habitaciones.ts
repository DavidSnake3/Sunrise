// src/api/habitaciones.ts
import { handleResponse } from "./auth";

const API_URL = "http://localhost:8000/api";

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

// Eliminar la importación conflictiva si existe
export interface Habitacion {
  id_habitacion: number;
  id_barco: number;
  categoria: string;
  nombre: string;
  descripcion: string;
  capacidad_min: number;
  capacidad_max: number;
  tamaño: number;
  cantidad_disponibles: number;
}

export const habitacionService = {
  async getAll(): Promise<Habitacion[]> {
    const response = await fetch(`${API_URL}/habitaciones`);

    return handleResponse<Habitacion[]>(response);
  },

  async getByBarco(id_barco: number): Promise<Habitacion[]> {
    const response = await fetch(`${API_URL}/barcos/${id_barco}/habitaciones`);

    return handleResponse<Habitacion[]>(response);
  },

  async getDetalles(id_habitacion: number): Promise<DetalleHabitacion> {
    const response = await fetch(
      `${API_URL}/habitaciones/${id_habitacion}/detalles`,
    );

    return handleResponse<DetalleHabitacion>(response);
  },
};
