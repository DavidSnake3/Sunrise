<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DetalleHabitacionResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_detalle_habitacion,
            'descripcion_extra' => $this->descripcion_extra,
            'amenidades' => $this->amenidades,
            'links' => [
                'self' => url("/api/detalle_habitacion?id={$this->id_detalle_habitacion}"),
                'habitacion' => url("/api/habitaciones?id={$this->id_habitacion}")
            ]
        ];
    }
}
