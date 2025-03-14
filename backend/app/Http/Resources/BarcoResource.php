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
            'cant_pasajeros' => $this->capacidad_pasajeros,
            'cant_tripulantes' => $this->capacidad_tripulantes,
            'velocidad' => $this->velocidad_maxima,
            'ancho' => $this->ancho,
            'año' => $this->año_construccion,
            'largo' => $this->largo,
            'tonelaje' => $this->tonelaje,
            'altura' => $this->altura,
            'desactivado' => $this->desactivado,
            'fotos' => FotoBarcoResource::collection($this->whenLoaded('fotos')),
            'habitaciones' => HabitacionResource::collection($this->whenLoaded('habitaciones')),
            'links' => [
                'self' => url("/api/barcos?id={$this->id_barco}"),
                'habitaciones' => url("/api/habitaciones?barco_id={$this->id_barco}")
            ]
        ];
    }
}