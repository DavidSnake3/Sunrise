// src/api/habitaciones.ts
import axios from "axios";
import { handleResponse } from "./auth";
import { Barco } from "./barcos";

const API_URL = "http://localhost:8000/api";

export interface DetalleHabitacion {
  id: number;
  descripcion: string;
  cant_camas: number;
  tipo_cama: string;
  amenidades: string[];
  capacidad_maxima: number;
  vista_mar: boolean;
  balcon: boolean;
  habitacion?: Habitacion;
}

// Eliminar la importación conflictiva si existe
export interface Habitacion {
  id: number;
  categoria: string;
  nombre: string;
  descripcion: string;
  min: number;
  max: number;
  size: number;
  cantidad: number;
  barco?: Barco;
  detalle?: DetalleHabitacion[];
}

export const habitacionService = {
  async getAll(): Promise<Habitacion[]> {
    const response = await axios.get(`${API_URL}/habitaciones`);

    return response.data.data;
  },

  async getByBarco(id_barco: number): Promise<Habitacion[]> {
    const response = await axios.get(
      `${API_URL}/habitaciones?barco_id=${id_barco}`,
    );

    return response.data.data;
  },

  async getById(id: number): Promise<Habitacion[]> {
    const response = await axios.get(`${API_URL}/habitaciones?id=${id}`);

    return response.data.data;
  },

  async getDetalle(id_habitacion: number): Promise<DetalleHabitacion> {
    const response = await axios.get(
      `${API_URL}/detalle_habitacion?habitacion_id=${id_habitacion}`,
    );

    return response.data.data;
  },
};
