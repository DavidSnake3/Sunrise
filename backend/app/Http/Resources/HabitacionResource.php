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
            'categoria' => $this->categoria,
            'nombre' => $this->nombre,
            'max' => $this->capacidad_max,
            'min' => $this->capacidad_min,
            'size' => $this->tamaño,
            'descripcion' => $this->descripcion,
            'cantidad' => $this->cantidad_disponibles,
            'desactivado' => $this->desactivado,
            'barco' => new BarcoResource($this->whenLoaded('barco')),
            'detalle' => new DetalleHabitacionResource($this->whenLoaded('detallesHabitacion')),
            'links' => [
                'self' => url("/api/habitaciones?id={$this->id_habitacion}"),
                'barco' => url("/api/barcos?id={$this->id_barco}")
            ]
        ];
    }
}