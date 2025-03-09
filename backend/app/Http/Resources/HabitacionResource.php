<?php

namespace App\Http\Resources;

use App\Http\Resources\DetalleHabitacionResource;
use Illuminate\Http\Resources\Json\JsonResource;

class HabitacionResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_habitacion,
            'numero' => $this->numero,
            'tipo' => $this->tipo,
            'descripcion' => $this->descripcion,
            'barco' => new BarcoResource($this->whenLoaded('barco')),
            'detalle' => new DetalleHabitacionResource($this->whenLoaded('detalleHabitacion')),
            'links' => [
                'self' => url("/api/habitaciones?id={$this->id_habitacion}"),
                'barco' => url("/api/barcos?id={$this->id_barco}")
            ]
        ];
    }
}