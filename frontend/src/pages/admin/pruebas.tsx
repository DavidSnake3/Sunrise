import React, { useEffect, useState } from "react";
import { paises } from "@/config/api";

function Prueba() {
  const [countries, setCountries] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const getCountries = async () => {
      try {
        const data = await paises();
        setCountries(data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    getCountries();
  }, []);

  if (loading) return <p>Cargando países...</p>;
  if (error) return <p>Error: {error}</p>;

  return (
    <div>
      <h1 className="text-2xl font-bold mb-4">Países de América</h1>
      <ul className="space-y-2">
        {countries.map((country) => (
          <li key={country.cca2} className="flex items-center gap-4">
            <div>
              <p className="font-semibold">{country.translations.spa.common}</p>
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Prueba;