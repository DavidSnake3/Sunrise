import { useParams, useNavigate } from "react-router-dom";
import { Button, Skeleton } from "@heroui/react";

import { DataTable } from "@/components/common/DataTable";
import { useAuth } from "@/contexts/AuthContext";
import { Itinerario, itinerarioService } from "@/api/itinerario";
import useFetchData from "@/hooks/useFetchData";

import LoadingScreen from "@/components/loading";

const ItinerariosPage = () => {
  const { id_crucero } = useParams();
  const navigate = useNavigate();
  const { user } = useAuth();
  const { data, loading, error } = useFetchData<Itinerario[]>(() =>
    itinerarioService.getByCrucero(Number(id_crucero)),
  );

  const columns = [
    { uid: "dia", name: "DÍA", sortable: true },
    { uid: "hora_salida", name: "HORA SALIDA", sortable: true },
    { uid: "hora_llegada", name: "HORA LLEGADA", sortable: true },
    { uid: "descripcion", name: "DESCRIPCIÓN", sortable: false },
    { uid: "actions", name: "ACCIONES" },
  ];

  const renderCell = (item: Itinerario, columnKey: keyof Itinerario) => {
    switch (columnKey) {
      case "actions":
        return (
          <div className="flex gap-2 justify-center">
            <Button color="primary" size="sm">
              Editar
            </Button>
            <Button color="danger" size="sm">
              Eliminar
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
  if(loading) return <div className="flew-grow h-[calc(100vh-108px)] w-full"> {LoadingScreen('Itinerario')} </div>;

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
          "dia",
          "hora_salida",
          "hora_llegada",
          "descripcion",
          "actions",
        ]}
        renderCell={renderCell}
        rowKey="id_itinerario"
        searchPlaceholder="Buscar itinerarios..."
      />
    </div>
  );
};

export default ItinerariosPage;
