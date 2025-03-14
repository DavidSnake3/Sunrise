<?php

namespace App\Http\Controllers;

use App\Http\Resources\PuertoResource;
use App\Models\Puerto;
use DB;
use Illuminate\Http\Request;

class PuertoController extends Controller
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

        $query = Puerto::with(['destino', 'itinerarios']);

        if (!$request->boolean('incluir_desactivados')) {
            $query->where('desactivado', 0);
        }

        $puertos = $query->get();

        return PuertoResource::collection($puertos);
    }

    public function getById($id)
    {
        $puerto = Puerto::with(['destino', 'itinerarios'])
                        ->findOrFail($id);

        return new PuertoResource($puerto);
    }
    public function getByBarco($barcoId)
    {
        $puertos = Puerto::whereHas('barcos', function($query) use ($barcoId) {
            $query->where('id_barco', $barcoId);
        })->get();

        return response()->json($puertos);
    }

    //CRUD ------

    public function store(Request $request)
    {
        $validated = $request->validate([
            'id_destino' => 'required|exists:destinos,id_destino',
            'nombre' => 'required|string|max:255',
            'pais' => 'required|string|max:255',
            'foto' => 'required|string',
        ]);

        $validated['desactivado'] = 0;

        return DB::transaction(function () use ($validated) {
            $puerto = Puerto::create($validated);
            return new PuertoResource($puerto->load(['destino']));
        });
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'id_destino' => 'sometimes|exists:destinos,id_destino',
            'nombre' => 'sometimes|string|max:255',
            'pais' => 'sometimes|string|max:255',
            'foto' => 'sometimes|string',
        ]);

        return DB::transaction(function () use ($validated, $id) {
            $puerto = Puerto::findOrFail($id);
            $puerto->update($validated);
            return new PuertoResource($puerto->fresh()->load(['destino']));
        });
    }

    public function desactivate($id)
    {
        $puerto = Puerto::findOrFail($id);
        $puerto->update(['desactivado' => 1]);

        return response()->json([
            'message' => 'Puerto desactivado',
            'data' => new PuertoResource($puerto)
        ]);
    }
    
}