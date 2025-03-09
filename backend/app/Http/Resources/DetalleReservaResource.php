<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DetalleReservaResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_detalle,
            'complemento' => new ComplementoResource($this->complemento),
            'cantidad' => $this->cantidad,
            'subtotal' => (float)$this->subtotal
        ];
    }
}