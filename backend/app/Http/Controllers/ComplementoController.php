<?php

namespace App\Http\Controllers;

use App\Http\Resources\ComplementoResource;
use App\Models\Complemento;
use Illuminate\Http\Request;

class ComplementoController extends Controller
{
    // Obtener todos los complementos
    public function getAll(Request $request)
    {
        $complementos = Complemento::all();
        return ComplementoResource::collection($complementos);
    }

    // Obtener un complemento específico
    public function getById(Request $request)
    {
        $request->validate([
            'id' => 'required|integer|min:1'
        ]);

        $complemento = Complemento::find($request->id);
        if (!$complemento) {
            return response()->json(['error' => 'Complemento no encontrado'], 404);
        }
        return new ComplementoResource($complemento);
    }
}
