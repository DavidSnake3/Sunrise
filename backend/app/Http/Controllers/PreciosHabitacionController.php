<?php

namespace App\Http\Controllers;

use App\Models\PreciosHabitacion;
use Illuminate\Http\Request;

class PreciosHabitacionController extends Controller
{
    // Trae el precio de una habitación según id_habitacion e id_fecha.
    public function getPrecio($id_habitacion, $id_fecha)
    {
        $precio = PreciosHabitacion::where('id_habitacion', $id_habitacion)
            ->where('id_fecha', $id_fecha)
            ->first();

        return response()->json($precio);
    }

    public function getPrecioPorFecha($id_fecha)
    {
        $precio = PreciosHabitacion::where('id_fecha', $id_fecha)
            ->first();

        return response()->json($precio);
    }
    public function index()
    {
        $habitaciones = PreciosHabitacion::all();
        return response()->json($habitaciones);
    }
}
