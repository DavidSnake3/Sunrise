<?php

namespace App\Http\Controllers;

use App\Models\Barco;
use App\Models\DetalleHabitacion;
use App\Models\Habitacion;
use Illuminate\Http\Request;

class HabitacionController extends Controller
{
    public function index()
    {
        $habitaciones = Habitacion::all();
        return response()->json($habitaciones);
    }

    public function getHabitaciones($id_barco)
    {
        $barco = Barco::with('habitaciones')->findOrFail($id_barco);
        return response()->json($barco->habitaciones);
    }

    public function showDetails($id_habitacion)
    {
        $detalles = DetalleHabitacion::where('id_habitacion', $id_habitacion)
            ->with('habitacion') // Si hay relación
            ->firstOrFail();
    
        return response()->json($detalles);
    }
}