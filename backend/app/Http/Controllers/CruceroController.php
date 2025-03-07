<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Crucero;
use Illuminate\Http\Request;

class CruceroController extends Controller
{
    public function index()
    {
        // Obtiene todos los cruceros
        $cruceros = Crucero::all();
        
        // Retorna respuesta JSON
        return response()->json($cruceros);
    }
    
}
