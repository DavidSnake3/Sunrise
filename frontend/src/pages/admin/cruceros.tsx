// src/pages/admin/cruceros.tsx
import { Button } from "@heroui/react";
import { useNavigate } from "react-router-dom";

import { crucerosGet, Crucero } from "../../api/cruceros";
import { useAuth } from "../../contexts/AuthContext";
import useFetchData from "../../hooks/useFetchData";

import LoadingScreen from "@/components/loading";

const CrucerosPage = () => {
  const navigate = useNavigate();
  const { user, loading: authLoading } = useAuth();
  const {
    data: crucero,
    loading,
    error,
  } = useFetchData<Crucero[]>(crucerosGet.getAll);

  const columns = [
    { uid: "id_crucero", name: "ID", sortable: true },
    { uid: "nombre", name: "Nombre", sortable: true },
    { uid: "foto", name: "Foto" },
    { uid: "cantidad_dias", name: "Días", sortable: true },
    { uid: "id_barco", name: "ID Barco", sortable: true },
    { uid: "actions", name: "Acciones" },
  ];

  const renderCell = (crucero: Crucero, columnKey: keyof Crucero) => {
    switch (columnKey) {
      case "dias":
        return `${crucero.dias} días`;

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
              color="success"
              size="sm"
              onClick={() =>
                navigate(`/admin/cruceros/itinerarios/${crucero.id}`)
              }
            >
              Itinerarios
            </Button>

            <Button
              color="warning"
              size="sm"
              onClick={() => navigate(`/admin/cruceros/fechas/${crucero.id}`)}
            >
              Fechas
            </Button>
          </div>
        );

      default:
        return crucero[columnKey];
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
        {LoadingScreen("Cruceros")}{" "}
      </div>
    );

  return (
    <div className="divAdmin">
      {/* <DataTable<Crucero>
        addButtonLabel="Nuevo Crucero"
        columns={columns}
        data={cruceros || []}
        initialVisibleColumns={[
          "nombre",
          "foto",
          "cantidad_dias",
          "id_barco",
          "actions",
        ]}
        // renderCell={renderCell}
        rowKey="id"
        searchPlaceholder="Buscar crucero..."
        nombre="Gestion de Cruceros"
      /> */}
    </div>
  );
};

export default CrucerosPage;
