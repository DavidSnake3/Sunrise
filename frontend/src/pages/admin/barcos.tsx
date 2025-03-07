import { Button } from "@heroui/react";
import { useNavigate } from "react-router-dom";

import { barcoService, Barco } from "../../api/barcos";
import { DataTable } from "../../components/common/DataTable";
import { useAuth } from "../../contexts/AuthContext";
import useFetchData from "../../hooks/useFetchData";

const BarcosPage = () => {
  const navigate = useNavigate();
  const { user, loading: authLoading } = useAuth();
  const {
    data: barcos,
    loading,
    error,
  } = useFetchData<Barco[]>(barcoService.getAll);

  const columns = [
    { uid: "id_barco", name: "ID", sortable: true },
    { uid: "nombre", name: "Nombre", sortable: true },
    { uid: "capacidad_pasajeros", name: "Pasajeros", sortable: true },
    { uid: "capacidad_tripulantes", name: "Tripulantes", sortable: true },
    { uid: "total_habitaciones", name: "Habitaciones", sortable: true },
    { uid: "velocidad_maxima", name: "Velocidad Máx (nudos)", sortable: true },
    { uid: "tonelaje", name: "Tonelaje (T)", sortable: true },
    { uid: "altura", name: "Altura (m)", sortable: true },
    { uid: "largo", name: "Largo (m)", sortable: true },
    { uid: "ancho", name: "Ancho (m)", sortable: true },
    { uid: "año_construccion", name: "Año Construcción", sortable: true },
    { uid: "actions", name: "Acciones" },
  ];

  const renderCell = (barco: Barco, columnKey: keyof Barco) => {
    switch (columnKey) {
      case "capacidad_pasajeros":
        return `${barco.capacidad_pasajeros} personas`;

      case "capacidad_tripulantes":
        return `${barco.capacidad_tripulantes} tripulantes`;

      case "total_habitaciones":
        return `${barco.total_habitaciones} hab.`;

      case "velocidad_maxima":
        return `${barco.velocidad_maxima} nudos`;

      case "tonelaje":
        return `${barco.tonelaje} T`;

      case "altura":
        return `${barco.altura} m`;

      case "largo":
        return `${barco.largo} m`;

      case "ancho":
        return `${barco.ancho} m`;

      case "año_construccion":
        return barco.año_construccion;

      case "actions":
        return (
          <div className="flex gap-2">
            <Button color="primary" size="sm">
              Editar
            </Button>
            <Button color="danger" size="sm">
              Eliminar
            </Button>
            <Button
              color="secondary"
              size="sm"
              onClick={() => navigate(`/admin/barcos/habitaciones/${barco.id_barco}`)}
            >
              Habitaciones
            </Button>
          </div>
        );

      default:
        return barco[columnKey];
    }
  };

  if (authLoading) return <div className="p-4">Cargando autenticación...</div>;
  if (!user?.admin)
    return <div className="p-4 text-danger">Acceso no autorizado</div>;
  if (error) return <div className="p-4 text-danger">Error: {error}</div>;
  if (loading) return <div className="p-4">Cargando barcos...</div>;

  return (
    <div className="divAdmin">
      <DataTable<Barco>
        addButtonLabel="Nuevo Barco"
        columns={columns}
        data={barcos || []}
        initialVisibleColumns={[
          "id_barco",
          "nombre",
          "capacidad_pasajeros",
          "capacidad_tripulantes",
          "total_habitaciones",
          "velocidad_maxima",
          "tonelaje",
          "altura",
          "largo",
          "ancho",
          "año_construccion",
          "actions",
        ]}
        renderCell={renderCell}
        rowKey="id_barco"
        searchPlaceholder="Buscar barco..."
        nombre="Gestion de Barcos"
      />
    </div>
  );
};

export default BarcosPage;
