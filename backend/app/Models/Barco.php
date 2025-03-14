<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barco extends Model
{
    use HasFactory;

    protected $table = 'barcos';
    protected $primaryKey = 'id_barco';
    public $timestamps = false;

    protected $fillable = [
        'nombre',
        'capacidad_pasajeros',
        'capacidad_tripulantes',
        'total_habitaciones',
        'velocidad_maxima',
        'tonelaje',
        'altura',
        'largo',
        'ancho',
        'año_construccion',
        'desactivado'
    ];
    public function habitaciones()
    {
        return $this->hasMany(Habitacion::class, 'id_barco');
    }


        public function fotos()
        {
            return $this->hasMany(FotoBarco::class, 'Id_barco', 'id_barco');
        }
}