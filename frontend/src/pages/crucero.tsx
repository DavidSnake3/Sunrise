import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

import { crucerosGet, Crucero } from "../api/cruceros";

import DefaultLayout from "@/layouts/default";
import LoadingScreen from "@/components/loading";

import "../styles/crucero.css";
import {
  Input,
  Divider,
  Button,
  DateRangePicker,
  Select,
  SelectItem,
  Chip,
} from "@heroui/react";

import { Destino, destinoService } from "@/api/destinos";

export default function DocsPage() {
  const Navigate = useNavigate();
  const [searchText, setSearchText] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [cruceros, setCruceros] = useState<Crucero[]>([]);
  const [destinos, setDestinos] = useState<Destino[]>([]);

  // Estados para los filtros
  const [fechas, setFechas] = useState<[Date | null, Date | null]>([
    null,
    null,
  ]);
  const [destinoSeleccionado, setDestinoSeleccionado] = useState("");
  const [diasSeleccionados, setDiasSeleccionados] = useState("");

  useEffect(() => {
    const fetchData = async () => {
      try {
        const data = await crucerosGet.getAll();
        const dataDestino = (await destinoService.getAll()).filter(
          (d) => d.nombre !== "Oceano",
        );

        if (!data || !dataDestino) {
          setError("Error al extraer la data");
        } else {
          setCruceros(data);
          setDestinos(dataDestino);
        }
      } catch (err) {
        const errorMessage =
          err instanceof Error ? err.message : "Error desconocido";

        setError(errorMessage);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  // Obtener la lista de días únicos de los cruceros
  const diasUnicos = [...new Set(cruceros.map((crucero) => crucero.dias))].sort(
    (a, b) => a - b,
  );

  // Filtrar los cruceros según los controles seleccionados
  // Filtrar los cruceros según los controles seleccionados
  const crucerosFiltrados = cruceros.filter((crucero) => {
    const coincideTexto =
      searchText === "" ||
      crucero.nombre.toLowerCase().includes(searchText.toLowerCase());

    const coincideDestino =
      !destinoSeleccionado ||
      crucero.destino?.id === parseInt(destinoSeleccionado);
    const coincideDias =
      !diasSeleccionados || crucero.dias === parseInt(diasSeleccionados);

    return coincideTexto && coincideDias && coincideDestino;
  });

  const clear = () => {
    setFechas([null, null]); // Restablecer las fechas
    setDestinoSeleccionado(""); // Restablecer el destino seleccionado
    setDiasSeleccionados(""); // Restablecer los días seleccionados
  };

  if (loading)
    return (
      <div className="h-[calc(100vh-60px)] w-[100%]">
        {" "}
        {LoadingScreen("Cruceros")}{" "}
      </div>
    );
  if (error) return <p>Error: {error}</p>;

  return (
    <DefaultLayout>
      <section className="flex-grow min-h-[calc(100vh-110px)] crucero">
        <nav className="nav">
          <Input
            className="buscar text-primary bg-background"
            color="primary"
            placeholder="Buscar cruceros"
            size="md"
            startContent={<i className="fi fi-rr-search" />}
            type="search"
            value={searchText}
            variant="bordered"
            onChange={(e) => setSearchText(e.target.value)}
          />
          <Select
            className="destino bg-background"
            color="primary"
            label="Destinos"
            selectedKeys={destinoSeleccionado ? [destinoSeleccionado] : []}
            size="sm"
            variant="bordered"
            onSelectionChange={(e) =>
              setDestinoSeleccionado(e.currentKey ? e.currentKey : "")
            }
          >
            {destinos.map((d) => (
              <SelectItem key={d.id}>{d.nombre}</SelectItem>
            ))}
          </Select>
          <Select
            className="dias bg-background"
            color="primary"
            label="Días"
            selectedKeys={diasSeleccionados ? [diasSeleccionados] : []}
            size="sm"
            variant="bordered"
            onSelectionChange={(e) =>
              setDiasSeleccionados(e.currentKey ? e.currentKey : "")
            }
          >
            {diasUnicos.map((dias) => (
              <SelectItem key={dias}>{dias.toString()}</SelectItem>
            ))}
          </Select>
          <DateRangePicker
            className="fechas bg-background"
            color="primary"
            label="Fechas"
            value={fechas}
            variant="bordered"
            onChange={setFechas}
          />
          <button className="clean" onClick={() => clear()}>
            <i className="fi fi-rr-broom" />
          </button>
        </nav>
        <div className="contenido">
          {crucerosFiltrados.map((crucero) => (
            <div key={crucero.id} className="card rounded-xl">
              <div className="imagen">
                <img
                  alt="Card background"
                  className="object-cover"
                  src={`http://localhost:8000/imagenes/cruceros/${crucero.foto}`}
                  width={270}
                />
              </div>
              <div className="pb-0 pt-2 px-4 flex-col items-start detalle_1">
                <h4 className="uppercase font-bold text-tiny name">
                  {crucero.nombre}
                </h4>
                <div className="info">
                  <div className="info_1">
                    <p>
                      <i className="fi fi-rr-anchor" />{" "}
                      {crucero.destino?.nombre}
                    </p>
                    <p>
                      <i className="fi fi-rr-ship" /> {crucero.barco?.nombre}
                    </p>
                  </div>
                  <div className="info_1">
                    <p>
                      <i className="fi fi-rr-sunrise" />{" "}
                      {`${crucero.dias} días`}
                    </p>
                    <p>
                      <i className="fi fi-rr-moon" />{" "}
                      {`${crucero.dias - 1} noches`}
                    </p>
                  </div>
                </div>
                <div className="fechasList">
                  {crucero.fechas
                    ?.filter(
                      (f) => new Date(f.fecha_inicio).getTime() >= Date.now(),
                    )
                    .sort(
                      (a, b) =>
                        new Date(a.fecha_inicio).getTime() -
                        new Date(b.fecha_inicio).getTime(),
                    ) // Ordenar por la fecha más próxima
                    .slice(0, 3) // Mostrar solo las primeras 3 fechas
                    .map((fecha) => (
                      <Chip
                        key={fecha.id}
                        className=""
                        color="primary"
                        size="sm"
                        variant="dot"
                      >
                        {new Date(
                          fecha.fecha_inicio + "T12:00:00Z",
                        ).toLocaleDateString("en-MX", {
                          year: "numeric",
                          month: "short",
                          day: "numeric",
                        })}
                      </Chip>
                    ))}
                </div>
                <Divider className="my-3" />
                <div className="detalle_2">
                  <div className="precios" />
                  <div className="mas">
                    <Button
                      color="primary"
                      variant="solid"
                      onPress={() =>
                        Navigate(`/cruceros/detalles/${crucero.id}`)
                      }
                    >
                      Ver Detalles
                    </Button>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>
      </section>
    </DefaultLayout>
  );
}
