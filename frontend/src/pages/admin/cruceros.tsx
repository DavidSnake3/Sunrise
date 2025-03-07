// src/pages/admin/cruceros.tsx
import { Button, Image } from "@heroui/react";
import { useNavigate } from "react-router-dom";

import { cruceroService, Crucero } from "../../api/cruceros";
import { DataTable } from "../../components/common/DataTable";
import { useAuth } from "../../contexts/AuthContext";
import useFetchData from "../../hooks/useFetchData";

const CrucerosPage = () => {
  const navigate = useNavigate();
  const { user, loading: authLoading } = useAuth();
  const {
    data: cruceros,
    loading,
    error,
  } = useFetchData<Crucero[]>(cruceroService.getAll);

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
      case "foto":
        return (
          <Image
            alt={crucero.nombre}
            className="w-20 h-20 object-cover rounded"
            src={`http://localhost:8000/imagenes/cruceros/${crucero.foto}`}
          />
        );
      case "cantidad_dias": // Nuevo caso
        return `${crucero.cantidad_dias} días`;

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
                navigate(`/admin/cruceros/itinerarios/${crucero.id_crucero}`)
              }
            >
              Itinerarios
            </Button>

            <Button
              color="warning"
              size="sm"
              onClick={() =>
                navigate(`/admin/cruceros/fechas/${crucero.id_crucero}`)
              }
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
  if (loading) return <div className="p-4">Cargando cruceros...</div>;

  return (
    <div className="divAdmin">
      <DataTable<Crucero>
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
        renderCell={renderCell}
        rowKey="id_crucero"
        searchPlaceholder="Buscar crucero..."
        nombre="Gestion de Cruceros"
      />
    </div>
  );
};

export default CrucerosPage;
