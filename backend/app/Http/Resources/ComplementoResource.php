<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ComplementoResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id'          => $this->id_complemento,
            'nombre'      => $this->nombre,
            'descripcion' => $this->descripcion,
            'precio'      => $this->precio,
            'aplicado_por'=> $this->aplicado_por,
            'links'       => [
                'self' => url("/api/complementos?id={$this->id_complemento}")
            ]
        ];
    }
}
