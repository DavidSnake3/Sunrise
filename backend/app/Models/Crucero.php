<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Crucero extends Model
{
    protected $table = 'cruceros';
    protected $primaryKey = 'id_crucero';
    public $timestamps = false;

    protected $fillable = [
        'nombre',
        'foto',
        'cantidad_dias',
        'id_barco',
        'id_destino',
        'desactivado'
    ];

    public function itinerarios()
    {
        return $this->hasMany(Itinerario::class, 'id_crucero');
    }

    public function fechas()
    {
        return $this->hasMany(FechasCrucero::class, 'id_crucero');
    }

    public function destino()
    {
        return $this->belongsTo(Destino::class, 'id_destino');
    }
    
    public function barco()
    {
        return $this->belongsTo(Barco::class, 'id_barco');
    }

    public function complementos()
    {
        // Actualizamos el nombre de la tabla pivot a 'cruceros_complementos'
        return $this->belongsToMany(Complemento::class, 'cruceros_complementos', 'id_crucero', 'id_complemento');
    }
    public function reservas()
    {
        return $this->hasMany(Reserva::class, 'id_crucero');
    }
    
}
