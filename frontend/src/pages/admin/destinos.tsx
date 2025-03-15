/* eslint-disable jsx-a11y/no-static-element-interactions */
/* eslint-disable jsx-a11y/click-events-have-key-events */
/* eslint-disable prettier/prettier */
import React, { useState, useRef, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import {
  Button,
  Modal,
  ModalContent,
  ModalHeader,
  ModalBody,
} from "@heroui/react";
import { toast } from 'react-toastify';

import { destinoService, Destino } from "../../api/destinos";
import { useAuth } from "../../contexts/AuthContext";
import useFetchData from "../../hooks/useFetchData";

import { Puerto } from "@/api/puertos";
import LoadingScreen from "@/components/loading";
import { DataTable } from "@/components/common/DataTable";

import "@/styles/admin/admin.css"
import "@/styles/admin/destino.css"


const DestinosPage = () => {
  const navigate = useNavigate();
  const { user, loading: authLoading } = useAuth();
  const {
    data: destinos,
    loading,
    error,
    refetch,
  } = useFetchData<Destino[]>(destinoService.getAll);
  const [modalOpen, setModalOpen] = useState(false);
  const [formData, setFormData] = useState<{
    id: number;
    nombre: string;
    foto: string;
    puertos: Puerto[];  // Aquí especificamos que es un array de "Puerto"
    edit: boolean;
  }>({id: 0, nombre: "", foto: "", puertos: [], edit: false });

  const columns = [
    { uid: "id", name: "ID", sortable: true },
    { uid: "nombre", name: "Nombre", sortable: true },
    { uid: "foto", name: "Foto" },
    { uid: "acciones", name: "Acciones" },
  ];

  const handleVerPuertos = (destino: Destino) => {
    navigate(`/admin/destinos/puertos/${destino.id}`);
  };

  const renderCell = (destino: Destino, columnKey: keyof Destino | "acciones") => {
    switch (columnKey) {
      case "foto":
        return (
          <img
            alt={destino.nombre}
            className="m-auto w-[80px] h-[50px] object-cover rounded border"
            src={`data:image/jpeg;base64,${destino.foto}`}
          />
        );
      case "puertos": return null;
      case "acciones":
        return (
          <div className="flex gap-2 justify-center">
            <Button
              color="warning"
              size="sm"
              onPress={() => handleVerPuertos(destino)}
            >
              Ver Puertos
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
        toast.success("Detino eliminado exitosamente")

        refetch && refetch();
      } catch {
        toast.error("Hubo un problema al eliminar el destino")
      }
    }
  };

  const handleOpenModal = (id: number, edit = false) => {
    const destino = destinos?.find((d) => d.id === id);

    if (edit && destino) {
      setFormData({
        id: destino.id,
        nombre: destino.nombre,
        foto: destino.foto,
        edit: true,
        puertos: destino.puertos ? destino.puertos : []
      });
    } else {
      setFormData({id: 0, nombre: "", foto: "", puertos: [], edit: false });
    }
    setModalOpen(true);
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

  return (
    <div className="divAdmin">
      <DataTable<Destino>
        add={handleOpenModal}
        className="p-1"
        columns={columns}
        data={destinos || []}
        edit={(id) => handleOpenModal(id, true)}
        initialVisibleColumns={["nombre", "foto", "acciones"]}
        nombre="Gestión de Destinos"
        remove={handleEliminar}
        renderCell={renderCell}
        rowKey="id"
        searchPlaceholder="Buscar destino..."
        selectionMode="single"
      />

      {modalOpen && <ModeloDestino Data={formData} onClose={setModalOpen} onSubmit={() => refetch && refetch()}/>}

    </div>
  );
};




function ModeloDestino({ Data, onClose, onSubmit, }: { Data: {id: number, nombre: string, foto: string, puertos: Puerto[], edit: boolean }, onClose: (b: boolean) => void, onSubmit: () => void }) {
  const [formData, setFormData] = useState<{
    id: number;
    nombre: string;
    foto: string;
    puertos: Puerto[];
    edit: boolean;
  }>(Data);
  const [loadingModal, setLoadingModal] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const [listaPuertos, SetListaPuertos] = useState<Puerto[]>(formData.puertos)
  const [formErrors, setFormErrors] = useState<{
    nombre?: string;
    foto?: string;
  }>({});

  const validateForm = () => {
    const errors: { nombre?: string; foto?: string } = {};

    if (!formData.nombre) errors.nombre = "El nombre es obligatorio";
    setFormErrors(errors);

    return Object.keys(errors).length === 0;
  };

  /*
    David, vea. Esta la variable de ListaPuertos la cual es la que se edita, y en la variable formData va un parametro
    puertos el cual es la lista original.
    Hay que enviar ambas listas de puertos, para que, en caso de ser un push se cree todo lo que esta en la listaPuertos.
    En caso de ser un patch, se debe comprar la lista original "formData.puertos" y la listaPuertos, 
    con el fin de identificar cuales se eliminaron, cuales se editaron y cuales se añadieron
  */
  const handleSubmit = async () => {
    if (!validateForm()) return;
    setLoadingModal(true);
    try {
      if (formData.edit) {
        await destinoService.update(formData.id, formData);
        toast.success("El destino se actualizo correctamente")
      } else {
        await destinoService.store(formData);
        toast.success("El destino se agrego correctamente")
      }
      if (onSubmit) {onSubmit()};
      handleClose();
    } catch {
      toast.error("Hubo un problema al guardar el destino")
    } finally {
      setLoadingModal(false);
    }
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

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData({ ...formData, nombre: e.target.value });
  };

  const handleClose = () => {
    if (onClose) {
      onClose(false);
    }
  };

  return (
    <Modal backdrop="blur" className="h-[500px]" isOpen={true} onClose={handleClose}>
      <ModalContent className="max-w-4xl rounded-xl shadow-2xl">
        <ModalHeader className="bg-primary text-white py-2 px-3 rounded-t-xl h-[50px]">
          <h2 className="text-2xl font-bold">
            {formData.edit ? `Modificar Destino: ${formData.nombre}` : "Agregar Destino"}
          </h2>
        </ModalHeader>

        <ModalBody className="pt-1 px-4 h-full overflow-hidden">
          {loadingModal ? (
            <div className="flex items-center justify-center h-full">
              {LoadingScreen("Guardando...")}
            </div>
          ) : (

            <div className="h-full flex flex-col flex-grow">

              <p className="block font-semibold">Nombre:</p>
              <input
                className="w-full p-2 border border-primary rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
                name="nombre"
                type="text"
                value={formData.nombre}
                onChange={handleChange}
              />
              {formErrors.nombre && (
                <span className="text-red-500 text-sm">{formErrors.nombre}</span>
              )}

              <div className="flex gap-4 h-full">

                <div className="w-[250px] flex flex-col">
                  <h3 className="block font-semibold mb-1">Foto:</h3>
                  {formData.foto ? (
                    <div
                      className="relative selectImg cursor-pointer"
                      onClick={() => setFormData({ ...formData, foto: "" })}
                    >
                      <img
                        alt="Preview"
                        className="w-full h-full object-cover rounded-lg"
                        src={`data:image/jpeg;base64,${formData.foto}`}
                      />
                      <div className="absolute inset-0 flex flex-col items-center justify-center bg-black bg-opacity-50 text-white opacity-0 hover:opacity-100 transition-opacity">
                        <i className="fi fi-rr-trash text-lg" />
                        <p className="text-sm">Remover foto</p>
                      </div>
                    </div>
                  ) : (
                    <div
                      className="selectImg flex flex-col items-center justify-center cursor-pointer hover:bg-gray-100"
                      onClick={() => fileInputRef.current?.click()}
                    >
                      <i className="fi fi-rr-add-image text-3xl text-gray-500" />
                      <p className="text-gray-500 text-sm">Añadir foto</p>
                    </div>
                  )}
                  <input
                    ref={fileInputRef}
                    accept="image/*"
                    className="hidden"
                    type="file"
                    onChange={handleFileChange}
                  />
                  {formErrors.foto && (
                    <span className="text-red-500 text-sm">{formErrors.foto}</span>
                  )}

                  <div className="flex gap-2 mt-3">
                    <Button
                      className="px-4 py-2 rounded-lg flex-grow"
                      color="danger"
                      onPress={handleClose}
                    >
                      Cancelar
                    </Button>
                    <Button
                      className="px-4 py-2 rounded-lg w-full flex-grow"
                      color="primary"
                      disabled={loadingModal}
                      onPress={handleSubmit}
                    >
                      {formData.edit ? "Modificar" : "Agregar"}
                    </Button>
                  </div>
                </div>

                <div className="flex-grow">
                  <h3 className="block font-semibold mb-1 mx-auto">Lista de Puertos:</h3>
                  <div className="w-full">
                    <ModeloPuerto ListaPuertos={listaPuertos} onChangePuertos={SetListaPuertos}/>
                  </div>
                </div>

              </div>

            </div>
          )}
        </ModalBody>
      </ModalContent>
    </Modal>
  );

}




function ModeloPuerto({
  ListaPuertos,
  onChangePuertos,
}: {
  ListaPuertos: Puerto[];
  onChangePuertos: (puertos: Puerto[]) => void;
}) {
  const [puertos, setPuertos] = useState<Puerto[]>(ListaPuertos || []);
  const [puertoSeleccionado, setPuertoSeleccionado] = useState<Puerto | null>(null);
  const [nuevoPuerto, setNuevoPuerto] = useState<Omit<Puerto, "id">>({
    nombre: "",
    pais: "",
    foto: "",
  });

  const fileInputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    setPuertos(ListaPuertos || []);
  }, [ListaPuertos]);

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];

    if (file) {
      const reader = new FileReader();

      reader.onloadend = () => {
        const base64String = reader.result as string;

        setNuevoPuerto({ ...nuevoPuerto, foto: base64String.split(",")[1] });
      };
      reader.readAsDataURL(file);
    }
  };

  const handleAddPuerto = () => {
    if (!nuevoPuerto.nombre || !nuevoPuerto.pais) {
      alert("Por favor, llena todos los campos.");

      return;
    }

    const nuevoId = puertos.length ? Math.max(...puertos.map((p) => p.id)) + 1 : 1;
    const nuevoPuertoObj: Puerto = { id: nuevoId, ...nuevoPuerto };
    const nuevaLista = [...puertos, nuevoPuertoObj];

    setNuevoPuerto({ nombre: "", pais: "", foto: "" });
    setPuertos(nuevaLista);
    onChangePuertos(nuevaLista);
  };

  const handleSelectPuerto = (puerto: Puerto) => {
    if (puertoSeleccionado?.id === puerto.id) {
      setPuertoSeleccionado(null);
      setNuevoPuerto({ nombre: "", pais: "", foto: "" });
    } else {
      setPuertoSeleccionado(puerto);
      setNuevoPuerto({
        nombre: puerto.nombre,
        pais: puerto.pais,
        foto: puerto.foto || "",
      });
    }
  };

  const handleSavePuerto = () => {
    if (!puertoSeleccionado) return;

    const puertosActualizados = puertos.map((p) =>
      p.id === puertoSeleccionado.id ? { ...puertoSeleccionado, ...nuevoPuerto } : p
    );

    setPuertoSeleccionado(null);
    setNuevoPuerto({ nombre: "", pais: "", foto: "" });
    setPuertos(puertosActualizados);
    onChangePuertos(puertosActualizados);
  };

  const handleDeletePuerto = (id: number) => {
    const puertosFiltrados = puertos.filter((p) => p.id !== id);

    setPuertoSeleccionado(null);
    setNuevoPuerto({ nombre: "", pais: "", foto: "" });
    setPuertos(puertosFiltrados);
    onChangePuertos(puertosFiltrados);
  };

  return (
    <div className="w-full h-[340px] overflow-y-auto px-4 py-2 border border-primary rounded-lg shadow-md">

      <div className="flex gap-4">
        <div>
          <p className="block font-semibold">Foto:</p>
          {nuevoPuerto.foto ? (
            <div
              className="relative cursor-pointer overflow-hidden"
              onClick={() => setNuevoPuerto({ ...nuevoPuerto, foto: "" })}
            >
              <img
                alt="Preview"
                className="w-[150px] h-[107px] object-cover rounded-lg"
                src={`data:image/jpeg;base64,${nuevoPuerto.foto}`}
              />
              <div className="absolute inset-0 flex flex-col items-center justify-center bg-black bg-opacity-50 rounded-lg text-white opacity-0 hover:opacity-100 transition-opacity">
                <i className="fi fi-rr-trash text-lg" />
                <p className="text-sm">Remover foto</p>
              </div>
            </div>
          ) : (
            <div
              className="w-[150px] h-[107px] flex items-center justify-center border border-gray-300 p-3 rounded-lg cursor-pointer hover:bg-gray-100"
              onClick={() => fileInputRef.current?.click()}
            >
              <i className="fi fi-rr-add-image text-2xl text-gray-500 mr-2" />
              <p className="text-gray-500 text-sm">Añadir foto</p>
            </div>
          )}
          <input ref={fileInputRef} accept="image/*" className="hidden" type="file" onChange={handleFileChange} />
        </div>

        <div className="flex flex-col w-full flex-grow">
          <div>
            <p className="block font-semibold">Puerto:</p>
            <input
              className="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
              type="text"
              value={nuevoPuerto.nombre}
              onChange={(e) => setNuevoPuerto({ ...nuevoPuerto, nombre: e.target.value })}
            />
          </div>

          <p className="block font-semibold">País:</p>
          <div className="flex justify-between gap-3">
            <select
              className="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
              value={nuevoPuerto.pais}
              onChange={(e) => setNuevoPuerto({ ...nuevoPuerto, pais: e.target.value })}
            >
              <option value="">Seleccione un país</option>
              <option value="Costa Rica">Costa Rica</option>
              <option value="México">México</option>
              <option value="España">España</option>
              <option value="Argentina">Argentina</option>
            </select>

            {puertoSeleccionado ? (
              <>
                <button className="px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600" onClick={handleSavePuerto}>
                  Guardar
                </button>
                <button className="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600" onClick={() => handleDeletePuerto(puertoSeleccionado.id)}>
                  Eliminar
                </button>
              </>
            ) : (
              <button className="px-4 py-2 bg-primary text-white rounded-lg hover:bg-primary-dark transition" onClick={handleAddPuerto}>
                Añadir
              </button>
            )}
          </div>
        </div>
      </div>

      <div className="mt-4 overflow-x-auto">
        <table className="w-full border-collapse border border-gray-300 rounded-lg">
          <thead>
            <tr className="bg-primary text-white h-[25px]">
              <th className="border">Imagen</th>
              <th className="border">Puerto</th>
              <th className="border">País</th>
            </tr>
          </thead>
          <tbody>
            {puertos.length > 0 ? (
              puertos.map((puerto) => (
                <tr
                  key={puerto.id}
                  className={`text-center border cursor-pointer ${
                    puertoSeleccionado?.id === puerto.id ? "bg-[#f57c67]" : "hover:bg-gray-100"
                  }`}
                  onClick={() => handleSelectPuerto(puerto)}
                >
                  <td className="p-1 border">{puerto.foto ? <img alt="Puerto" className="w-12 h-12 object-cover rounded-md mx-auto" src={`data:image/jpeg;base64,${puerto.foto}`} /> : "Sin Imagen"}</td>
                  <td className="p-1 border">{puerto.nombre}</td>
                  <td className="p-1 border">{puerto.pais}</td>
                </tr>
              ))
            ) : (
              <tr>
                <td className="p-4 text-center text-gray-500" colSpan={3}>No hay puertos agregados.</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default DestinosPage;
