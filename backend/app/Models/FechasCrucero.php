<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FechasCrucero extends Model
{
    protected $table = 'fechas_cruceros';
    protected $primaryKey = 'id_fecha';
    public $timestamps = false;

    protected $fillable = [
        'id_crucero',
        'fecha_inicio',
        'fecha_limite_pago'
    ];

    public function crucero()
    {
        return $this->belongsTo(Crucero::class, 'id_crucero');
    }

    public function preciosHabitaciones()
    {
        return $this->hasMany(PreciosHabitacion::class, 'id_fecha');
    }
}
