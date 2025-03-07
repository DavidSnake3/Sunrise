<?php

namespace App\Http\Controllers;

use App\Models\Factura;
use Illuminate\Http\Request;

class FacturaController extends Controller
{
    public function index()
    {
        try {
            $facturas = Factura::with('reserva')->get();
            return response()->json($facturas);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Error al cargar facturas',
                'details' => $e->getMessage()
            ], 500);
        }
    }

    public function show($id)
    {
        try {
            $factura = Factura::with('reserva')->findOrFail($id);
            return response()->json($factura);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Error al cargar factura',
                'details' => $e->getMessage()
            ], 500);
        }
    }

    public function store(Request $request)
    {
         try {
             $data = $request->all();
             $factura = Factura::create($data);
             return response()->json($factura, 201);
         } catch (\Exception $e) {
             return response()->json([
                 'error' => 'Error al crear factura',
                 'details' => $e->getMessage()
             ], 500);
         }
    }
}
