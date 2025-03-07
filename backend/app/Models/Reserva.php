<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reserva extends Model
{
    use HasFactory;

    protected $table = 'reservas';
    protected $primaryKey = 'id_reserva';
    public $timestamps = false;

    protected $fillable = [
        'id_usuario',
        'id_crucero',
        'id_fecha',
        'cantidad_huespedes',
        'estado',
        'fecha_reserva'
    ];

    public function usuario()
    {
        return $this->belongsTo(User::class, 'id_usuario');
    }

    public function crucero()
    {
        return $this->belongsTo(Crucero::class, 'id_crucero');
    }

    public function detalles()
    {
        return $this->hasMany(DetalleReserva::class, 'id_reserva');
    }

    public function huespedes()
    {
        return $this->hasMany(Huesped::class, 'id_reserva');
    }

    public function factura()
    {
        return $this->hasOne(Factura::class, 'id_reserva');
    }

    public function fechaCrucero()
    {
        return $this->belongsTo(FechasCrucero::class, 'id_fecha');
    }
}