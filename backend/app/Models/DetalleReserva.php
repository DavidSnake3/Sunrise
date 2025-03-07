<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetalleReserva extends Model
{
    protected $table = 'detalles_reserva';
    protected $primaryKey = 'id_detalle';
    public $timestamps = false;

    protected $fillable = [
        'id_reserva',
        'id_complemento',
        'id_habitacion',
        'cantidad',
        'subtotal'
    ];

    // Relación con Complemento
    public function complemento()
    {
        return $this->belongsTo(Complemento::class, 'id_complemento');
    }
}
