<?php

namespace App\Http\Controllers;

use App\Http\Resources\DestinoResource;
use App\Http\Resources\PuertoResource;
use App\Models\Destino;
use App\Models\Puerto;
use Illuminate\Http\Request;

class DestinoController extends Controller
{
    public function getAll(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1',
            'incluir_desactivados' => 'sometimes|boolean' // este mae sirve para excluir desactivados de una
        ]);

        if ($request->has('id')) {
            return $this->getById($request->id);
        }

        $query = Destino::with('puertos');

        // aqui automaticamente se filtra para tanta la huevonada
        if (!$request->boolean('incluir_desactivados')) {
            $query->where('desactivado', 0);
        }

        $destinos = $query->get();
        return DestinoResource::collection($destinos);
    }
    
    public function getById($id)
    {
        $destino = Destino::with('puertos')->findOrFail($id);
        return new DestinoResource($destino);
    }

    public function getAllPuertos(Request $request)
    {
        $request->validate([
            'id'         => 'sometimes|integer|min:1',
            'destino_id' => 'sometimes|integer|min:1'
        ]);

        if ($request->has('id')) {
            $puerto = Puerto::with('destino')->find($request->id);
            return $puerto ? new PuertoResource($puerto) : response()->json(['error' => 'No encontrado'], 404);
        }

        if ($request->has('destino_id')) {
            $puertos = Puerto::where('id_destino', $request->destino_id)->get();
            return PuertoResource::collection($puertos);
        }

        return PuertoResource::collection(Puerto::all());
    }

 //CRUD PRUEBAS -------------

// nuevo destino
public function store(Request $request)
{
    $request->validate([
        'nombre' => 'required|string|max:255',
        'foto' => 'required|string' 
    ]);

    $destino = Destino::create([
        'nombre' => $request->nombre,
        'foto' => $request->foto,
        'desactivado' => 0 
    ]);

    return new DestinoResource($destino);
}

// actualizar destino
public function update(Request $request, $id)
{
    $request->validate([
        'nombre' => 'sometimes|string|max:255',
        'foto' => 'sometimes|string',
        'desactivado' => 'sometimes|boolean' 
    ]);

    $destino = Destino::findOrFail($id);
    
    $destino->fill($request->only(['nombre', 'foto', 'desactivado']));
    $destino->save();

    return new DestinoResource($destino);
}

// desactivar
public function deactivate($id)
{
    $destino = Destino::findOrFail($id);
    $destino->desactivado = 1;
    $destino->save();

    return response()->json([
        'message' => 'Destino desactivado correctamente'
    ]);
}

}