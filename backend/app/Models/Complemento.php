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
}
