import { useNavigate } from "react-router-dom";
import { Button } from "@heroui/react";

import { destinoService, Destino } from "../../api/destinos";
import { useAuth } from "../../contexts/AuthContext";
import useFetchData from "../../hooks/useFetchData";

import LoadingScreen from "@/components/loading";
import { DataTable } from "@/components/common/DataTable";

const DestinosPage = () => {
  const navigate = useNavigate();
  const { user, loading: authLoading } = useAuth();
  const {
    data: destinos,
    loading,
    error,
  } = useFetchData<Destino[]>(destinoService.getAll);

  const columns = [
    { uid: "id_destino", name: "ID", sortable: true },
    { uid: "nombre", name: "Nombre", sortable: true },
    { uid: "foto", name: "Foto" },
    { uid: "actions", name: "Acciones" },
  ];

  const handleVerPuertos = (destino: Destino) => {
    navigate(`/admin/destinos/puertos/${destino.id_destino}`);
  };

  const renderCell = (destino: Destino, columnKey: keyof Destino) => {
    switch (columnKey) {
      case "foto":
        return (
          <img
            alt={destino.nombre}
            className="w-20 h-20 object-cover rounded"
            src={`http://localhost:8000/imagenes/destinos/${destino.foto}`}
          />
        );
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
              color="secondary"
              size="sm"
              onClick={() => handleVerPuertos(destino)}
            >
              Puertos
            </Button>
          </div>
        );
      default:
        return destino[columnKey];
    }
  };

  if (authLoading) return <div className="p-4">Cargando autenticación...</div>;
  if (!user?.admin)
    return <div className="p-4 text-danger">Acceso no autorizado</div>;
  if (error) return <div className="p-4 text-danger">Error: {error}</div>;
  if (loading)
    return (
      <div className="flew-grow h-[calc(100vh-108px)] w-full">
        {" "}
        {LoadingScreen("Destinos")}{" "}
      </div>
    );

  return (
    <div className="divAdmin">
      <DataTable<Destino>
        columns={columns}
        data={destinos || []}
        initialVisibleColumns={["nombre", "foto", "actions"]}
        nombre="Gestion de Destinos"
        renderCell={renderCell}
        rowKey="id_destino"
        searchPlaceholder="Buscar destino..."
      />
    </div>
  );
};

export default DestinosPage;
