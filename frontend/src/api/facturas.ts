// src/api/detalleFactura.ts
export interface DetalleFactura {
  nombre_crucero: string;
  puerto_salida: string;
  puerto_regreso: string;
  fecha_inicio: string;
  fecha_fin: string;
  habitaciones: Array<{
    habitacion_nombre: string;
    cantidad_habitaciones: number;
    huespedes_por_habitacion: number;
    subtotal: number;
  }>;
  total_habitaciones: number;
  complementos: Array<{
    nombre_complemento: string;
    cantidad: number;
    total: number;
  }>;
  total_complementos: number;
  subtotal: number;
  impuestos: number;
  tarifas: number;
  total: number;
  estado_pago: string;
  fecha_limite_pago: string | null;
  monto_a_pagar: number;
}

const API_URL = "http://localhost:8000/api";

export const getDetalleFactura = async (
  id: number,
): Promise<DetalleFactura> => {
  const token = localStorage.getItem("authToken");
  const response = await fetch(`${API_URL}/reservas/${id}/detalleFactura`, {
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
