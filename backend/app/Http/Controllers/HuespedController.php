<?php

namespace App\Http\Controllers;

use App\Http\Resources\HuespedResource;
use App\Models\Huesped;
use Illuminate\Http\Request;

class HuespedController extends Controller
{
    public function getAll(Request $request)
    {
        $request->validate([
            'reserva_id' => 'required_without_all:id|integer|min:1',
            'id' => 'sometimes|integer|min:1'
        ]);
    
        $query = Huesped::query();
    
        if ($request->has('reserva_id')) {
            $query->where('Id_reserva', $request->reserva_id);
        }
    
        if ($request->has('id')) {
            return new HuespedResource($query->findOrFail($request->id));
        }
    
        return HuespedResource::collection($query->get());
    }
}