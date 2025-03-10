<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CruceroResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id'           => $this->id_crucero,
            'nombre'       => $this->nombre,
            'dias'         => $this->cantidad_dias,
            'descripcion'  => $this->descripcion,
            'foto'         => $this->foto,
            'itinerarios'  => ItinerarioResource::collection($this->whenLoaded('itinerarios')),
            'barco'        => new BarcoResource($this->whenLoaded('barco')),
            'destino'      => new DestinoResource($this->whenLoaded('destino')),
            'fechas'       => FechaResource::collection($this->whenLoaded('fechas')),
            'complementos' => ComplementoResource::collection($this->whenLoaded('complementos')),
            'links'        => [
                'self' => url("/api/cruceros?id={$this->id_crucero}")
            ]
        ];
    }
}
