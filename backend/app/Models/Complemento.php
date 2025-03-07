<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Complemento extends Model
{
    // Actualiza el nombre de la tabla según corresponda en tu base de datos
    protected $table = 'cruceros_complementos';
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
}
