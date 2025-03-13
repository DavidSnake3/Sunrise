<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PuertoResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_puerto,
            'nombre' => $this->nombre,
            'pais' => $this->pais,
            'foto' => $this->foto,
            'desactivado' => $this->desactivado,
            'destino' => new DestinoResource($this->whenLoaded('destino')),
            'itinerarios' => ItinerarioResource::collection($this->whenLoaded('itinerarios')),
            'links' => [
                'self' => url("/api/puertos?id={$this->id_puerto}"),
                'destino' => url("/api/destinos?id={$this->id_destino}")
            ]
        ];
    }
}