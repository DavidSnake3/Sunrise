<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\ComplementoResource;
use App\Http\Resources\CruceroResource;
use App\Http\Resources\FechaResource;
use App\Http\Resources\ItinerarioResource;
use App\Http\Resources\PrecioHabitacionResource;
use App\Models\Crucero;
use App\Models\FechasCrucero;
use App\Models\Itinerario;
use App\Models\PreciosHabitacion;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CruceroController extends Controller
{
    // Obtener todos los cruceros o uno específico (con itinerarios, barco, destino, fechas y complementos)
    public function getAll(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1'
        ]);

        if ($request->has('id')) {
            return $this->getById($request->id);
        }

        $cruceros = Crucero::with([
            'itinerarios.puerto', 
            'barco', 
            'destino', 
            'fechas', 
            'complementos'
        ])->get();

        return CruceroResource::collection($cruceros);
    }

    public function getById($id)
    {
        $crucero = Crucero::with([
            'itinerarios.puerto', 
            'barco', 
            'destino', 
            'fechas.preciosHabitaciones.habitacion', 
            'complementos'
        ])->findOrFail($id);

        return new CruceroResource($crucero);
    }

    // Itinerario: Obtener todos los itinerarios de un crucero (con datos del puerto)
    public function getItinerariosByCrucero(Request $request)
    {
        $request->validate([
            'crucero_id' => 'required|integer|min:1'
        ]);

        $itinerarios = Itinerario::with('puerto')
            ->where('id_crucero', $request->crucero_id)
            ->get();

        return ItinerarioResource::collection($itinerarios);
    }

    // Fechas: Obtener todas las fechas de un crucero (donde fecha >= hoy) con sus precios de habitaciones
    public function getFechasByCrucero(Request $request)
    {
        $request->validate([
            'crucero_id' => 'required|integer|min:1'
        ]);
    
        $today = Carbon::today()->toDateString();
    
        $fechas = FechasCrucero::with('preciosHabitaciones.habitacion')
            ->where('id_crucero', $request->crucero_id)
            ->where('fecha_inicio', '>=', $today) // Se usa fecha_inicio
            ->get();
    
        return FechaResource::collection($fechas);
    }

    // PreciosHabitaciones: Obtener precios de habitaciones por fecha
    public function getPreciosByFecha(Request $request)
    {
        $request->validate([
            'fecha_id' => 'required|integer|min:1'
        ]);

        $precios = PreciosHabitacion::with('habitacion')
            ->where('id_fecha', $request->fecha_id)
            ->get();

        return PrecioHabitacionResource::collection($precios);
    }

    // Crucero_Complementos: Obtener todos los complementos asociados a un crucero
    public function getComplementosByCrucero(Request $request)
    {
        $request->validate([
            'crucero_id' => 'required|integer|min:1'
        ]);

        $crucero = Crucero::with('complementos')->find($request->crucero_id);
        if (!$crucero) {
            return response()->json(['error' => 'Crucero no encontrado'], 404);
        }

        return ComplementoResource::collection($crucero->complementos);
    }
}
