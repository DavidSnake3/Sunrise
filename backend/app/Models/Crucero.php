<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Crucero extends Model
{
    use HasFactory;

    // Nombre de la tabla en la base de datos
    protected $table = 'cruceros';

    // Clave primaria personalizada (si es diferente)
    protected $primaryKey = 'id_crucero'; 
    // Timestamps
    public $timestamps = false;

    // Campos asignables masivamente
    protected $fillable = [
        // Lista aquí todos los campos de tu tabla cruceros
        'nombre', 'nombre', 'foto','cantidad_dias','id_barco' // Ajusta según tu estructura
    ];
    
    // Si prefieres no usar fillable, puedes usar guarded
    // protected $guarded = [];
}