<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DestinoResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_destino,
            'nombre' => $this->nombre,
            'foto' => $this->foto,
            'puertos' => PuertoResource::collection($this->whenLoaded('puertos')),
            'links' => [
                'self' => url("/api/destinos?id={$this->id_destino}"),
                'puertos' => url("/api/puertos?destino_id={$this->id_destino}")
            ]
        ];
    }
}
