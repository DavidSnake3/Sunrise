<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Itinerario extends Model
{
    protected $table = 'itinerarios';
    protected $primaryKey = 'id_itinerario';
    public $timestamps = false;

    protected $fillable = [
        'id_crucero',
        'dia',
        'id_puerto',
        'descripcion',
        'hora_llegada',
        'hora_salida'
    ];

    public function crucero()
    {
        return $this->belongsTo(Crucero::class, 'id_crucero');
    }

    public function fechasCrucero()
    {
        return $this->hasMany(FechasCrucero::class, 'id_itinerario');
    }
}
