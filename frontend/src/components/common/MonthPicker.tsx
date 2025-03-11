import React, { useState } from "react";
import { motion } from "framer-motion";
import dayjs from "dayjs";

const months = [
  "Enero",
  "Febrero",
  "Marzo",
  "Abril",
  "Mayo",
  "Junio",
  "Julio",
  "Agosto",
  "Septiembre",
  "Octubre",
  "Noviembre",
  "Diciembre",
];

export default function MonthPicker(
    { onChange, className }: { onChange?: (date: string) => void; className?: string },
) {
  const currentYear = dayjs().year();
  const [selectedYear, setSelectedYear] = useState(currentYear);
  const [selectedMonth, setSelectedMonth] = useState<string | null>(null);
  const [selectedMonthIndex, setSelectedMonthIndex] = useState<number | null>(
    null,
  );
  const [isOpen, setIsOpen] = useState(false);

  const handleSelectMonth = (month: string, index: number) => {
    handleSelect(index);
    setSelectedMonth(month);
    setIsOpen(false);
  };

  const handleSelect = (monthIndex: number) => {
    setSelectedMonthIndex(monthIndex);
    const formattedDate = dayjs()
      .year(selectedYear)
      .month(monthIndex)
      .format("YYYY-MM");

    onChange?.(formattedDate);
  };

  const clearMonth = () => {
    setSelectedMonth("");
    setSelectedMonthIndex(-1);
    onChange?.("");
    setIsOpen(false);
  };

  return (
    <div className={className}>
      {/* Botón para abrir el selector */}
      <button
        className="bg-white w-full h-full p-2 border rounded-lg bg- shadow-md text-center cursor-pointer"
        onClick={() => setIsOpen(!isOpen)}
      >
        {selectedMonth ? `${selectedMonth} ${selectedYear}` : "Seleccionar mes"}
      </button>

      {/* Panel con animación */}
      {isOpen && (
        <motion.div
          animate={{ opacity: 1, y: 0 }}
          className="text-black absolute top-full left-0 w-full mt-2 bg-white shadow-lg rounded-lg border-color-primary p-4"
          exit={{ opacity: 0, y: -10 }}
          initial={{ opacity: 0, y: -10 }}
          transition={{ duration: 0.4 }}
        >
          {/* Selector de año */}
          <div className="flex justify-between items-center mb-2 ">
            <button
              className="text-gray-500 disabled:opacity-50"
              disabled={selectedYear === currentYear}
              onClick={() => setSelectedYear(selectedYear - 1)}
            >
              {"<"}
            </button>
            <p className="font-semibold">{selectedYear}</p>
            <button
              className="text-gray-500"
              onClick={() => setSelectedYear(selectedYear + 1)}
            >
              {">"}
            </button>
          </div>

          {/* Lista de meses */}
          <div className="grid grid-cols-3 gap-2">
            {months.map((month, index) => (
              <button
                key={index}
                className={`p-2 rounded-md text-center cursor-pointer 
                  ${selectedMonth === month ? "bg-primary text-white" : "hover:bg-gray-100"}
                `}
                onClick={() =>
                  selectedMonthIndex === index
                    ? clearMonth()
                    : handleSelectMonth(month, index)
                }
              >
                {month}
              </button>
            ))}
          </div>
        </motion.div>
      )}
    </div>
  );
}
