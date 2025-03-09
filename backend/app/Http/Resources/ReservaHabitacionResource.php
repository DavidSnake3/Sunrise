<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ReservaHabitacionResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_reserva_habitacion,
            'habitacion' => new HabitacionResource($this->habitacion),
            'precio' => (float)$this->precio,
            'cantidad' => $this->cantidad,
            'total' => (float)($this->precio * $this->cantidad)
        ];
    }
}