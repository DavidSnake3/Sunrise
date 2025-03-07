<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PreciosHabitacion extends Model
{
    protected $table = 'precios_habitaciones';
    protected $primaryKey = 'id_precio';
    public $timestamps = false;

    protected $fillable = [
        'id_fecha',
        'id_habitacion',
        'precio'
    ];

    public function habitacion()
    {
        return $this->belongsTo(Habitacion::class, 'id_habitacion');
    }

    public function fechaCrucero()
    {
        return $this->belongsTo(FechasCrucero::class, 'id_fecha');
    }
}
