<?php

namespace App\Http\Controllers;

use App\Http\Resources\{
    ReservaResource,
    ReservaFullResource
};
use App\Models\Reserva;
use Illuminate\Http\Request;

class ReservaController extends Controller
{
    public function getAll(Request $request)
    {
        $request->validate([
            'estado' => 'sometimes|in:PENDIENTE,PARCIAL,CANCELADO,PAGADO',
            'id' => 'sometimes|integer|min:1'
        ]);

        if ($request->has('id')) {
            return $this->getById($request);
        }

        $query = Reserva::query();

        if ($request->has('estado')) {
            $query->where('estado', $request->estado);
        }

        return ReservaResource::collection($query->get());
    }

    public function getById(Request $request)
    {
        $request->validate(['id' => 'required|integer|min:1']);
    
        $reserva = Reserva::with([
            'usuario',
            'crucero.destino',       // Relación corregida
            'crucero.barco',         // Relación directa al barco
            'huespedes',
            'detallesReserva.complemento',
            'reservaHabitaciones.habitacion.detallesHabitacion', // Relación a detalles
            'factura.registrosFactura'
        ])->findOrFail($request->id);
    
        return new ReservaFullResource($reserva);
    }
}