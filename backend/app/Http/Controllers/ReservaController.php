<?php

namespace App\Http\Controllers;

use App\Models\Crucero;
use App\Models\Reserva;
use App\Models\User;
use Illuminate\Http\Request;

class ReservaController extends Controller
{
// app/Http/Controllers/ReservaController.php
public function index()
{
    try {
        $reservas = Reserva::with([
            'usuario:id_usuario,nombre_completo',
            'crucero:id_crucero,nombre'
        ])->get();

        return response()->json($reservas);
        
    } catch (\Exception $e) {
        return response()->json([
            'error' => 'Error al cargar reservas',
            'details' => $e->getMessage()
        ], 500);
    }
}

public function show($id)
{
    try {
        $reserva = Reserva::with([
            'usuario:id_usuario,nombre_completo',
            'crucero:id_crucero,nombre',
            'detalles.complemento'
        ])->findOrFail($id);

        return response()->json($reserva);
    } catch (\Exception $e) {
        return response()->json([
            'error' => 'Error al cargar el detalle de la reserva',
            'details' => $e->getMessage()
        ], 500);
    }
}

}
