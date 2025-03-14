<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Complemento extends Model
{
    protected $table = 'complementos';
    protected $primaryKey = 'id_complemento';
    public $timestamps = false;

    protected $fillable = [
        'nombre',
        'descripcion',
        'precio',
        'aplicado_por'
    ];

    public function detalles()
    {
        return $this->hasMany(DetalleReserva::class, 'id_complemento');
    }

    public function cruceros()
    {
        // Aseguramos que la tabla pivot es 'cruceros_complementos'
        return $this->belongsToMany(Crucero::class, 'cruceros_complementos', 'id_complemento', 'id_crucero');
    }
}
