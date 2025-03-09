<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class HuespedResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->Id_huesped,
            'nombre' => $this->nombre_completo,
            'genero' => $this->genero,
            'edad' => $this->edad,
            'fecha_nacimiento' => $this->fecha_nacimiento,
            'nacionalidad' => $this->nacionalidad,
            'reserva_id' => $this->Id_reserva
        ];
    }
}