<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Habitacion extends Model
{
    use HasFactory;

    protected $table = 'habitaciones';
    protected $primaryKey = 'id_habitacion';
    protected $fillable = [
        'id_barco',
        'categoria',
        'nombre',
        'descripcion',
        'capacidad_min',
        'capacidad_max',
        'tamaño',
        'cantidad_disponibles'
    ];

    public function barco()
    {
        return $this->belongsTo(Barco::class, 'id_barco');
    }

    public function detallesHabitacion()
    {
        return $this->hasOne(DetalleHabitacion::class, 'id_habitacion');
    }
    
    public function precios() {
        return $this->hasMany(PreciosHabitacion::class, 'id_habitacion');
    }

}