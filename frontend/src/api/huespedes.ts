export interface Huesped {
  Id_huespued: number;
  Id_reserva: number;
  nombre_completo: string;
  genero: string;
  edad: number;
  fecha_nacimiento: string;
  nacionalidad: string;
}

const API_URL = "http://localhost:8000/api";

export const huespedService = {
  async getAll(): Promise<Huesped[]> {
    const token = localStorage.getItem("authToken");
    const response = await fetch(`${API_URL}/huespedes`, {
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
  async getById(id: number): Promise<Huesped> {
    const token = localStorage.getItem("authToken");
    const response = await fetch(`${API_URL}/huespedes/${id}`, {
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
  async create(data: Partial<Huesped>): Promise<Huesped> {
    const token = localStorage.getItem("authToken");
    const response = await fetch(`${API_URL}/huespedes`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify(data),
    });

    if (!response.ok) {
      const errorText = await response.text();

      throw new Error(`HTTP error: ${response.status} - ${errorText}`);
    }

    return response.json();
  },
};
