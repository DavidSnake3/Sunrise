<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DetalleHabitacionResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_detalle,
            'descripcion' => $this->descripcion_larga,
            'amenidades' => $this->amenidades,
            'cant_camas' => $this->cantidad_camas,
            'tipo_camas' => $this->tipo_cama,
            'vista_mar' => $this->vista_mar,
            'balcon' => $this->balcon,
            'habitacion' => new HabitacionResource(resource: $this->whenLoaded(relationship: 'habitacion')),
            'links' => [
                'self' => url("/api/detalle_habitacion?id={$this->id_detalle_habitacion}"),
                'habitacion' => url("/api/habitaciones?id={$this->id_habitacion}")
            ]
        ];
    }
}
