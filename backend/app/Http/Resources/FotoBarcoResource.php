<?php

// app/Http/Resources/FotoBarcoResource.php
namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class FotoBarcoResource extends JsonResource
{
    public function toArray($request)
    {

        return [
            'id' => $this->Id_fotos_Barco,
            'foto_base64' => $this->foto,
            'barco_id' => $this->Id_barco
        ];
    }
}