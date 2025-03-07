import { useState } from "react";
import {
  Button,
  Chip,
  Modal,
  ModalContent,
  ModalHeader,
  ModalBody,
  Badge,
} from "@heroui/react";

import { reservaService, Reserva } from "../../api/reservas";
import { DataTable } from "../../components/common/DataTable";
import { useAuth } from "../../contexts/AuthContext";
import useFetchData from "../../hooks/useFetchData";
import { getDetalleReserva, DetalleReserva } from "../../api/detalleReserva";

import LoadingScreen from "@/components/loading";

const ReservasPage = () => {
  const { user, loading: authLoading } = useAuth();
  const {
    data: reservas,
    loading,
    error,
  } = useFetchData<Reserva[]>(reservaService.getAll);

  const [detalleModalOpen, setDetalleModalOpen] = useState(false);
  const [detalleReserva, setDetalleReserva] = useState<DetalleReserva | null>(
    null,
  );
  const [detalleLoading, setDetalleLoading] = useState(false);

  const [selectedReservaEstado, setSelectedReservaEstado] = useState<
    string | null
  >(null);

  const openDetalleModal = (reserva: Reserva) => {
    setDetalleModalOpen(true);
    setSelectedReservaEstado(reserva.estado);
    setDetalleLoading(true);
    getDetalleReserva(reserva.id_reserva)
      .then((data) => {
        setDetalleReserva(data);
        setDetalleLoading(false);
      })
      .catch(() => setDetalleLoading(false));
  };

  const closeDetalleModal = () => {
    setDetalleModalOpen(false);
    setDetalleReserva(null);
  };

  const columns = [
    { uid: "id_reserva", name: "ID Reserva", sortable: true },
    {
      uid: "id_usuario",
      name: "Usuario",
      sortable: true,
    },
    { uid: "estado", name: "Estado", sortable: true },
    { uid: "fecha_reserva", name: "Fecha Reserva", sortable: true },
    { uid: "actions", name: "Acciones" },
  ];

  const renderCell = (
    reserva: Reserva,
    columnKey: keyof Reserva | "actions",
  ) => {
    switch (columnKey) {
      case "fecha_reserva":
        return new Date(reserva.fecha_reserva).toLocaleDateString("es-ES", {
          year: "numeric",
          month: "long",
          day: "numeric",
        });

      case "id_usuario":
        return reserva.usuario?.nombre_completo || `ID: ${reserva.id_usuario}`;

      case "estado":
        return (
          <Chip
            color={
              reserva.estado.toLowerCase() === "cancelada"
                ? "success"
                : reserva.estado.toLowerCase() === "parcial"
                  ? "warning"
                  : "danger"
            }
            variant="flat"
          >
            {reserva.estado}
          </Chip>
        );

      case "actions":
        return (
          <div className="flex gap-2 justify-center">
            <Button
              color="primary"
              size="sm"
              onPress={() => openDetalleModal(reserva)}
            >
              Detalles
            </Button>
            <Button color="danger" size="sm">
              Cancelar
            </Button>
          </div>
        );

      default:
        const value = reserva[columnKey as keyof Reserva];

        return JSON.stringify(value);
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
        {LoadingScreen("Reservas")}{" "}
      </div>
    );

  return (
    <div className="divAdmin">
      <DataTable<Reserva>
        addButtonLabel="Nueva Reserva"
        columns={columns}
        data={reservas || []}
        initialVisibleColumns={[
          "id_usuario",
          "fecha_reserva",
          "estado",
          "actions",
        ]}
        nombre="Gestión de Reservas"
        renderCell={renderCell}
        rowKey="id_reserva"
        searchPlaceholder="Buscar reserva..."
      />

      <Modal
        backdrop="blur"
        isOpen={detalleModalOpen}
        size="5xl"
        onClose={closeDetalleModal}
      >
        <ModalContent className="max-w-4xl rounded-xl shadow-2xl">
          <>
            <ModalHeader className="bg-primary text-white py-2 px-8 rounded-t-xl">
              <div className="flex flex-col space-y-1">
                <h2 className="text-2xl font-bold">Detalle de Reserva</h2>
                <p className="text-sm font-light opacity-90">
                  Reservación del usuario:{" "}
                  {detalleReserva?.usuario?.nombre_completo ||
                    "Nombre no disponible"}
                </p>
              </div>
            </ModalHeader>

            <ModalBody className="p-6 space-y-6 max-h-[70vh] overflow-y-auto">
              {detalleLoading && (
                <div className="flew-grow h-[calc(100vh-108px)] w-full">
                  {" "}
                  {LoadingScreen("Detalles")}{" "}
                </div>
              )}

              {detalleReserva && (
                <div className="space-y-8">
                  {/* Sección Principal */}
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    {/* Información del Crucero */}
                    <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                      <div className="flex items-center gap-3 mb-4">
                        <div className="bg-primary py-3 px-4 rounded-full">
                          <i
                            className="fi fi-rr-ship text-lg text-white"
                            id="iconBarco"
                          />
                        </div>
                        <div>
                          <h3 className="text-lg font-semibold">
                            {detalleReserva.crucero.nombre}
                          </h3>
                          <p className="text-sm text-gray-600">
                            {detalleReserva.crucero.cantidad_dias} días ·{" "}
                            {detalleReserva.crucero.barco?.nombre}
                          </p>
                        </div>
                      </div>

                      <div className="space-y-4">
                        <div className="flex items-center gap-2">
                          <svg
                            className="w-5 h-5 text-gray-500"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                          >
                            <path
                              d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              strokeWidth="2"
                            />
                          </svg>
                          <p>
                            {new Date(
                              detalleReserva.fecha_inicio,
                            ).toLocaleDateString()}{" "}
                            -{" "}
                            {new Date(
                              detalleReserva.fecha_fin,
                            ).toLocaleDateString()}
                          </p>
                        </div>

                        <div className="flex items-center gap-2">
                          <svg
                            className="w-5 h-5 text-gray-500"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                          >
                            <path
                              d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              strokeWidth="2"
                            />
                            <path
                              d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              strokeWidth="2"
                            />
                          </svg>
                          <p>
                            {detalleReserva.puerto_salida.nombre} →{" "}
                            {detalleReserva.puerto_regreso.nombre}
                          </p>
                        </div>
                      </div>
                    </div>

                    {/* Estado de Pago */}
                    <div
                      className={`p-6 rounded-lg flex flex-col justify-between ${
                        selectedReservaEstado?.toLowerCase() === "cancelada" ||
                        detalleReserva.factura?.metodo_pago === "pago_unico"
                          ? "bg-green-50 border border-green-200"
                          : selectedReservaEstado?.toLowerCase() === "parcial"
                            ? "bg-yellow-50 border border-yellow-200"
                            : detalleReserva.factura?.estado === "pagado"
                              ? "bg-green-50 border border-green-200"
                              : "bg-yellow-50 border border-yellow-200"
                      }`}
                    >
                      <div>
                        <div className="flex items-center justify-between mb-4">
                          <h3 className="font-semibold text-lg">
                            Estado del Pago
                          </h3>
                          <Badge
                            color={
                              selectedReservaEstado?.toLowerCase() ===
                                "cancelada" ||
                              detalleReserva.factura?.metodo_pago ===
                                "pago_unico"
                                ? "success"
                                : selectedReservaEstado?.toLowerCase() ===
                                    "parcial"
                                  ? "warning"
                                  : detalleReserva.factura?.estado === "pagado"
                                    ? "success"
                                    : "warning"
                            }
                            variant="shadow"
                          >
                            {selectedReservaEstado?.toLowerCase() ===
                            "cancelada"
                              ? "Cancelado"
                              : detalleReserva.factura?.metodo_pago ===
                                  "pago_unico"
                                ? "Pagado"
                                : selectedReservaEstado?.toLowerCase() ===
                                    "parcial"
                                  ? "Pendiente"
                                  : detalleReserva.factura?.estado ||
                                    "pendiente"}
                          </Badge>
                        </div>

                        {(selectedReservaEstado?.toLowerCase() ===
                          "cancelada" ||
                          (detalleReserva.factura?.metodo_pago ===
                            "dos_pagos" &&
                            selectedReservaEstado?.toLowerCase() ===
                              "parcial")) && (
                          <p className="text-sm text-gray-600">
                            {selectedReservaEstado?.toLowerCase() ===
                            "cancelada"
                              ? "Pago cancelado realizado"
                              : "Pago parcial realizado"}
                          </p>
                        )}
                      </div>
                      <div className="mt-4">
                        <p className="text-2xl font-bold text-gray-800">
                          $
                          {selectedReservaEstado?.toLowerCase() ===
                            "cancelada" ||
                          detalleReserva.factura?.metodo_pago === "pago_unico"
                            ? 0
                            : (detalleReserva.factura?.total || 0).toFixed(2)}
                        </p>
                      </div>
                    </div>
                  </div>

                  {/* Huéspedes */}
                  <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                    <h3 className="text-lg font-semibold mb-4">Huéspedes</h3>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                      {detalleReserva.huespedes.map((huesped) => (
                        <div
                          key={huesped.id_huesped}
                          className="p-4 bg-gray-50 rounded-lg"
                        >
                          <div className="flex items-center gap-3">
                            <div className="flex-shrink-0">
                              <div className="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center">
                                <svg
                                  className="w-5 h-5 text-blue-600"
                                  fill="none"
                                  stroke="currentColor"
                                  viewBox="0 0 24 24"
                                >
                                  <path
                                    d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                                    strokeLinecap="round"
                                    strokeLinejoin="round"
                                    strokeWidth="2"
                                  />
                                </svg>
                              </div>
                            </div>
                            <div>
                              <p className="font-medium">
                                {huesped.nombre_completo}
                              </p>
                              <p className="text-sm text-gray-600">
                                {huesped.edad} años · {huesped.genero} ·{" "}
                                {huesped.nacionalidad}
                              </p>
                            </div>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>

                  {/* Detalles de Costos */}
                  <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                    {/* Habitaciones */}
                    <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                      <h3 className="text-lg font-semibold mb-4">
                        Habitaciones
                      </h3>
                      <div className="space-y-4">
                        {detalleReserva.detalles
                          .filter((d) => d.habitacion)
                          .map((detalle) => (
                            <div
                              key={detalle.id_detalle}
                              className="flex justify-between items-center p-3 bg-gray-50 rounded"
                            >
                              <div>
                                <p className="font-medium">
                                  {detalle.habitacion?.nombre}
                                </p>
                                <p className="text-sm text-gray-600">
                                  {detalle.habitacion?.categoria}
                                </p>
                              </div>
                              <div className="text-right">
                                <p className="text-sm">
                                  {detalle.cantidad} × $
                                  {(
                                    Number(detalle.subtotal) /
                                    (detalle.cantidad || 1)
                                  ).toFixed(2)}
                                </p>
                                <p className="font-medium">
                                  ${Number(detalle.subtotal).toFixed(2)}
                                </p>
                              </div>
                            </div>
                          ))}
                        <div className="pt-4 border-t">
                          <div className="flex justify-between font-semibold">
                            <span>Total Habitaciones:</span>
                            <span>
                              $
                              {(detalleReserva.total_habitaciones || 0).toFixed(
                                2,
                              )}
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>

                    {/* Complementos */}
                    <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-100">
                      <h3 className="text-lg font-semibold mb-4">
                        Complementos
                      </h3>
                      <div className="space-y-4">
                        {detalleReserva.detalles
                          .filter((d) => d.complemento)
                          .map((detalle) => (
                            <div
                              key={detalle.id_detalle}
                              className="flex justify-between items-center p-3 bg-gray-50 rounded"
                            >
                              <div>
                                <p className="font-medium">
                                  {detalle.complemento?.nombre}
                                </p>
                                <p className="text-sm text-gray-600">
                                  {detalle.complemento?.descripcion}
                                </p>
                              </div>
                              <div className="text-right">
                                <p className="text-sm">
                                  {detalle.cantidad} × $
                                  {(
                                    Number(detalle.complemento?.precio) || 0
                                  ).toFixed(2)}
                                </p>
                                <p className="font-medium">
                                  ${Number(detalle.subtotal).toFixed(2)}
                                </p>
                              </div>
                            </div>
                          ))}
                        <div className="pt-4 border-t">
                          <div className="flex justify-between font-semibold">
                            <span>Total Complementos:</span>
                            <span>
                              $
                              {(detalleReserva.total_complementos || 0).toFixed(
                                2,
                              )}
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* Resumen de Pagos */}
                  <div className="bg-primary p-6 rounded-lg border border-primary-50">
                    <h3 className="text-lg font-semibold mb-4 text-white">
                      Desglose de Pagos
                    </h3>
                    <div className="space-y-3">
                      <div className="flex justify-between  text-white">
                        <span>Subtotal:</span>
                        <span className="font-medium">
                          $
                          {(
                            (detalleReserva.total_habitaciones || 0) +
                            (detalleReserva.total_complementos || 0)
                          ).toFixed(2)}
                        </span>
                      </div>

                      <div className="flex justify-between  text-white">
                        <span>
                          Impuestos ({detalleReserva.factura?.impuestos || 0}%):
                        </span>
                        <span className="font-medium">
                          $
                          {(
                            ((detalleReserva.total_habitaciones +
                              detalleReserva.total_complementos) *
                              (detalleReserva.factura?.impuestos || 0)) /
                            100
                          ).toFixed(2)}
                        </span>
                      </div>

                      <div className="flex justify-between  text-white">
                        <span>Tarifas:</span>
                        <span className="font-medium">
                          ${(detalleReserva.factura?.tarifas || 0).toFixed(2)}
                        </span>
                      </div>

                      <div className="flex justify-between pt-3 border-t border-white-200 text-white">
                        <span className="font-bold">Total:</span>
                        <span className="font-bold text-primary-50">
                          $
                          {(
                            detalleReserva.total_habitaciones +
                            detalleReserva.total_complementos +
                            ((detalleReserva.total_habitaciones +
                              detalleReserva.total_complementos) *
                              (detalleReserva.factura?.impuestos || 0)) /
                              100 +
                            (detalleReserva.factura?.tarifas || 0)
                          ).toFixed(2)}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              )}
            </ModalBody>
          </>
        </ModalContent>
      </Modal>
    </div>
  );
};

export default ReservasPage;
