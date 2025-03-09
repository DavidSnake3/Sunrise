<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class FechaResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id'                  => $this->id_fecha,
            'fecha_inicio'        => $this->fecha_inicio,
            'fecha_limite_pago'   => $this->fecha_limite_pago,
            'precios_habitaciones'=> PrecioHabitacionResource::collection($this->whenLoaded('preciosHabitaciones')),
            'links'               => [
                'self'    => url("/api/fechas?id={$this->id_fecha}"),
                'crucero' => url("/api/cruceros?id={$this->id_crucero}")
            ]
        ];
    }
}
