<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ReservaResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_reserva,
            'usuario' => new UsuarioResource($this->whenLoaded('usuario')),
            'crucero' => new CruceroResource($this->whenLoaded('crucero')),
            'fecha' => new FechaResource($this->whenLoaded('fechaCrucero')),
            'huespedes' => HuespedResource::collection($this->whenLoaded('huespedes')),
            'detalles' => DetalleReservaResource::collection($this->whenLoaded('detallesReserva')),
            'habitaciones' => ReservaHabitacionResource::collection($this->whenLoaded('reservaHabitaciones')),
            'factura' => new FacturaResource($this->whenLoaded('factura')),
            'estado' => $this->estado,
            'fecha_reserva' => $this->fecha_reserva,
            'metodo_pago' => $this->metodo_pago,
            'links' => [
                'self' => url("/api/reservas/{$this->id_reserva}"),
                'huespedes' => url("/api/reservas/{$this->id_reserva}/huespedes"),
                'factura' => url("/api/reservas/{$this->id_reserva}/factura")
            ]
        ];
    }
}