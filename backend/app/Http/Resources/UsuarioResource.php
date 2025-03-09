<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UsuarioResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id_usuario,
            'nombre' => $this->nombre_completo,
            'email' => $this->email,
            'telefono' => $this->telefono,
            'nacionalidad' => $this->nacionalidad,
            'edad' => $this->edad,
            'es_admin' => (bool)$this->admin,
            'fecha_nacimiento' => $this->fecha_nacimiento,
            'genero' => $this->genero,
            'links' => [
                'reservas' => url("/api/usuarios/{$this->id_usuario}/reservas")
            ]
        ];
    }
}