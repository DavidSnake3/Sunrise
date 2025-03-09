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
        'cantidad',
        'subtotal'
    ];

    public function reserva()
    {
        return $this->belongsTo(Reserva::class, 'id_reserva');
    }

    public function complemento()
    {
        return $this->belongsTo(Complemento::class, 'id_complemento');
    }
}