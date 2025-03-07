import { handleResponse } from "./auth";

export interface Barco {
  id_barco: number;
  nombre: string;
  descripcion?: string; // si dispones de este campo
  capacidad_pasajeros: number;
  capacidad_tripulantes: number;
  total_habitaciones: number;
  velocidad_maxima: number;
  tonelaje: number;
  altura: number;
  largo: number;
  ancho: number;
  año_construccion: number;
  habitaciones_count?: number;
  habitaciones?: any[];
  habitaciones_sum_cantidad_Disponibles?: number;
}

const API_URL = "http://localhost:8000/api";

export const barcoService = {
  async getAll(): Promise<Barco[]> {
    const response = await fetch(`${API_URL}/barcos`);

    return handleResponse<Barco[]>(response);
  },
  async getById(id_barco: number): Promise<Barco> {
    const response = await fetch(`${API_URL}/barcos/${id_barco}`);

    return handleResponse<Barco>(response);
  },
  async getHabitaciones(id_barco: number): Promise<any> {
    const response = await fetch(`${API_URL}/barcos/${id_barco}/habitaciones`);

    return handleResponse(response);
  },
};
