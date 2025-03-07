<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User; // Asegúrate de importar el modelo User
use App\Models\Crucero; // Asegúrate de importar el modelo Crucero

class Reserva extends Model
{
    use HasFactory;

    protected $table = 'reservas';
    protected $primaryKey = 'id_reserva';
    public $timestamps = false;

    protected $fillable = [
        'id_usuario',
        'id_crucero',
        'cantidad_huespedes',
        'estado',
        'fecha_reserva'
    ];

    // Relación con Usuario
    public function usuario()
    {
        return $this->belongsTo(User::class, 'id_usuario');
    }

    // Relación con Crucero
    public function crucero()
    {
        return $this->belongsTo(Crucero::class, 'id_crucero');
    }

    public function detalles()
{
    return $this->hasMany(DetalleReserva::class, 'id_reserva');
}

}