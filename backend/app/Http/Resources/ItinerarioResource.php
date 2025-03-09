<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ItinerarioResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id'     => $this->id_itinerario,
            'orden'  => $this->orden,
            'puerto' => new PuertoResource($this->whenLoaded('puerto')),
            'links'  => [
                'self'    => url("/api/itinerarios?id={$this->id_itinerario}"),
                'crucero' => url("/api/cruceros?id={$this->id_crucero}")
            ]
        ];
    }
}
