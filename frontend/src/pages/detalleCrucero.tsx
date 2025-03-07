import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

import { cruceroService, Crucero } from "../api/cruceros";
import { barcoService, Barco } from "../api/barcos";

import DefaultLayout from "@/layouts/default";
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

  console.log(index);

  if (loading) return <p>Cargando crucero...</p>;
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
          <main className="">
            {(() => {
              switch (index) {
                case 1:
                  return indexSalida();
                case 2:
                  return indexItinerario();
                case 3:
                  return indexIncluido();
                case 4:
                  return indexBarcos();
                case 5:
                  return indexHabitaciones();
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

const indexSalida = () => {
  return <p>Fechas Salida</p>;
};

const indexItinerario = () => {
  return <p>Itinerario </p>;
};

const indexIncluido = () => {
  return <p>Paquetes incluidos</p>;
};

const indexBarcos = () => {
  return <p>Info del Barco</p>;
};
const indexHabitaciones = () => {
  return <p>Info de las Habitaciones</p>;
};
