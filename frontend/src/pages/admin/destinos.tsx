import React, { useState, useRef } from "react";
import { useNavigate } from "react-router-dom";
import {
  Button,
  Modal,
  ModalContent,
  ModalHeader,
  ModalBody,
} from "@heroui/react";
import { addToast } from "@heroui/toast";

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
    refetch,
  } = useFetchData<Destino[]>(destinoService.getAll);

  // Estados para el modal y el formulario
  const [modalOpen, setModalOpen] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [editingDestinoId, setEditingDestinoId] = useState<number | null>(null);
  const [formData, setFormData] = useState({ nombre: "", foto: "" });
  const [formErrors, setFormErrors] = useState<{
    nombre?: string;
    foto?: string;
  }>({});
  const [loadingModal, setLoadingModal] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const columns = [
    { uid: "id", name: "ID", sortable: true },
    { uid: "nombre", name: "Nombre", sortable: true },
    { uid: "foto", name: "Foto" },
    { uid: "actions", name: "Acciones" },
  ];

  const handleVerPuertos = (destino: Destino) => {
    navigate(`/admin/destinos/puertos/${destino.id}`);
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];

    if (file) {
      const reader = new FileReader();

      reader.onloadend = () => {
        const base64String = reader.result as string;
        const base64Data = base64String.split(",")[1];

        setFormData({ ...formData, foto: base64Data });
      };
      reader.readAsDataURL(file);
    }
  };

  const renderCell = (
    destino: Destino,
    columnKey: keyof Destino | "actions",
  ) => {
    switch (columnKey) {
      case "foto":
        return (
          <img
            alt={destino.nombre}
            className="w-20 h-20 object-cover rounded"
            src={`data:image/jpeg;base64,${destino.foto}`}
          />
        );
      case "puertos":
        return null;
      case "actions":
        return (
          <div className="flex gap-2 justify-center">
            <Button
              color="primary"
              size="sm"
              onPress={() => handleOpenModal(destino, true)}
            >
              Editar
            </Button>
            <Button color="primary" size="sm" onPress={() => handleOpenModal()}>
              Agregar
            </Button>
            <Button
              color="danger"
              size="sm"
              onPress={() => handleEliminar(destino.id)}
            >
              Eliminar
            </Button>
            <Button
              color="secondary"
              size="sm"
              onPress={() => handleVerPuertos(destino)}
            >
              Puertos
            </Button>
          </div>
        );
      default:
        return destino[columnKey];
    }
  };

  const handleEliminar = async (id: number) => {
    if (window.confirm("¿Estás seguro de eliminar este destino?")) {
      try {
        await destinoService.deactivate(id);
        addToast({
          title: "Destino eliminado",
          description: "El destino se eliminó correctamente",
          variant: "solid",
          color: "secondary",
        });
        refetch && refetch();
      } catch {
        addToast({
          title: "Error",
          description: "Hubo un error al eliminar el destino",
          variant: "solid",
          color: "danger",
        });
      }
    }
  };

  const handleOpenModal = (destino?: Destino, edit = false) => {
    if (edit && destino) {
      setIsEditing(true);
      setEditingDestinoId(destino.id);
      setFormData({
        nombre: destino.nombre,
        foto: destino.foto,
      });
    } else {
      setIsEditing(false);
      setEditingDestinoId(null);
      setFormData({ nombre: "", foto: "" });
    }
    setFormErrors({});
    setModalOpen(true);
  };

  const closeModal = () => {
    setModalOpen(false);
    if (fileInputRef.current) fileInputRef.current.value = "";
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const validateForm = () => {
    const errors: { nombre?: string; foto?: string } = {};

    if (!formData.nombre) errors.nombre = "El nombre es obligatorio";
    if (!isEditing && !formData.foto) errors.foto = "La foto es obligatoria";
    setFormErrors(errors);

    return Object.keys(errors).length === 0;
  };

  const handleSubmit = async () => {
    if (!validateForm()) return;
    setLoadingModal(true);
    try {
      if (isEditing && editingDestinoId !== null) {
        await destinoService.update(editingDestinoId, formData);
        addToast({
          title: "Destino actualizado",
          description: "El destino se actualizó correctamente",
          variant: "solid",
          color: "secondary",
        });
      } else {
        await destinoService.store(formData);
        addToast({
          title: "Destino creado",
          description: "El destino se agregó correctamente",
          variant: "solid",
          color: "secondary",
        });
      }
      refetch && refetch();
      closeModal();
    } catch {
      addToast({
        title: "Error",
        description: "Hubo un error al guardar el destino",
        variant: "solid",
        color: "danger",
      });
    } finally {
      setLoadingModal(false);
    }
  };

  if (authLoading) return <div className="p-4">Cargando autenticación...</div>;
  if (!user?.admin)
    return <div className="p-4 text-danger">Acceso no autorizado</div>;
  if (error) return <div className="p-4 text-danger">Error: {error}</div>;
  if (loading)
    return (
      <div className="flex-grow h-[calc(100vh-108px)] w-full">
        {LoadingScreen("Destinos")}
      </div>
    );

  // TopRightContent similar al ejemplo, con el botón "Agregar"
  const topRightContent = (
    <div className="flex gap-3">
      <Button color="primary" onPress={() => handleOpenModal()}>
        Agregar
      </Button>
    </div>
  );

  return (
    <div className="divAdmin">
      <DataTable<Destino>
        columns={columns}
        data={destinos || []}
        initialVisibleColumns={["nombre", "foto", "actions"]}
        nombre="Gestión de Destinos"
        renderCell={renderCell}
        rowKey="id"
        searchPlaceholder="Buscar destino..."
        topRightContent={topRightContent}
      />

      <Modal backdrop="blur" isOpen={modalOpen} size="5xl" onClose={closeModal}>
        <ModalContent className="max-w-4xl rounded-xl shadow-2xl">
          <ModalHeader className="bg-primary text-white py-2 px-8 rounded-t-xl">
            <div className="flex flex-col space-y-1">
              <h2 className="text-2xl font-bold">
                {isEditing ? "Modificar Destino" : "Agregar Destino"}
              </h2>
            </div>
          </ModalHeader>
          <ModalBody className="p-6 space-y-6 max-h-[70vh] overflow-y-auto">
            {loadingModal ? (
              <div className="flex-grow h-[calc(100vh-108px)] w-full">
                {LoadingScreen("Guardando...")}
              </div>
            ) : (
              <div className="space-y-4">
                <div>
                  <h3 className="block mb-1 font-semibold">Nombre:</h3>
                  <input
                    className="w-full p-2 border rounded"
                    name="nombre"
                    type="text"
                    value={formData.nombre}
                    onChange={handleChange}
                  />
                  {formErrors.nombre && (
                    <span className="text-danger text-sm">
                      {formErrors.nombre}
                    </span>
                  )}
                </div>
                <div>
                  <h3 className="block mb-1 font-semibold">Foto:</h3>
                  {formData.foto && (
                    <img
                      alt="Preview"
                      className="w-20 h-20 object-cover rounded mb-2"
                      src={`data:image/jpeg;base64,${formData.foto}`}
                    />
                  )}
                  <input
                    ref={fileInputRef}
                    accept="image/*"
                    type="file"
                    onChange={handleFileChange}
                  />
                  {formErrors.foto && (
                    <span className="text-danger text-sm">
                      {formErrors.foto}
                    </span>
                  )}
                </div>
                <div className="flex justify-end">
                  <Button
                    color="primary"
                    disabled={loadingModal}
                    onPress={handleSubmit}
                  >
                    {isEditing ? "Modificar" : "Agregar"}
                  </Button>
                </div>
              </div>
            )}
          </ModalBody>
        </ModalContent>
      </Modal>
    </div>
  );
};

export default DestinosPage;
