<?php

namespace App\Http\Controllers;

use App\Models\Crucero;
use App\Models\Itinerario;
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
                'crucero:id_crucero,nombre,cantidad_dias,id_barco',
                'crucero.barco:id_barco,nombre', 
                'detalles.complemento', 
                'detalles.habitacion',
                'huespedes:id_huesped,id_reserva,nombre_completo,genero,edad,fecha_nacimiento,nacionalidad',
                'factura',
                'fechaCrucero',
                'crucero.itinerarios.puerto'
            ])->findOrFail($id);

            // Obtener puertos de salida y regreso
            $itinerarios = Itinerario::where('id_crucero', $reserva->id_crucero)
                ->orderBy('dia')
                ->get();

            $puertoSalida = $itinerarios->first()->puerto;
            $puertoRegreso = $itinerarios->last()->puerto;

            // Calcular fechas
            $fechaInicio = $reserva->fechaCrucero->fecha_inicio;
            $fechaFin = date('Y-m-d', strtotime($fechaInicio . " +{$reserva->crucero->cantidad_dias} days"));

            // Calcular totales
            $totalHabitaciones = $reserva->detalles->where('id_habitacion', '!=', null)->sum('subtotal');
            $totalComplementos = $reserva->detalles->where('id_complemento', '!=', null)->sum('subtotal');
            
            return response()->json([
                ...$reserva->toArray(),
                'puerto_salida' => $puertoSalida,
                'puerto_regreso' => $puertoRegreso,
                'fecha_inicio' => $fechaInicio,
                'fecha_fin' => $fechaFin,
                'total_habitaciones' => $totalHabitaciones,
                'total_complementos' => $totalComplementos
            ]);
            
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Error al cargar el detalle de la reserva',
                'details' => $e->getMessage()
            ], 500);
        }
    }

}
