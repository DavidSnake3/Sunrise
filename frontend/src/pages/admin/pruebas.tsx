import MonthPicker from "@/components/common/MonthPicker";

export default function Pruebas() {
    const handleMonthChange = (date: string) => {
        console.log("Mes seleccionado:", date);
      };
    
      return (
        <div className="p-5">
          <MonthPicker onChange={handleMonthChange} />
        </div>
      );
}
