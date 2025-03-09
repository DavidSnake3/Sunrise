<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RegistroFactura extends Model
{
    protected $table = 'registro_factura';
    protected $primaryKey = 'id_registro_factura';
    public $timestamps = false;

    protected $fillable = [
        'id_factura',
        'total',
        'fecha_pago', // Ahora es DATE
        'tarjeta'
    ];

    protected $casts = [
        'total' => 'decimal:2',
        'fecha_pago' => 'date' // Cast a Carbon instance
    ];

    public function factura()
    {
        return $this->belongsTo(Factura::class, 'id_factura');
    }
}