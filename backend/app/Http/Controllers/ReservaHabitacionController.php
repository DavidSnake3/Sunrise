<?php

namespace App\Http\Controllers;

use App\Http\Resources\ReservaHabitacionResource;
use App\Models\ReservaHabitacion;
use Illuminate\Http\Request;

class ReservaHabitacionController extends Controller
{
    public function getAll(Request $request)
    {
        $request->validate([
            'reserva_id' => 'required_without:id|integer|min:1',
            'id' => 'sometimes|integer|min:1'
        ]);

        $query = ReservaHabitacion::with(['habitacion.detallesHabitacion']);

        if ($request->has('reserva_id')) {
            $query->where('id_reserva', $request->reserva_id);
        }

        if ($request->has('id')) {
            return new ReservaHabitacionResource($query->findOrFail($request->id));
        }

        return ReservaHabitacionResource::collection($query->get());
    }
}