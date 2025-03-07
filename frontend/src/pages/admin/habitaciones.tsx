// src/pages/admin/habitaciones/index.tsx
import { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import {
  Button,
  Modal,
  ModalContent,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Spinner,
  Chip,
} from "@heroui/react";

import {
  DetalleHabitacion,
  Habitacion,
  habitacionService,
} from "@/api/habitaciones";
import { useAuth } from "@/contexts/AuthContext";
import { DataTable } from "@/components/common/DataTable";

const HabitacionesPage = () => {
  const { id_barco } = useParams();
  const navigate = useNavigate();
  const { user } = useAuth();
  const [habitaciones, setHabitaciones] = useState<Habitacion[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  // Estados del modal
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [detalles, setDetalles] = useState<DetalleHabitacion | null>(null);
  const [detalleLoading, setDetalleLoading] = useState(false);
  const [detalleError, setDetalleError] = useState("");

  useEffect(() => {
    const loadHabitaciones = async () => {
      try {
        const data = await habitacionService.getByBarco(Number(id_barco));

        setHabitaciones(data);
      } catch {
        setError("Error al cargar las habitaciones");
      } finally {
        setLoading(false);
      }
    };

    if (user?.admin) loadHabitaciones();
  }, [id_barco, user]);

  const handleOpenDetalles = async (id: number) => {
    setIsModalOpen(true);
    setDetalleLoading(true);
    setDetalleError("");

    try {
      const data = await habitacionService.getDetalles(id);

      setDetalles(data);
    } catch {
      setDetalleError("Error al cargar los detalles");
    } finally {
      setDetalleLoading(false);
    }
  };

  const columns = [
    { uid: "nombre", name: "NOMBRE", sortable: true },
    { uid: "categoria", name: "CATEGORÍA", sortable: true },
    { uid: "capacidad_min", name: "CAP. MÍN", sortable: true },
    { uid: "capacidad_max", name: "CAP. MÁX", sortable: true },
    { uid: "tamaño", name: "TAMAÑO (m²)", sortable: true },
    { uid: "actions", name: "ACCIONES" },
  ];

  const renderCell = (habitacion: Habitacion, columnKey: keyof Habitacion) => {
    switch (columnKey) {
      case "capacidad_min":
        return `${habitacion.capacidad_min} pers.`;
      case "capacidad_max":
        return `${habitacion.capacidad_max} pers.`;
      case "tamaño":
        return `${habitacion.tamaño} m²`;
      case "actions":
        return (
          <div className="flex gap-2 justify-center">
            <Button
              color="warning"
              size="sm"
              onClick={() => handleOpenDetalles(habitacion.id_habitacion)}
            >
              Detalles
            </Button>
          </div>
        );
      default:
        return (
          <span className="block text-center">{habitacion[columnKey]}</span>
        );
    }
  };

  if (!user?.admin)
    return <div className="p-4 text-danger">Acceso no autorizado</div>;
  if (error) return <div className="p-4 text-danger">{error}</div>;
  if (loading) return <div className="p-4">Cargando habitaciones...</div>;

  return (
    <div className="divAdmin">
      <div className="flex justify-between items-center">
        <Button color="secondary" onClick={() => navigate(-1)}>
          ← Volver a Barcos
        </Button>
      </div>

      <DataTable
        columns={columns}
        data={habitaciones}
        initialVisibleColumns={columns.map((c) => c.uid)}
        renderCell={renderCell}
        rowKey="id_habitacion"
        searchPlaceholder="Buscar habitaciones..."
      />
      <Modal
        backdrop="blur"
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
      >
        <ModalContent className="max-w-3xl mx-auto">
          <ModalHeader className="border-b border-gray-200">
            <h2 className="text-xl font-semibold">Detalles Completos</h2>
          </ModalHeader>
          <ModalBody>
            {detalleLoading && (
              <div className="flex justify-center p-4">
                <Spinner color="primary" label="Cargando detalles..." />
              </div>
            )}

            {detalleError && !detalleLoading && (
              <div className="text-danger text-center p-4">{detalleError}</div>
            )}

            {detalles && !detalleLoading && !detalleError && (
              <div className="grid grid-cols-2 gap-4">
                <DetailItem
                  fullWidth
                  label="Descripción completa"
                  value={detalles.descripcion_larga}
                />
                <DetailItem
                  label="Metros cuadrados"
                  value={`${detalles.metros_cuadrados} m²`}
                />
                <DetailItem
                  label="Cantidad de camas"
                  value={detalles.cantidad_camas}
                />
                <DetailItem label="Tipo de cama" value={detalles.tipo_cama} />
                <DetailItem
                  label="Capacidad máxima"
                  value={detalles.capacidad_maxima}
                />
                <DetailItem
                  label="Vista al mar"
                  value={detalles.vista_mar ? "Sí" : "No"}
                />
                <DetailItem
                  label="Balcón"
                  value={detalles.balcon ? "Sí" : "No"}
                />
                <div className="col-span-2">
                  <h3 className="font-medium mb-2">Amenidades:</h3>
                  <div className="flex flex-wrap gap-2">
                    {detalles.amenidades.map((amenidad, index) => (
                      <Chip key={index} color="primary" variant="flat">
                        {amenidad}
                      </Chip>
                    ))}
                  </div>
                </div>
              </div>
            )}
          </ModalBody>
        </ModalContent>
      </Modal>
    </div>
  );
};
const DetailItem = ({
  label,
  value,
  fullWidth = false,
}: {
  label: string;
  value: string | number;
  fullWidth?: boolean;
}) => (
  <div className={`${fullWidth ? "col-span-2" : ""} border-b pb-2`}>
    <span className="font-medium block mb-1">{label}:</span>
    <span className="text-gray-600">{value}</span>
  </div>
);

export default HabitacionesPage;
