import { Button } from "@heroui/react";

import { usuarioService, Usuario } from "../../api/usuarios";
import { DataTable } from "../../components/common/DataTable";
import { useAuth } from "../../contexts/AuthContext";
import useFetchData from "../../hooks/useFetchData";

const UsuariosPage = () => {
  const { user, loading: authLoading } = useAuth();
  const {
    data: usuarios,
    loading,
    error,
  } = useFetchData<Usuario[]>(usuarioService.getAll);

  const columns = [
    { uid: "id_usuario", name: "ID", sortable: true },
    { uid: "nombre_completo", name: "Nombre", sortable: true },
    { uid: "email", name: "Email", sortable: true },
    { uid: "admin", name: "Admin", sortable: true },
    { uid: "genero", name: "Género", sortable: true },
    { uid: "edad", name: "Edad", sortable: true },
    { uid: "fecha_nacimiento", name: "Fecha Nacimiento", sortable: true },
    { uid: "nacionalidad", name: "Nacionalidad", sortable: true },
    { uid: "telefono", name: "Teléfono", sortable: true },
    { uid: "actions", name: "Acciones" },
  ];

  const renderCell = (usuario: Usuario, columnKey: keyof Usuario) => {
    switch (columnKey) {
      case "admin":
        return usuario.admin ? "✅" : "❌";
      case "fecha_nacimiento":
        return new Date(usuario.fecha_nacimiento).toLocaleDateString();
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
        return usuario[columnKey];
    }
  };

  if (authLoading) return <div className="p-4">Cargando autenticación...</div>;
  if (!user?.admin)
    return <div className="p-4 text-danger">Acceso no autorizado</div>;
  if (error) return <div className="p-4 text-danger">Error: {error}</div>;
  if (loading) return <div className="p-4">Cargando usuarios...</div>;

  return (
    <div className="divAdmin">
      <DataTable<Usuario>
        columns={columns}
        data={usuarios || []}
        initialVisibleColumns={[
          "nombre_completo",
          "email",
          "genero",
          "edad",
          "fecha_nacimiento",
          "nacionalidad",
          "telefono",
          "actions",
        ]}
        nombre="Gestion de Usuarios"
        renderCell={renderCell}
        rowKey="id_usuario"
        searchPlaceholder="Buscar usuario..."
      />
    </div>
  );
};

export default UsuariosPage;
