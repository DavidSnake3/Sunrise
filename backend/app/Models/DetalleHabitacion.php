<?php

// app/Models/DetalleHabitacion.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetalleHabitacion extends Model
{
    use HasFactory;

    protected $table = 'detalles_habitacion';
    protected $primaryKey = 'id_detalle';
    protected $fillable = [
        'id_habitacion',
        'descripcion_larga',
        'metros_cuadrados',
        'cantidad_camas',
        'tipo_cama',
        'amenidades',
        'capacidad_maxima',
        'vista_mar',
        'balcon'
    ];

    protected $casts = [
        'amenidades' => 'array',
        'vista_mar' => 'boolean',
        'balcon' => 'boolean'
    ];

    public function habitacion()
    {
        return $this->belongsTo(Habitacion::class, 'id_habitacion');
    }
}