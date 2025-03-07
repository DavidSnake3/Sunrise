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
    cantidad_dias: number;
    foto?: string;
    barco?: {
      id_barco: number;
      nombre: string;
    };
  };
  detalles: Array<{
    id_detalle: number;
    id_reserva: number;
    id_complemento?: number;
    id_habitacion?: number;
    cantidad: number;
    subtotal: number;
    complemento?: {
      id_complemento: number;
      nombre: string;
      descripcion: string;
      precio: number;
      aplicado_por: string;
    };
    habitacion?: {
      id_habitacion: number;
      nombre: string;
      categoria: string;
    };
  }>;
  huespedes: Array<{
    id_huesped: number;
    nombre_completo: string;
    edad: number;
    nacionalidad: string;
    genero: string;
    fecha_nacimiento: string;
  }>;
  factura?: {
    subtotal: number;
    impuestos: number;
    tarifas: number;
    total: number;
    metodo_pago?: string;
    fecha_pago?: string;
    estado?: string;
  };
  fechaCrucero: {
    fecha_limite_pago: string;
  };
  puerto_salida: {
    nombre: string;
    pais: string;
  };
  puerto_regreso: {
    nombre: string;
    pais: string;
  };
  fecha_inicio: string;
  fecha_fin: string;
  total_habitaciones: number;
  total_complementos: number;
}

const API_URL = "http://localhost:8000/api";

export const getDetalleReserva = async (
  id: number,
): Promise<DetalleReserva> => {
  const token = localStorage.getItem("authToken");
  const response = await fetch(`${API_URL}/reservas/${id}`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  });

  if (!response.ok) {
    const errorText = await response.text();

    throw new Error(`HTTP error: ${response.status} - ${errorText}`);
  }

  const rawData = await response.json();

  return {
    ...rawData,
    detalles: rawData.detalles.map((d: any) => ({
      ...d,
      subtotal: Number(d.subtotal),
      complemento: d.complemento
        ? {
            ...d.complemento,
            precio: Number(d.complemento.precio),
          }
        : undefined,
    })),
    total_habitaciones: Number(rawData.total_habitaciones),
    total_complementos: Number(rawData.total_complementos),
    factura: {
      ...rawData.factura,
      subtotal: Number(rawData.factura.subtotal),
      impuestos: Number(rawData.factura.impuestos),
      tarifas: Number(rawData.factura.tarifas),
      total: Number(rawData.factura.total),
    },
  };
};
