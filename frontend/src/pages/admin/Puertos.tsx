import { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import {
  Skeleton,
  Pagination,
  Button,
  Select,
  SelectItem,
} from "@heroui/react";

import { destinoService } from "../../api/destinos";
import { Puerto } from "../../api/puertos";
import { useAuth } from "../../contexts/AuthContext";

import { DataTable } from "@/components/common/DataTable";

const PuertosPage = () => {
  const { id_destino } = useParams();
  const navigate = useNavigate();
  const { user } = useAuth();
  const [puertos, setPuertos] = useState<Puerto[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [puertosPerPage, setPuertosPerPage] = useState(5);

  useEffect(() => {
    const loadPuertos = async () => {
      try {
        const response = await destinoService.getPuertos(Number(id_destino));

        setPuertos(response);
      } catch {
        setError("Error al cargar los puertos");
      } finally {
        setLoading(false);
      }
    };

    if (user?.admin) {
      loadPuertos();
    }
  }, [id_destino, user]);

  const columns = [
    { uid: "nombre", name: "Nombre", sortable: true, width: "30%" },
    { uid: "foto", name: "Foto", width: "25%" },
    { uid: "pais", name: "País", sortable: true, width: "25%" },
    { uid: "actions", name: "Acciones", width: "20%" },
  ];

  const renderCell = (puerto: Puerto, columnKey: keyof Puerto) => {
    switch (columnKey) {
      case "foto":
        return (
          <img
            alt={puerto.nombre}
            className="w-16 h-16 object-cover rounded-lg mx-auto border"
            src={`http://localhost:8000/imagenes/puertos/${puerto.foto}`}
          />
        );
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
        return <span className="block text-center">{puerto[columnKey]}</span>;
    }
  };

  const currentPuertos = puertos.slice(
    (currentPage - 1) * puertosPerPage,
    currentPage * puertosPerPage,
  );

  if (!user?.admin)
    return <div className="p-4 text-danger">Acceso no autorizado</div>;
  if (error) return <div className="p-4 text-danger">{error}</div>;

  return (
    <div className="divAdmin">
      <div className="flex justify-between items-center">
        <Button color="secondary" onClick={() => navigate(-1)}>
          ← Volver a Destinos
        </Button>
      </div>
          <DataTable<Puerto>
            columns={columns}
            data={currentPuertos}
            headerClassName="bg-gray-100"
            initialVisibleColumns={["nombre", "foto", "pais", "actions"]}
            renderCell={renderCell}
            rowClassName="hover:bg-gray-50"
            rowKey="id_puerto"
            searchPlaceholder="Buscar puertos..."
          />
    </div>
  );
};

export default PuertosPage;
