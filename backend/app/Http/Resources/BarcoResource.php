<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BarcoResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_barco,
            'nombre' => $this->nombre,
            'foto' => $this->foto,
            'habitaciones' => HabitacionResource::collection($this->whenLoaded('habitaciones')),
            'links' => [
                'self' => url("/api/barcos?id={$this->id_barco}"),
                'habitaciones' => url("/api/habitaciones?barco_id={$this->id_barco}")
            ]
        ];
    }
}