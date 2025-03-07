// src/api/detalleReserva.ts

export interface DetalleReserva {
  id_reserva: number;
  id_usuario: number;
  id_crucero: number;
  cantidad_huespedes: number;
  estado: string;
  fecha_reserva: string;
  usuario: {
    id_usuario: number;
    nombre_completo: string;
  };
  crucero: {
    id_crucero: number;
    nombre: string;
  };
  detalles: Array<{
    id_detalle: number;
    id_reserva: number;
    id_complemento: number;
    id_habitacion: number;
    cantidad: number;
    subtotal: number;
    complemento: {
      id_complemento: number;
      nombre: string;
      descripcion: string;
      precio: number;
      aplicado_por: string;
    };
  }>;
}

const API_URL = "http://localhost:8000/api";

export const getDetalleReserva = async (
  id: number,
): Promise<DetalleReserva> => {
  const token = localStorage.getItem("authToken");
  const response = await fetch(`${API_URL}/reservas/${id}`, {
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
};
