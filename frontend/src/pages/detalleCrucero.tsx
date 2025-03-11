import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import {
  Table,
  TableHeader,
  TableColumn,
  TableBody,
  TableRow,
  TableCell,
  Divider,
  Chip,
} from "@heroui/react";

import { crucerosGet, Crucero } from "../api/cruceros";
import { Barco } from "../api/barcos";

import DefaultLayout from "@/layouts/default";
import LoadingScreen from "@/components/loading";
import "../styles/detallesCrucero.css";

export default function DocsPage() {
  const navigate = useNavigate();
  const [index, setIndex] = useState(1);
  const { id } = useParams();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [crucero, setCrucero] = useState<Crucero | null>(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const dataCrucero = await crucerosGet.getById(Number(id));

        if (!dataCrucero) {
          setError("Error al extraer la data");
        } else {
          setCrucero(dataCrucero);
        }
      } catch (err) {
        setError("Error al obtener los datos: ", err);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [id]);

  const obtenerPrecioMasBajo = () => {
    const precioMasBajoCrucero = crucero?.fechas
      ?.filter((f) => new Date(f.fecha_inicio).getTime() >= Date.now())
      .reduce((precioMinimo, fecha) => {
        const precios = fecha.precios_habitaciones?.map(
          (habitacion) => habitacion.precio,
        );

        if (precios && precios.length > 0) {
          const precioMinimoFecha = Math.min(...precios);

          return precioMinimoFecha < precioMinimo
            ? precioMinimoFecha
            : precioMinimo;
        }

        return precioMinimo;
      }, Infinity);

    return precioMasBajoCrucero;
  };

  if (loading)
    return (
      <div className="h-[calc(100vh-60px)] w-[100%]">
        {" "}
        {LoadingScreen("Crucero")}{" "}
      </div>
    );
  if (error) return <p>Error: {error}</p>;

  return (
    <DefaultLayout>
      <section className="flex-grow min-h-[calc(100vh-108px)] crucero_detalle">
        <header className="header">
          <p className="atras" onClick={() => navigate(-1)}>{`<- Atras`}</p>
          <img alt="" src={`/${crucero?.foto}`} />
          <div className="header_detalle">
            <h1 className="name">{crucero?.nombre}</h1>
            <div className="detalle_contenido">
              <div className="info">
                <div>
                  <p>
                    <i className="fi fi-rr-ship" /> {crucero?.barco?.nombre}
                  </p>
                  <p>
                    <i className="fi fi-rr-anchor" /> {crucero?.destino?.nombre}
                  </p>
                  <p>
                    <i className="fi fi-rr-sunrise" /> {`${crucero?.dias} días`}
                  </p>
                  <p>
                    <i className="fi fi-rr-moon" />{" "}
                    {`${crucero?.dias ? crucero.dias - 1 : ""} noches`}
                  </p>
                </div>
                <Divider className="my-2" />
                <div className="precios">
                  <p className="text text-gray-500">Precios desde:</p>
                  <p className="precio">₡{obtenerPrecioMasBajo()}</p>
                </div>
              </div>
              <Divider className="hidden sm:flex" orientation="vertical" />
              <Divider className="sm:hidden" />
              <div className="complementos">
                <p>Complementos</p>
                <div>
                  {crucero?.complementos?.map((c) => (
                    <Chip
                      key={c.id}
                      className="m-1"
                      color="primary"
                      size="sm"
                      variant="bordered"
                    >
                      {c.nombre}
                    </Chip>
                  ))}
                </div>
              </div>
            </div>
            <Divider className="mx-5" />
            <div className="puertos">
              <p>Puertos:</p>
              <div>
                {crucero?.itinerarios
                  ?.filter((i) => i.puerto?.nombre !== "Navegando")
                  .map((i) => (
                    <Chip
                      key={i.id}
                      className="m-1"
                      color="primary"
                      size="sm"
                      variant="dot"
                    >
                      {i.puerto?.nombre}
                    </Chip>
                  ))}
              </div>
            </div>
          </div>
        </header>
        <div>
          <nav className="crucero_nav">
            <button
              className={index === 1 ? "select" : ""}
              onClick={() => setIndex(1)}
            >
              Fechas Salida
            </button>
            <button
              className={index === 2 ? "select" : ""}
              onClick={() => setIndex(2)}
            >
              Itinerario
            </button>
            <button
              className={index === 3 ? "select" : ""}
              onClick={() => setIndex(3)}
            >
              ¿Que está incluido?
            </button>
            <button
              className={index === 4 ? "select" : ""}
              onClick={() => setIndex(4)}
            >
              Barco
            </button>
            <button
              className={index === 5 ? "select" : ""}
              onClick={() => setIndex(5)}
            >
              Habitaciones
            </button>
          </nav>
          <main className="crucero_main">
            {(() => {
              switch (index) {
                case 1:
                  return <IndexSalida crucero={crucero ? crucero : null} />;
                case 2:
                  return <IndexItinerario crucero={crucero ? crucero : null} />;
                case 3:
                  return <IndexIncluido crucero={crucero ? crucero : null} />;
                case 4:
                  return (
                    <IndexBarcos
                      barco={crucero?.barco ? crucero.barco : null}
                    />
                  );
                case 5:
                  return (
                    <IndexHabitaciones
                      barco={crucero?.barco ? crucero.barco : null}
                    />
                  );
                default:
                  return <p>Selecciona una opción</p>;
              }
            })()}
          </main>
        </div>
      </section>
    </DefaultLayout>
  );
}

const IndexSalida = ({ crucero }: { crucero: Crucero | null }) => {
  return (
    <div className="h-full">
      {crucero?.fechas
        ?.filter((f) => new Date(f.fecha_inicio).getTime() >= Date.now())
        .map((f) => {
          const fechaInicio = new Date(f.fecha_inicio + "T12:00:00Z"); // Convertimos la fecha
          const fechaFin = new Date(fechaInicio); // Creamos una copia para evitar mutar la original

          fechaFin.setDate(fechaFin.getDate() + crucero?.dias); // Sumamos 1 día correctamente

          return (
            <div key={f.id} className="crucero_salidas">
              <p className="bg-primary fecha">
                Desde el{" "}
                {fechaInicio.toLocaleDateString("es-MX", {
                  year: "numeric",
                  month: "long",
                  day: "numeric",
                })}{" "}
                hasta el{" "}
                {fechaFin.toLocaleDateString("es-MX", {
                  year: "numeric",
                  month: "long",
                  day: "numeric",
                })}
              </p>
              <div className="preciosList">
                {f.precios_habitaciones?.map((p) => {
                  return (
                    <div key={p.id}>
                      <p>{p.habitacion?.categoria}</p>
                      <p>${p.precio}</p>
                    </div>
                  );
                })}
              </div>
            </div>
          );
        })}
    </div>
  );
};

const IndexItinerario = ({ crucero }: { crucero: Crucero | null }) => {
  return (
    <Table aria-label="Itinerario del crucero">
      <TableHeader>
        <TableColumn>Día</TableColumn>
        <TableColumn>Puerto</TableColumn>
        <TableColumn>Descripción</TableColumn>
        <TableColumn className="text-center justify-center">
          Hora Llegada
        </TableColumn>
        <TableColumn className="text-center justify-center">
          Hora Salida
        </TableColumn>
      </TableHeader>
      <TableBody>
        {crucero ? (
          crucero?.itinerarios?.map((i) => (
            <TableRow key={i.id} className="text-center justify-center">
              <TableCell>Día {i.dia}</TableCell>
              <TableCell>
                {i.puerto?.nombre}, {i.puerto?.pais}
              </TableCell>
              <TableCell>{i.descripcion}</TableCell>
              <TableCell className="text-center justify-center">
                {i.llegada ? `${i.salida}:00` : `-:--`}
              </TableCell>
              <TableCell className="text-center justify-center">
                {i.llegada ? `${i.salida}:00` : `-:--`}
              </TableCell>
            </TableRow>
          ))
        ) : (
          <TableRow className="text-center justify-center">
            <TableCell> - </TableCell>
            <TableCell> - </TableCell>
            <TableCell> - </TableCell>
            <TableCell className="text-center justify-center">-</TableCell>
            <TableCell className="text-center justify-center">-</TableCell>
          </TableRow>
        )}
      </TableBody>
    </Table>
  );
};

const IndexIncluido = ({ crucero }: { crucero: Crucero | null }) => {
  return <p>Paquetes incluidos</p>;
};

const IndexBarcos = ({ barco }: { barco: Barco | null }) => {
  return <p>Info del Barco</p>;
};

const IndexHabitaciones = ({ barco }: { barco: Barco | null }) => {
  return <p>Info de las Habitaciones</p>;
};
