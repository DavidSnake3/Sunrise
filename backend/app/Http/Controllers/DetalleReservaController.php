<?php

namespace App\Http\Controllers;

use App\Http\Resources\DetalleReservaResource;
use App\Models\DetalleReserva;
use Illuminate\Http\Request;

class DetalleReservaController extends Controller
{
    public function getAll(Request $request)
    {
        $request->validate([
            'reserva_id' => 'required_without:id|integer|min:1',
            'id' => 'sometimes|integer|min:1'
        ]);

        $query = DetalleReserva::with('complemento');

        if ($request->has('reserva_id')) {
            $query->where('id_reserva', $request->reserva_id);
        }

        if ($request->has('id')) {
            return new DetalleReservaResource($query->findOrFail($request->id));
        }

        return DetalleReservaResource::collection($query->get());
    }
}