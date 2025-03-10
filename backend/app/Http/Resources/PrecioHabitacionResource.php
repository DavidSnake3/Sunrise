<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PrecioHabitacionResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id'         => $this->id_precio,
            'precio'     => $this->precio,
            'cantidad'     => $this->cantidad_disponible,
            'habitacion' => new HabitacionResource($this->whenLoaded('habitacion')),
            'links'      => [
                'self'  => url("/api/precios-habitaciones?id={$this->id_precio}"),
                'fecha' => url("/api/fechas?id={$this->id_fecha}")
            ]
        ];
    }
}
