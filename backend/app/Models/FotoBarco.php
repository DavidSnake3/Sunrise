<?php

// app/Models/FotoBarco.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FotoBarco extends Model
{
    protected $table = 'fotos_barco';
    protected $primaryKey = 'Id_fotos_Barco'; 
    public $timestamps = false;


    protected $fillable = ['Id_barco', 'foto']; 

 
    public function barco()
    {
        return $this->belongsTo(Barco::class, 'Id_barco'); 
    }
}