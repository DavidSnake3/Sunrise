<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReservaHabitacion extends Model
{
    protected $table = 'reserva_habitaciones';
    protected $primaryKey = 'id_reserva_habitacion';
    public $timestamps = false;

    protected $fillable = [
        'id_reserva',
        'id_habitacion',
        'precio',
        'cantidad'
    ];

    public function reserva()
    {
        return $this->belongsTo(Reserva::class, 'id_reserva');
    }

    public function habitacion()
    {
        return $this->belongsTo(Habitacion::class, 'id_habitacion')
                    ->with('detallesHabitacion');
    }
}