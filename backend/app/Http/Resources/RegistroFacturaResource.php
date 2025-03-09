<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RegistroFacturaResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_registro_factura,
            'total' => (float)$this->total,
            'fecha_pago' => $this->fecha_pago->format('d-m-Y'), // Formato ISO
            'tarjeta' => $this->tarjeta,
            'metodo_pago' => $this->tarjeta 
                ? "Tarjeta ({$this->tarjeta})" 
                : 'Otro método',
            'factura_id' => $this->id_factura,
            'links' => [
                'factura' => url("/api/facturas/{$this->id_factura}")
            ]
        ];
    }
}