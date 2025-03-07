import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import {
  Table,
  TableHeader,
  TableColumn,
  TableBody,
  TableRow,
  TableCell,
} from "@heroui/react";

import {
  cruceroService,
  Crucero,
  fechaCruceroService,
  FechaCrucero,
} from "../api/cruceros";
import { barcoService, Barco } from "../api/barcos";
import { itinerarioService, Itinerario } from "../api/itinerario";
import { puertoService, Puerto } from "../api/puertos";
import {
  precioHabitacionService,
  PrecioHabitacion,
} from "../api/precioHabitacion";
import { habitacionService, Habitacion } from "../api/habitaciones";

import DefaultLayout from "@/layouts/default";
import LoadingScreen from "@/components/loading";
import "../styles/detallesCrucero.css";

export default function DocsPage() {
  const [index, setIndex] = useState(1);
  const { id } = useParams();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [crucero, setCrucero] = useState<Crucero | null>(null);
  const [barco, setBarco] = useState<Barco | null>(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const dataCrucero = (await cruceroService.getAll()).find(
          (c) => c.id_crucero === Number(id),
        );
        const dataBarco = (await barcoService.getAll()).find(
          (b) => dataCrucero?.id_barco === b.id_barco,
        );

        if (!dataCrucero || !dataBarco) {
          setError("Error al extraer la data");
        } else {
          setCrucero(dataCrucero);
          setBarco(dataBarco);
        }
      } catch (err) {
        setError("Error al obtener los datos: ", err);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [id]);

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
          <img alt="" src="/crucero.png" />
          <div className="header_detalle">
            <h1 className="name">{crucero?.nombre}</h1>
            <div className="detalle_contenido">
              <p>
                <i className="fi fi-rr-ship" /> {barco?.nombre}
              </p>
              <p>
                <i className="fi fi-rr-anchor" /> Algun Puerto
              </p>
              <p>
                <i className="fi fi-rr-sunrise" />{" "}
                {`${crucero?.cantidad_dias} días`}
              </p>
              <p>
                <i className="fi fi-rr-moon" />{" "}
                {`${crucero?.cantidad_dias - 1} noches`}
              </p>
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
                  return <IndexSalida idCrucero={Number(id)} />;
                case 2:
                  return <IndexItinerario idCrucero={Number(id)} />;
                case 3:
                  return <IndexIncluido idCrucero={Number(id)} />;
                case 4:
                  return <IndexBarcos barco={barco} />;
                case 5:
                  return <IndexHabitaciones barco={barco} />;
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

const IndexSalida = ({ idCrucero }: { idCrucero: number }) => {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [fechas, setFechas] = useState<FechaCrucero[]>([]);
  const [habitaciones, setHabitaciones] = useState<Habitacion[]>([]);
  const [precios, setPrecios] = useState<PrecioHabitacion[]>([]);
  const [crucero, setCrucero] = useState<Crucero | null>(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const dataCrucero = (await cruceroService.getAll()).find(
          (c) => c.id_crucero === Number(idCrucero),
        );
        const dataFechas = (await fechaCruceroService.getAll()).filter(
          (f) =>
            f.id_crucero === Number(idCrucero) &&
            new Date(f.fecha_inicio).getTime() >= Date.now(),
        );
        const dataPrecio = await precioHabitacionService.getALL();
        const dataHabitacion = await habitacionService.getAll();

        if (!dataFechas || !dataPrecio || !dataCrucero || !dataHabitacion) {
          setError("Error al extraer la data");
        } else {
          setCrucero(dataCrucero);
          setFechas(dataFechas);
          setPrecios(dataPrecio);
          setHabitaciones(dataHabitacion);
        }
      } catch (err) {
        setError("Error al obtener los datos: ", err);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [idCrucero]);

  if (loading)
    return (
      <div className="flew-grow h-80">
        {" "}
        {LoadingScreen("Fechas de Salida")}{" "}
      </div>
    );
  if (error) return <p>Error: {error}.</p>;

  return (
    <div>
      {fechas.map((f) => {
        const fechaInicio = new Date(f.fecha_inicio + "T12:00:00Z"); // Convertimos la fecha
        const fechaFin = new Date(fechaInicio); // Creamos una copia para evitar mutar la original

        fechaFin.setDate(fechaFin.getDate() + crucero?.cantidad_dias); // Sumamos 1 día correctamente

        return (
          <div key={f.id_fecha} className="crucero_salidas">
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
              {precios
                .filter((p) => p.id_fecha === f.id_fecha)
                .map((p) => {
                  const habitacion = habitaciones.find(
                    (h) => h.id_habitacion === p.id_habitacion,
                  );

                  return (
                    <div key={p.id_precio}>
                      <p>{habitacion?.categoria}</p>
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

const IndexItinerario = ({ idCrucero }: { idCrucero: number }) => {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [itinerario, setItinerario] = useState<Itinerario[]>([]);
  const [puertos, setPuertos] = useState<Puerto[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const data = await itinerarioService.getByCrucero(idCrucero);
        const dataPuertos = await puertoService.getAll();

        if (!data || !dataPuertos) {
          setError("Error al extraer la data");
        } else {
          setItinerario(data);
          setPuertos(dataPuertos);
        }
      } catch (err) {
        setError("Error al obtener los datos");
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [idCrucero]);

  if (loading)
    return (
      <div className="flew-grow h-80"> {LoadingScreen("Itinerario")} </div>
    );
  if (error) return <p>Error: {error}.</p>;

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
        {itinerario.map((i) => (
          <TableRow
            key={i.id_itinerario}
            className="text-center justify-center"
          >
            <TableCell>Día {i.dia}</TableCell>
            <TableCell>
              {puertos.find((p) => p.id_puerto === i.id_puerto)?.nombre},{" "}
              {puertos.find((p) => p.id_puerto === i.id_puerto)?.pais}
            </TableCell>
            <TableCell>{i.descripcion}</TableCell>
            <TableCell className="text-center justify-center">
              {i.hora_llegada ? `${i.hora_llegada}:00` : `-:--`}
            </TableCell>
            <TableCell className="text-center justify-center">
              {i.hora_salida ? `${i.hora_salida}:00` : `-:--`}
            </TableCell>
          </TableRow>
        ))}
      </TableBody>
    </Table>
  );
};

const IndexIncluido = ({ idCrucero }: { idCrucero: number }) => {
  return <p>Paquetes incluidos</p>;
};

const IndexBarcos = ({ barco }: { barco: Barco | null }) => {
  return <p>Info del Barco</p>;
};

const IndexHabitaciones = ({ barco }: { barco: Barco | null }) => {
  return <p>Info de las Habitaciones</p>;
};
