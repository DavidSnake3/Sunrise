<?php

namespace App\Http\Controllers;

use App\Models\Barco;
use Illuminate\Http\Request;

class BarcoController extends Controller
{


/*    public function index()
    {
        $barcos = Barco::all();
        return response()->json($barcos);
    }
*/
public function index()
{
    $barcos = Barco::withSum('habitaciones', 'cantidad_Disponibles')->get();
    return response()->json($barcos);
}


public function show($id_barco)
{
    $barco = Barco::with('habitaciones')
        ->withCount('habitaciones')
        ->withSum('habitaciones', 'cantidad_Disponibles')
        ->findOrFail($id_barco);
    return response()->json($barco);
}


    public function getHabitaciones($id_barco)
    {
        $barco = Barco::with('habitaciones')->findOrFail($id_barco);
        return response()->json($barco->habitaciones);
    }
}