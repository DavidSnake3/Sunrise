<?php
namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ReservaFullResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_reserva,
            'usuario' => new UsuarioResource($this->usuario),
            'crucero' => [
                'id' => $this->crucero->id_crucero,
                'nombre' => $this->crucero->nombre,
                'barco' => new BarcoResource($this->crucero->barco),
                'destino' => new DestinoResource($this->crucero->destino)
            ],
            'huespedes' => HuespedResource::collection($this->huespedes),
            'detalles' => DetalleReservaResource::collection($this->detallesReserva),
            'habitaciones' => ReservaHabitacionResource::collection($this->reservaHabitaciones),
            'factura' => new FacturaResource($this->factura)
        ];
    }
}