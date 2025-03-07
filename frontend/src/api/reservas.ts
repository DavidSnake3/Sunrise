export interface Reserva {
  id_reserva: number;
  id_usuario: number;
  id_crucero: number;
  cantidad_huespedes: number;
  estado: string;
  fecha_reserva: string;
  usuario?: {
    // Nueva propiedad
    nombre_completo: string;
  };
}

const API_URL = "http://localhost:8000/api";

export const reservaService = {
  async getAll(): Promise<Reserva[]> {
    const token = localStorage.getItem("authToken");
    const response = await fetch(`${API_URL}/reservas`, {
      method: "GET",
      headers: {
        Accept: "application/json",
        Authorization: `Bearer ${token}`,
      },
    });

    if (!response.ok) {
      const errorText = await response.text();

      throw new Error(`HTTP error: ${response.status} - ${errorText}`);
    }

    return response.json();
  },
};
