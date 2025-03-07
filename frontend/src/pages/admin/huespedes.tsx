import { DataTable } from "../../components/common/DataTable";
import { huespedService, Huesped } from "../../api/huespedes";
import { useAuth } from "../../contexts/AuthContext";
import useFetchData from "../../hooks/useFetchData";

const HuespedesPage = () => {
  const { user, loading: authLoading } = useAuth();
  const {
    data: huespedes,
    loading,
    error,
  } = useFetchData<Huesped[]>(huespedService.getAll);

  const columns = [
    { uid: "Id_huespued", name: "ID Huésped", sortable: true },
    { uid: "Id_reserva", name: "ID Reserva", sortable: true },
    { uid: "nombre_completo", name: "Nombre Completo", sortable: true },
    { uid: "genero", name: "Género", sortable: true },
    { uid: "edad", name: "Edad", sortable: true },
    { uid: "fecha_nacimiento", name: "Fecha de Nacimiento", sortable: true },
    { uid: "nacionalidad", name: "Nacionalidad", sortable: true },
  ];

  const renderCell = (huesped: Huesped, columnKey: keyof Huesped) => {
    if (columnKey === "fecha_nacimiento") {
      return new Date(huesped.fecha_nacimiento).toLocaleDateString("es-ES");
    }

    return huesped[columnKey];
  };

  if (authLoading) return <div>Cargando autenticación...</div>;
  if (!user?.admin) return <div>Acceso no autorizado</div>;
  if (error) return <div>Error: {error}</div>;
  if (loading) return <div>Cargando huéspedes...</div>;

  return (
    <div>
      <h1>Gestión de Huéspedes</h1>
      <DataTable<Huesped>
        addButtonLabel="Nuevo Huésped"
        columns={columns}
        data={huespedes || []}
        initialVisibleColumns={[
          "nombre_completo",
          "genero",
          "edad",
          "fecha_nacimiento",
          "nacionalidad",
        ]}
        nombre="Huéspedes"
        renderCell={renderCell}
        rowKey="Id_huespued"
        searchPlaceholder="Buscar huésped..."
      />
    </div>
  );
};

export default HuespedesPage;
