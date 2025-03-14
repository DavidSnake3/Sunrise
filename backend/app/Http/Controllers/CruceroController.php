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
use DB;
use Illuminate\Http\Request;

class CruceroController extends Controller
{
    public function getAll(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1',
            'incluir_desactivados' => 'sometimes|boolean'
        ]);
    
        if ($request->has('id')) {
            return $this->getById($request->id);
        }
    
        $query = Crucero::with([
                'itinerarios.puerto', 
                'barco', 
                'destino', 
                'fechas.preciosHabitaciones', 
                'complementos'
            ]);
    
        if (!$request->boolean('incluir_desactivados')) {
            $query->where('desactivado', 0);
        }
    
        $cruceros = $query->get();
    
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

    public function getFechasByCrucero(Request $request)
    {
        $request->validate([
            'crucero_id' => 'required|integer|min:1'
        ]);
    
        $today = Carbon::today();
    
        $fechas = FechasCrucero::with('preciosHabitaciones')
            ->where('id_crucero', $request->crucero_id)
            ->whereDate('fecha_inicio', '>=', $today)
            ->get();
    
        return FechaResource::collection($fechas);
    }

    public function getPreciosByFecha(Request $request)
    {
        $request->validate([
            'fecha_id' => 'required|integer|min:1'
        ]);

        $precios = PreciosHabitacion::with('preciosHabitaciones')
            ->where('id_fecha', $request->fecha_id)
            ->get();

        return PrecioHabitacionResource::collection($precios);
    }

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


    // CRUD -----

    public function store(Request $request)
{
    $validated = $request->validate([
        'nombre' => 'required|string|max:255',
        'foto' => 'required|string',
        'cantidad_dias' => 'required|integer|min:1',
        'id_barco' => 'required|exists:barcos,id_barco',
        'id_destino' => 'required|exists:destinos,id_destino',
        'complementos' => 'sometimes|array',
        'complementos.*' => 'exists:complementos,id_complemento'
    ]);

    $validated['desactivado'] = 0;

    return DB::transaction(function () use ($validated) {
        $crucero = Crucero::create($validated);
        
        if (isset($validated['complementos'])) {
            $crucero->complementos()->sync($validated['complementos']);
        }

        return new CruceroResource($crucero->load(['barco', 'destino', 'complementos']));
    });
}

public function update(Request $request, $id)
{
    $validated = $request->validate([
        'nombre' => 'sometimes|string|max:255',
        'foto' => 'sometimes|string',
        'cantidad_dias' => 'sometimes|integer|min:1',
        'id_barco' => 'sometimes|exists:barcos,id_barco',
        'id_destino' => 'sometimes|exists:destinos,id_destino',
        'complementos' => 'sometimes|array',
        'complementos.*' => 'exists:complementos,id_complemento'
    ]);

    return DB::transaction(function () use ($validated, $id) {
        $crucero = Crucero::findOrFail($id);
        $crucero->update($validated);
        
        if (isset($validated['complementos'])) {
            $crucero->complementos()->sync($validated['complementos']);
        }

        return new CruceroResource($crucero->fresh()->load(['barco', 'destino', 'complementos']));
    });
}
    public function deactivate($id)
    {
        $crucero = Crucero::findOrFail($id);
        $crucero->update(['desactivado' => 1]);

        return response()->json([
            'message' => 'Crucero desactivado',
            'data' => new CruceroResource($crucero)
        ]);
    }
}
