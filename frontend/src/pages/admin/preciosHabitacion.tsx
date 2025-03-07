import { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Button } from "@heroui/react";

import {
  precioHabitacionService,
  PrecioHabitacion,
} from "../../api/precioHabitacion";
import { useAuth } from "../../contexts/AuthContext";

import { DataTable } from "@/components/common/DataTable";

import LoadingScreen from "@/components/loading";

const PreciosHabitacionPage = () => {
  const { id_fecha } = useParams();
  const navigate = useNavigate();
  const { user } = useAuth();

  const [precios, setPrecios] = useState<PrecioHabitacion[]>([]);
  const [, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [currentPage] = useState(1);
  const [itemsPerPage] = useState(5);

  useEffect(() => {
    const loadPrecios = async () => {
      try {
        const response = await precioHabitacionService.getPrecioPorFecha(
          Number(id_fecha),
        );

        setPrecios(Array.isArray(response) ? response : [response]); // Asegurar que sea un array
      } catch {
        setError("Error al cargar los precios");
      } finally {
        setLoading(false);
      }
    };

    if (user?.admin) {
      loadPrecios();
    }
  }, [id_fecha, user]);

  const columns = [
    { uid: "id_precio", name: "ID Precio", sortable: true },
    { uid: "id_fecha", name: "ID Fecha", sortable: true },
    { uid: "id_habitacion", name: "ID Habitación", sortable: true },
    { uid: "precio", name: "Precio", sortable: true },
    { uid: "actions", name: "Acciones" },
  ];

  const renderCell = (
    precio: PrecioHabitacion,
    columnKey: keyof PrecioHabitacion,
  ) => {
    switch (columnKey) {
      case "actions":
        return (
          <div className="flex gap-2 justify-center">
            <Button color="primary" size="sm" variant="flat">
              Editar
            </Button>
            <Button color="danger" size="sm" variant="flat">
              Eliminar
            </Button>
          </div>
        );
      default:
        return <span className="block text-center">{precio[columnKey]}</span>;
    }
  };

  const currentPrecios = precios.slice(
    (currentPage - 1) * itemsPerPage,
    currentPage * itemsPerPage,
  );

  if (!user?.admin)
    return <div className="p-4 text-danger">Acceso no autorizado</div>;
  if (error) return <div className="p-4 text-danger">{error}</div>;

  if (loading)
    return (
      <div className="flew-grow h-[calc(100vh-108px)] w-full">
        {" "}
        {LoadingScreen("Precios")}{" "}
      </div>
    );

  return (
    <div className="divAdmin">
      <div className="flex justify-between items-center">
        <Button color="secondary" onClick={() => navigate(-1)}>
          ← Volver
        </Button>
      </div>

      <DataTable<PrecioHabitacion>
        columns={columns}
        data={currentPrecios}
        initialVisibleColumns={[
          "id_precio",
          "id_fecha",
          "id_habitacion",
          "precio",
          "actions",
        ]}
        renderCell={renderCell}
        rowKey="id_precio"
        searchPlaceholder="Buscar precios..."
      />
    </div>
  );
};

export default PreciosHabitacionPage;
