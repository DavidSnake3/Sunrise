import { useState } from "react";
import {
  Button,
  Chip,
  Modal,
  ModalContent,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Spinner,
  Textarea,
} from "@heroui/react";

import { reservaService, Reserva } from "../../api/reservas";
import { DataTable } from "../../components/common/DataTable";
import { useAuth } from "../../contexts/AuthContext";
import useFetchData from "../../hooks/useFetchData";
import { getDetalleReserva, DetalleReserva } from "../../api/detalleReserva";

const ReservasPage = () => {
  const { user, loading: authLoading } = useAuth();
  const {
    data: reservas,
    loading,
    error,
  } = useFetchData<Reserva[]>(reservaService.getAll);

  // Estados para el modal de detalle
  const [detalleModalOpen, setDetalleModalOpen] = useState(false);
  const [detalleReserva, setDetalleReserva] = useState<DetalleReserva | null>(
    null,
  );
  const [detalleLoading, setDetalleLoading] = useState(false);
  const [detalleError, setDetalleError] = useState("");

  const openDetalleModal = (reservaId: number) => {
    setDetalleModalOpen(true);
    setDetalleLoading(true);
    setDetalleError("");
    setDetalleReserva(null);

    getDetalleReserva(reservaId)
      .then((data) => {
        setDetalleReserva(data);
        setDetalleLoading(false);
      })
      .catch((err) => {
        setDetalleError(err.message);
        setDetalleLoading(false);
      });
  };

  const closeDetalleModal = () => {
    setDetalleModalOpen(false);
    setDetalleReserva(null);
  };

  const columns = [
    { uid: "id_reserva", name: "ID Reserva", sortable: true },
    { uid: "id_usuario", name: "ID Usuario", sortable: true },
    { uid: "id_crucero", name: "ID Crucero", sortable: true },
    { uid: "cantidad_huespedes", name: "Huéspedes", sortable: true },
    { uid: "estado", name: "Estado", sortable: true },
    { uid: "fecha_reserva", name: "Fecha Reserva", sortable: true },
    { uid: "actions", name: "Acciones" },
  ];

  const renderCell = (reserva: Reserva, columnKey: keyof Reserva) => {
    switch (columnKey) {
      case "fecha_reserva":
        return new Date(reserva.fecha_reserva).toLocaleDateString("es-ES", {
          year: "numeric",
          month: "long",
          day: "numeric",
        });

      case "estado":
        return (
          <Chip
            color={
              reserva.estado.toLowerCase() === "confirmada"
                ? "success"
                : reserva.estado.toLowerCase() === "pendiente"
                  ? "warning"
                  : "danger"
            }
            variant="flat"
          >
            {reserva.estado}
          </Chip>
        );

      case "cantidad_huespedes":
        return `${reserva.cantidad_huespedes} huéspedes`;

      case "actions":
        return (
          <div className="flex gap-2 justify-center">
            <Button
              color="primary"
              size="sm"
              onPress={() => openDetalleModal(reserva.id_reserva)}
            >
              Detalles
            </Button>
            <Button color="danger" size="sm">
              Cancelar
            </Button>
          </div>
        );

      default:
        return reserva[columnKey];
    }
  };

  if (authLoading) return <div className="p-4">Cargando autenticación...</div>;
  if (!user?.admin)
    return <div className="p-4 text-danger">Acceso no autorizado</div>;
  if (error) return <div className="p-4 text-danger">Error: {error}</div>;
  if (loading) return <div className="p-4">Cargando reservas...</div>;

  return (
    <div className="divAdmin">
      <DataTable<Reserva>
        addButtonLabel="Nueva Reserva"
        columns={columns}
        data={reservas || []}
        initialVisibleColumns={[
          "id_usuario",
          "id_crucero",
          "fecha_reserva",
          "estado",
          "actions",
        ]}
        renderCell={renderCell}
        rowKey="id_reserva"
        searchPlaceholder="Buscar reserva..."
        nombre="Gestion de Reservas"
      />

      {detalleModalOpen && (
        <Modal
          backdrop="blur"
          isOpen={detalleModalOpen}
          onClose={closeDetalleModal}
        >
          <ModalContent className="max-w-3xl mx-auto bg-white rounded-lg shadow-lg overflow-hidden">
            {() => (
              <>
                <ModalHeader className="border-b border-gray-200 px-6 py-4">
                  <h2 className="text-xl font-semibold text-gray-800">
                    Detalle de Reserva
                  </h2>
                </ModalHeader>
                <ModalBody className="px-6 py-4">
                  {detalleLoading && (
                    <div className="flex justify-center py-4">
                      <Spinner
                        color="success"
                        label="Cargarndo..."
                        labelColor="success"
                      />
                    </div>
                  )}
                  {detalleError && (
                    <div className="text-center text-red-500">
                      {detalleError}
                    </div>
                  )}
                  {detalleReserva && (
                    <div className="space-y-6">
                      <div>
                        <p className="text-gray-700">
                          <strong>Usuario:</strong>{" "}
                          {detalleReserva.usuario.nombre_completo}
                        </p>
                        <p className="text-gray-700">
                          <strong>Crucero:</strong>{" "}
                          {detalleReserva.crucero.nombre}
                        </p>
                        <Chip color="warning" variant="flat">
                          Estado: {detalleReserva.estado}
                        </Chip>
                      </div>
                      <div>
                        <p className="text-gray-700">
                          <strong>Huéspedes:</strong>{" "}
                          {detalleReserva.cantidad_huespedes}
                        </p>
                        <p className="text-gray-700">
                          <strong>Fecha de Reserva:</strong>{" "}
                          {new Date(
                            detalleReserva.fecha_reserva,
                          ).toLocaleDateString("es-ES")}
                        </p>
                      </div>
                      <div>
                        <h3 className="text-lg font-medium text-gray-800 mb-2">
                          Detalles y Complementos
                        </h3>
                        <table className="min-w-full text-sm text-gray-700">
                          <thead className="bg-gray-100">
                            <tr>
                              <th className="px-4 py-2 text-left">
                                Complemento
                              </th>
                              <th className="px-4 py-2 text-left">
                                Descripción
                              </th>
                              <th className="px-4 py-2 text-left">Cantidad</th>
                              <th className="px-4 py-2 text-left">Subtotal</th>
                            </tr>
                          </thead>
                          <tbody>
                            {detalleReserva.detalles.map((detalle) => (
                              <tr
                                key={detalle.id_detalle}
                                className="border-b border-gray-200"
                              >
                                <td className="px-4 py-2">
                                  {detalle.complemento.nombre}
                                </td>
                                <td className="px-4 py-2">
                                  {detalle.complemento.descripcion}
                                </td>
                                <td className="px-4 py-2">
                                  {detalle.cantidad}
                                </td>
                                <td className="px-4 py-2">
                                  {detalle.subtotal}
                                </td>
                              </tr>
                            ))}
                          </tbody>
                        </table>
                      </div>
                      <div>
                        <Textarea
                          isReadOnly
                          className="w-full"
                          defaultValue="Aquí puedes agregar notas sobre la reserva."
                          label="Notas"
                          labelPlacement="outside"
                          placeholder="Ingrese una descripción"
                          variant="bordered"
                        />
                      </div>
                    </div>
                  )}
                </ModalBody>
              </>
            )}
          </ModalContent>
        </Modal>
      )}
    </div>
  );
};

export default ReservasPage;
