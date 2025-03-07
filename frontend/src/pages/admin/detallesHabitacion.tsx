import { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Skeleton, Button, Chip } from "@heroui/react";

import { habitacionService } from "@/api/habitaciones";
import { useAuth } from "@/contexts/AuthContext";

interface DetalleHabitacion {
  id_detalle: number;
  descripcion_larga: string;
  metros_cuadrados: number;
  cantidad_camas: number;
  tipo_cama: string;
  amenidades: string[];
  capacidad_maxima: number;
  vista_mar: boolean;
  balcon: boolean;
}

const DetallesHabitacionPage = () => {
  const { id_habitacion } = useParams<{ id_habitacion: string }>();
  const navigate = useNavigate();
  const { user } = useAuth();
  const [detalles, setDetalles] = useState<DetalleHabitacion | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    const loadDetalles = async () => {
      try {
        if (!id_habitacion) {
          throw new Error("ID de habitación no proporcionado");
        }

        const response = await habitacionService.getDetalles(
          Number(id_habitacion),
        );

        if (!response) {
          throw new Error("No se encontraron detalles para esta habitación");
        }

        setDetalles(response);
      } catch (err) {
        setError((err as Error).message);
      } finally {
        setLoading(false);
      }
    };

    if (user?.admin) {
      loadDetalles();
    } else {
      setLoading(false);
    }
  }, [id_habitacion, user]);

  // Manejar estado de carga
  if (loading) {
    return (
      <div className="p-4">
        <Skeleton className="h-64 rounded-lg" />
      </div>
    );
  }

  // Manejar errores
  if (error) {
    return (
      <div className="p-4 text-danger">
        {error}
        <Button className="mt-4" color="secondary" onPress={() => navigate(-1)}>
          ← Volver
        </Button>
      </div>
    );
  }

  // Verificar detalles después de la carga
  if (!detalles) {
    return (
      <div className="p-4">
        <p>No se encontraron detalles para esta habitación</p>
        <Button className="mt-4" color="secondary" onPress={() => navigate(-1)}>
          ← Volver
        </Button>
      </div>
    );
  }

  return (
    <div className="p-6 max-w-4xl mx-auto">
      <Button className="mb-6" color="secondary" onPress={() => navigate(-1)}>
        ← Volver a Habitaciones
      </Button>

      <div className="bg-white rounded-lg shadow-md p-6">
        <h2 className="text-2xl font-bold mb-4">Detalles completos</h2>

        <div className="grid grid-cols-2 gap-4 mb-6">
          <DetailItem
            label="Metros cuadrados"
            value={`${detalles.metros_cuadrados} m²`}
          />
          <DetailItem
            label="Camas"
            value={`${detalles.cantidad_camas} (${detalles.tipo_cama})`}
          />
          <DetailItem
            label="Capacidad máxima"
            value={`${detalles.capacidad_maxima} personas`}
          />
          <DetailItem
            label="Vista al mar"
            value={detalles.vista_mar ? "Sí" : "No"}
          />
          <DetailItem label="Balcón" value={detalles.balcon ? "Sí" : "No"} />
        </div>

        <div className="mb-6">
          <h3 className="font-semibold mb-2">Amenidades:</h3>
          <div className="flex flex-wrap gap-2">
            {(detalles.amenidades || []).map((amenidad, index) => (
              <Chip key={index} color="primary" variant="flat">
                {amenidad}
              </Chip>
            ))}
          </div>
        </div>

        <div>
          <h3 className="font-semibold mb-2">Descripción completa:</h3>
          <p className="text-gray-600 whitespace-pre-line">
            {detalles.descripcion_larga}
          </p>
        </div>
      </div>
    </div>
  );
};

const DetailItem = ({
  label,
  value,
}: {
  label: string;
  value: string | number;
}) => (
  <div className="border-b pb-2">
    <span className="font-medium text-gray-700">{label}:</span>
    <span className="ml-2 text-gray-600">{value}</span>
  </div>
);

export default DetallesHabitacionPage;
