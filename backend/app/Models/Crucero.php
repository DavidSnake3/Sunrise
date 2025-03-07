<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Crucero extends Model
{
    protected $table = 'cruceros';
    protected $primaryKey = 'id_crucero';
    public $timestamps = false;

    protected $fillable = [
        'nombre',
        'foto',
        'cantidad_dias',
        'id_barco',
        'id_destino'
    ];

    // Relación con Itinerarios
    public function itinerarios()
    {
        return $this->hasMany(Itinerario::class, 'id_crucero');
    }

    // Relación con FechasCrucero
    public function fechas()
    {
        return $this->hasMany(FechasCrucero::class, 'id_crucero');
    }

    // Relación con Reservas
    public function reservas()
    {
        return $this->hasMany(Reserva::class, 'id_crucero');
    }
}
