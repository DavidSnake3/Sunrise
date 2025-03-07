import axios from "axios";
import datos from "../config/data.json";

// Función asíncrona para obtener los países de América
export const paises = async () => {
  try {
    const response = await axios.get("https://restcountries.com/v3.1/all");
    return response.data; // Devuelve la lista de países
  } catch (error) {
    console.error("Error fetching countries:", error);
    throw error; // Lanza el error para manejarlo en el componente
  }
};

export const GetData = async () => {
  try {
    const response = await datos;
    return response;
  } catch (error) {
    console.error("Error fetching cruceros data:", error);
    throw error;
  }
};
