<?php

namespace App\Models;

use HasHashId;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Puerto extends Model
{
    use HasFactory;

    protected $table = 'puertos';
    protected $primaryKey = 'id_puerto';
    public $timestamps = false;

    protected $fillable = [
        'id_destino',
        'nombre',
        'pais',
        'foto'
    ];

    public function destino() {
        return $this->belongsTo(Destino::class, 'id_destino');
    }

    public function itinerarios()
    {
        return $this->hasMany(Itinerario::class, 'id_puerto');
    }
}
