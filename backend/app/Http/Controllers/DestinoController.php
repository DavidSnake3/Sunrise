<?php

namespace App\Http\Controllers;

use App\Http\Resources\DestinoResource;
use App\Http\Resources\PuertoResource;
use App\Models\Destino;
use App\Models\Puerto;
use Illuminate\Http\Request;

class DestinoController extends Controller
{
    // Obtiene todos los destinos o un destino específico si se envía ?id=...
    public function getAll(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1'
        ]);

        if ($request->has('id')) {
            return $this->getById($request->id);
        }

        $destinos = Destino::with('puertos')->get();
        return DestinoResource::collection($destinos);
    }
    
    public function getById($id)
    {
        $destino = Destino::with('puertos')->findOrFail($id);
        return new DestinoResource($destino);
    }

    // Para puertos:
    // ?id=... retorna el detalle de un puerto
    // ?destino_id=... retorna todos los puertos de ese destino
    public function getAllPuertos(Request $request)
    {
        $request->validate([
            'id'         => 'sometimes|integer|min:1',
            'destino_id' => 'sometimes|integer|min:1'
        ]);

        // Detalle de un puerto en específico
        if ($request->has('id')) {
            $puerto = Puerto::with('destino')->find($request->id);
            return $puerto ? new PuertoResource($puerto) : response()->json(['error' => 'No encontrado'], 404);
        }

        // Todos los puertos de un destino
        if ($request->has('destino_id')) {
            $puertos = Puerto::where('id_destino', $request->destino_id)->get();
            return PuertoResource::collection($puertos);
        }

        // Sin parámetros: retorna todos los puertos
        return PuertoResource::collection(Puerto::all());
    }
}