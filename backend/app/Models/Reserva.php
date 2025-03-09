<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Reserva extends Model
{
    protected $table = 'reservas';
    protected $primaryKey = 'id_reserva';
    public $timestamps = false;

    protected $fillable = [
        'id_usuario',
        'id_crucero',
        'id_fecha',
        'cantidad_huespedes',
        'estado',
        'fecha_reserva',
        'metodo_pago'
    ];

    // Relaciones
    public function usuario()
    {
        return $this->belongsTo(User::class, 'id_usuario');
    }

    public function crucero()
    {
        return $this->belongsTo(Crucero::class, 'id_crucero');
    }

    public function fechaCrucero()
    {
        return $this->belongsTo(FechasCrucero::class, 'id_fecha');
    }

    public function huespedes()
    {
        return $this->hasMany(Huesped::class, 'Id_reserva');
    }

    public function detallesReserva()
    {
        return $this->hasMany(DetalleReserva::class, 'id_reserva');
    }

    public function reservaHabitaciones()
    {
        return $this->hasMany(ReservaHabitacion::class, 'id_reserva');
    }

    public function factura()
    {
        return $this->hasOne(Factura::class, 'id_reserva');
    }
}