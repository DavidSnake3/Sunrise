<?php

namespace App\Http\Controllers;

use App\Http\Resources\HabitacionResource;
use App\Models\Barco;
use App\Models\DetalleHabitacion;
use App\Models\Habitacion;
use DB;
use Illuminate\Http\Request;

class HabitacionController extends Controller
{
    public function getAll(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1',
            'incluir_desactivados' => 'sometimes|boolean',
        ]);
    
        if ($request->has('id')) {
            return $this->getById($request->id);
        }
    
        $query = Habitacion::with([
            'barco', 
            'detallesHabitacion', 
            'precios'
        ]);
    
    
        if (!$request->boolean('incluir_desactivados')) {
            $query->where('desactivado', 0);
        }
    
        $habitaciones = $query->get();
    
        return HabitacionResource::collection($habitaciones);
    }
    
    public function getById($id)
    {
        $habitacion = Habitacion::with([
            'barco', 
            'detallesHabitacion', 
            'precios'
        ])->findOrFail($id);
    
        return new HabitacionResource($habitacion);
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

    public function store(Request $request)
    {
        $validated = $request->validate([
            'id_barco' => 'required|exists:barcos,id_barco',
            'categoria' => 'required|string|max:50',
            'nombre' => 'required|string|max:255',
            'descripcion' => 'required|string',
            'capacidad_min' => 'required|integer|min:1',
            'capacidad_max' => 'required|integer|gt:capacidad_min',
            'tamaño' => 'required|string|max:50',
            'cantidad_disponibles' => 'required|integer|min:0'
        ]);

        $validated['desactivado'] = 0;

        return DB::transaction(function () use ($validated) {
            $habitacion = Habitacion::create($validated);
            return new HabitacionResource($habitacion->load(['barco']));
        });
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'id_barco' => 'sometimes|exists:barcos,id_barco',
            'categoria' => 'sometimes|string|max:50',
            'nombre' => 'sometimes|string|max:255',
            'descripcion' => 'sometimes|string',
            'capacidad_min' => 'sometimes|integer|min:1',
            'capacidad_max' => 'sometimes|integer|gt:capacidad_min',
            'tamaño' => 'sometimes|string|max:50',
            'cantidad_disponibles' => 'sometimes|integer|min:0'
        ]);

        return DB::transaction(function () use ($validated, $id) {
            $habitacion = Habitacion::findOrFail($id);
            $habitacion->update($validated);
            return new HabitacionResource($habitacion->fresh()->load(['barco']));
        });
    }

    public function deactivate($id)
    {
        $habitacion = Habitacion::findOrFail($id);
        $habitacion->update(['desactivado' => 1]);

        return response()->json([
            'message' => 'Habitación desactivada',
            'data' => new HabitacionResource($habitacion)
        ]);
    }
}