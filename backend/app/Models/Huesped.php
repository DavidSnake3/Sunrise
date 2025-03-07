<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Huesped extends Model
{
    protected $table = 'huespedes';
    protected $primaryKey = 'id_huesped';
    public $timestamps = false;

    protected $fillable = [
        'id_reserva',
        'nombre_completo',
        'genero',
        'edad',
        'fecha_nacimiento',
        'nacionalidad'
    ];

    public function reserva()
    {
        return $this->belongsTo(Reserva::class, 'id_reserva');
    }
}