<?php

namespace App\Http\Controllers;  // Namespace sin API

use App\Models\DetalleHabitacion;
use Illuminate\Http\Request;

class DetalleHabitacionController extends Controller
{
    public function show($id_habitacion)
    {
        $detalle = DetalleHabitacion::where('id_habitacion', $id_habitacion)
            ->firstOrFail();
            
        return response()->json($detalle);
    }
}