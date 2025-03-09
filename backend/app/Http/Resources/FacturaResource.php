<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class FacturaResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_factura,
            'fecha_limite' => $this->fecha_limite->toDateString(),
            'subtotal' => (float)$this->subtotal,
            'impuestos' => (float)$this->impuestos,
            'tarifas' => (float)$this->tarifas,
            'total' => (float)$this->total,
            'subtotal_complementos' => (float)$this->subtotal_complementos,
            'subtotal_habitaciones' => (float)$this->subtotal_habitaciones,
            'registros' => RegistroFacturaResource::collection($this->whenLoaded('registrosFactura'))
        ];
    }
}