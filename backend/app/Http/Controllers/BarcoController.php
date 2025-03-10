<?php

namespace App\Http\Controllers;

use App\Http\Resources\BarcoResource;
use App\Http\Resources\DetalleHabitacionResource;
use App\Http\Resources\HabitacionResource;
use App\Models\Barco;
use App\Models\DetalleHabitacion;
use App\Models\Habitacion;
use Illuminate\Http\Request;

class BarcoController extends Controller
{
    // Obtener todos los barcos o uno específico
    public function getAll(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1'
        ]);

        if ($request->has('id')) {
            return $this->getById($request->id);
        }

        $barcos = Barco::with('habitaciones')->get();
        return BarcoResource::collection($barcos);
    }
    
    public function getById($id)
    {
        $barco = Barco::with('habitaciones')->findOrFail($id);
        return new BarcoResource($barco);
    }

    // Obtener todas las habitaciones, habitación por ID o por barco
    public function getAllHabitaciones(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1',
            'barco_id' => 'sometimes|integer|min:1'
        ]);

        // Si se pasa 'id': detalle de la habitación
        if ($request->has('id')) {
            $habitacion = Habitacion::with(['barco', 'detallesHabitacion'])->find($request->id);
            return $habitacion ? new HabitacionResource($habitacion) : response()->json(['error' => 'No encontrado'], 404);
        }

        // Si se pasa 'barco_id': habitaciones de ese barco
        if ($request->has('barco_id')) {
            $habitaciones = Habitacion::with('detallesHabitacion')
                ->where('id_barco', $request->barco_id)
                ->get();
            return HabitacionResource::collection($habitaciones);
        }

        // Sin parámetros: todas las habitaciones
        $habitaciones = Habitacion::with('detallesHabitacion')->get();
        return HabitacionResource::collection($habitaciones);
    }

    // Obtener detalle de habitación desde la tabla detalle_habitacion
    public function getDetalleHabitacion(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1',
            'habitacion_id' => 'sometimes|integer|min:1'
        ]);

        if ($request->has('id')) {
            $detalle = DetalleHabitacion::with('habitacion')->find($request->id);
            return $detalle ? new DetalleHabitacionResource($detalle) : response()->json(['error' => 'No encontrado'], 404);
        }

        if ($request->has('habitacion_id')) {
            $detalle = DetalleHabitacion::with('habitacion')
                ->where('id_habitacion', $request->habitacion_id)
                ->first();
            return $detalle ? new DetalleHabitacionResource($detalle) : response()->json(['error' => 'No encontrado'], 404);
        }

        return DetalleHabitacionResource::collection(DetalleHabitacion::with('habitacion')->get());
    }
}