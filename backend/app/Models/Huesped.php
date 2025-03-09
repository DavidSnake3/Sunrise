<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Huesped extends Model
{
    protected $table = 'huespedes';
    protected $primaryKey = 'Id_huesped';
    public $timestamps = false;

    protected $fillable = [
        'Id_reserva',
        'nombre_completo',
        'genero',
        'edad',
        'fecha_nacimiento',
        'nacionalidad'
    ];

    public function reserva()
    {
        return $this->belongsTo(Reserva::class, 'Id_reserva');
    }
}