<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Factura extends Model
{
    protected $table = 'facturas';
    protected $primaryKey = 'id_factura';
    public $timestamps = false;

    protected $fillable = [
        'id_reserva',
        'subtotal',
        'impuestos',
        'tarifas',
        'total',
        'subtotal_complementos',
        'subtotal_habitaciones',
        'fecha_limite'
    ];

    protected $casts = [
        'fecha_limite' => 'date'
    ];

    public function reserva()
    {
        return $this->belongsTo(Reserva::class, 'id_reserva');
    }

    public function registrosFactura()
    {
        return $this->hasMany(RegistroFactura::class, 'id_factura');
    }
}