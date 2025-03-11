<?php

namespace App\Models;

use HasHashId;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Destino extends Model
{
    use HasFactory;

    protected $table = 'destinos';
    protected $primaryKey = 'id_destino';
    public $timestamps = false;

    protected $fillable = [
        'nombre', 
        'foto',
        'desactivado' 
    ];

    public function puertos() {
        return $this->hasMany(Puerto::class, 'id_destino');
    }
}