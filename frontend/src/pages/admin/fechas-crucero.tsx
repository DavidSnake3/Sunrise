import { useParams, useNavigate } from "react-router-dom";
import { Button, Skeleton } from "@heroui/react";

import { DataTable } from "@/components/common/DataTable";
import { useAuth } from "@/contexts/AuthContext";
import { FechaCrucero, fechaCruceroService } from "@/api/fechaCrucero";
import useFetchData from "@/hooks/useFetchData";

const FechasCruceroPage = () => {
  const { id_crucero } = useParams();
  const navigate = useNavigate();
  const { user } = useAuth();
  const { data, loading, error } = useFetchData<FechaCrucero[]>(() =>
    fechaCruceroService.getByCrucero(Number(id_crucero)),
  );

  const columns = [
    { uid: "fecha_inicio", name: "FECHA INICIO", sortable: true },
    { uid: "fecha_limite_pago", name: "LÍMITE PAGO", sortable: true },
    { uid: "itinerarios", name: "ITINERARIOS", sortable: false },
    { uid: "actions", name: "ACCIONES" },
  ];

  const renderCell = (item: FechaCrucero, columnKey: keyof FechaCrucero) => {
    switch (columnKey) {
      case "fecha_inicio":
      case "fecha_limite_pago":
        return new Date(item[columnKey]).toLocaleDateString();

      case "itinerarios":
        return item.itinerarios?.length || 0;

      case "actions":
        return (
          <div className="flex gap-2 justify-center">
            <Button color="primary" size="sm">
              Editar
            </Button>
            <Button color="danger" size="sm">
              Eliminar
            </Button>
            <Button
              color="warning"
              size="sm"
              onClick={() =>
                navigate(`/admin/cruceros/fechas/precios/${item.id_fecha}`)
              }
            >
              Precios de Habitaciones
            </Button>
          </div>
        );

      default:
        return item[columnKey];
    }
  };

  if (!user?.admin)
    return <div className="p-4 text-danger">Acceso no autorizado</div>;
  if (error) return <div className="p-4 text-danger">{error}</div>;

  return (
    <div className="divAdmin">
      <div className="flex justify-between items-center">
        <Button color="secondary" onClick={() => navigate(-1)}>
          ← Volver a Cruceros
        </Button>
      </div>

      <DataTable
        columns={columns}
        data={data || []}
        initialVisibleColumns={[
          "fecha_inicio",
          "fecha_limite_pago",
          "itinerarios",
          "actions",
        ]}
        renderCell={renderCell}
        rowKey="id_fecha"
        searchPlaceholder="Buscar fechas..."
      />
    </div>
  );
};

export default FechasCruceroPage;
