export default function LoadingScreen(name: string) {
  return (
    <div className="flex items-center justify-center h-full w-full overflow-hidden relative">
      {/* Contenedor principal */}
      <div className="relative flex flex-col items-center justify-center">
        {/* Imagen que gira */}
        <img
          alt="Cargando..."
          className="w-[100%] max-w-32 min-w-10 animate-spin-slow"
          src="/volante.png"
        />
        {/* Texto de carga */}
        {name !== "" && (
          <p className=" text-lg font-semibold animate-pulse mt-4">
            Cargando {name}
            <span className="dot-animation"></span>
          </p>
        )}
      </div>

      {/* Estilos dinámicos */}
      <style>
        {`
            /* Animación de giro */
            @keyframes spin {
              0% { transform: rotate(0deg); }
              100% { transform: rotate(360deg); }
            }
            .animate-spin-slow {
              animation: spin 5s linear infinite;
            }
  
            /* Animación de puntos */
            @keyframes dots {
              0% { content: ''; }
              33% { content: '.'; }
              66% { content: '..'; }
              100% { content: '...'; }
            }
            .dot-animation::after {
              content: '';
              animation: dots 2.3s steps(1) infinite;
            }
          `}
      </style>
    </div>
  );
}
