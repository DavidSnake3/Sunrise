<?php

namespace App\Http\Controllers;

use App\Http\Resources\{FacturaResource, RegistroFacturaResource};
use App\Models\{Factura, RegistroFactura};
use Illuminate\Http\Request;

class FacturaController extends Controller
{
    public function getByReserva(Request $request)
    {
        $request->validate([
            'reserva_id' => 'required|integer|min:1'
        ]);

        $factura = Factura::with('registrosFactura')
            ->where('id_reserva', $request->reserva_id)
            ->firstOrFail();

        return new FacturaResource($factura);
    }
    
    public function getRegistros(Request $request)
    {
        $request->validate([
            'factura_id' => 'required|integer|min:1'
        ]);

        $registros = RegistroFactura::where('id_factura', $request->factura_id)->get();
        
        return RegistroFacturaResource::collection($registros);
    }
}