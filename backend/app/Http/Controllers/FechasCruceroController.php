<?php

namespace App\Http\Controllers;

use App\Models\FechasCrucero;
use Illuminate\Http\Request;

class FechasCruceroController extends Controller
{
    // Trae las fechas del crucero según su id_crucero.
    public function getByCrucero($id_crucero)
    {
        $fechas = FechasCrucero::where('id_crucero', $id_crucero)->get();
        return response()->json($fechas);
    }

    public function index()
    {
        // Obtiene todos los cruceros
        $cruceros = FechasCrucero::all();
        
        // Retorna respuesta JSON
        return response()->json($cruceros);
    }
}
