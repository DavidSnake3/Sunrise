import { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Button } from "@heroui/react";

import { Puerto, puertoService } from "../../api/puertos";
import { useAuth } from "../../contexts/AuthContext";

import LoadingScreen from "@/components/loading";
import { DataTable } from "@/components/common/DataTable";

const PuertosPage = () => {
  const { id_destino } = useParams();
  const navigate = useNavigate();
  const { user } = useAuth();
  const [puertos, setPuertos] = useState<Puerto[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    const loadPuertos = async () => {
      try {
        const response = await puertoService.getByDestino(Number(id_destino));

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
    { uid: "nombre", name: "Nombre", sortable: true },
    { uid: "pais", name: "País", sortable: true },
    { uid: "foto", name: "Foto" },
  ];

  const renderCell = (puerto: Puerto, columnKey: keyof Puerto) => {
    switch (columnKey) {
      case "foto":
        return (
          <img
            alt={puerto.nombre}
            className="m-auto w-[80px] h-[50px] object-cover rounded border"
            src={`data:image/jpeg;base64,${puerto.foto}`}
          />
        );
      case "destino":
        return null;
      default:
        return <span className="block text-center">{puerto[columnKey]}</span>;
    }
  };

  if (!user?.admin)
    return <div className="p-4 text-danger">Acceso no autorizado</div>;
  if (error) return <div className="p-4 text-danger">{error}</div>;
  if (loading)
    return (
      <div className="flew-grow h-[calc(100vh-108px)] w-full">
        {" "}
        {LoadingScreen("Puertos")}{" "}
      </div>
    );

  return (
    <div className="divAdmin">
      <div className="flex justify-between items-center">
        <Button color="secondary" onClick={() => navigate(-1)}>
          ← Volver a Destinos
        </Button>
      </div>
      <DataTable<Puerto>
        add={(a) => console.log(a)}
        className="p-1"
        columns={columns}
        data={puertos || []}
        edit={(a) => console.log(a)}
        initialVisibleColumns={["nombre", "foto", "pais"]}
        nombre="Gestión de Destinos - Puertos"
        remove={(a) => console.log(a)}
        renderCell={renderCell}
        rowKey="id"
        searchPlaceholder="Buscar puertos..."
        selectionMode="single"
      />
    </div>
  );
};

export default PuertosPage;
