// src/pages/DetalleFacturaPage.tsx
import React, { useState, useEffect } from "react";
import { Button, Spinner, Card } from "@heroui/react";

import { getDetalleFactura, DetalleFactura } from "../../api/detalleFactura";

interface DetalleFacturaPageProps {
  reservaId: number;
  onClose: () => void;
}

const DetalleFacturaPage: React.FC<DetalleFacturaPageProps> = ({
  reservaId,
  onClose,
}) => {
  const [detalle, setDetalle] = useState<DetalleFactura | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    setLoading(true);
    getDetalleFactura(reservaId)
      .then((data) => {
        setDetalle(data);
        setLoading(false);
      })
      .catch((err) => {
        setError(err.message);
        setLoading(false);
      });
  }, [reservaId]);

  if (loading)
    return (
      <div className="flex justify-center py-4">
        <Spinner label="Cargando factura..." />
      </div>
    );
  if (error) return <div className="text-red-500">{error}</div>;
  if (!detalle) return null;

  return (
    <div className="p-4">
      <h2 className="text-2xl font-bold mb-4">Factura de Reserva</h2>
      <div className="mb-4">
        <p>
          <strong>Crucero:</strong> {detalle.nombre_crucero}
        </p>
        <p>
          <strong>Puerto de Salida:</strong> {detalle.puerto_salida}
        </p>
        <p>
          <strong>Puerto de Regreso:</strong> {detalle.puerto_regreso}
        </p>
        <p>
          <strong>Fecha de Inicio:</strong> {detalle.fecha_inicio}
        </p>
        <p>
          <strong>Fecha de Fin:</strong> {detalle.fecha_fin}
        </p>
      </div>

      <div className="mb-4">
        <h3 className="font-bold">Habitaciones</h3>
        {detalle.habitaciones.map((hab, index) => (
          <Card key={index} className="mb-2 p-2">
            <p>
              <strong>Habitación:</strong> {hab.habitacion_nombre}
            </p>
            <p>
              <strong>Cantidad de Habitaciones:</strong>{" "}
              {hab.cantidad_habitaciones}
            </p>
            <p>
              <strong>Huéspedes por Habitación:</strong>{" "}
              {hab.huespedes_por_habitacion}
            </p>
            <p>
              <strong>Total:</strong> ${hab.subtotal}
            </p>
          </Card>
        ))}
        <p>
          <strong>Total Habitaciones:</strong> ${detalle.total_habitaciones}
        </p>
      </div>

      <div className="mb-4">
        <h3 className="font-bold">Complementos</h3>
        {detalle.complementos.map((comp, index) => (
          <Card key={index} className="mb-2 p-2">
            <p>
              <strong>Complemento:</strong> {comp.nombre_complemento}
            </p>
            <p>
              <strong>Cantidad:</strong> {comp.cantidad}
            </p>
            <p>
              <strong>Total:</strong> ${comp.total}
            </p>
          </Card>
        ))}
        <p>
          <strong>Total Complementos:</strong> ${detalle.total_complementos}
        </p>
      </div>

      <div className="mb-4">
        <p>
          <strong>Subtotal:</strong> ${detalle.subtotal}
        </p>
        <p>
          <strong>Impuestos (10%):</strong> ${detalle.impuestos}
        </p>
        <p>
          <strong>Tarifas (5%):</strong> ${detalle.tarifas}
        </p>
        <p>
          <strong>Total a Pagar:</strong> ${detalle.total}
        </p>
      </div>

      <div className="mb-4">
        <p>
          <strong>Estado de Pago:</strong> {detalle.estado_pago}
        </p>
        {detalle.estado_pago.toLowerCase() === "pendiente" && (
          <>
            <p>
              <strong>Fecha Límite de Pago:</strong> {detalle.fecha_limite_pago}
            </p>
            <p>
              <strong>Monto a Pagar:</strong> ${detalle.monto_a_pagar}
            </p>
          </>
        )}
      </div>

      <Button color="primary" onPress={onClose}>
        Cerrar
      </Button>
    </div>
  );
};

export default DetalleFacturaPage;
