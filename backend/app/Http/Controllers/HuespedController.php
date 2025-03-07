<?php

namespace App\Http\Controllers;

use App\Models\Huesped;
use Illuminate\Http\Request;

class HuespedController extends Controller
{
    public function index()
    {
        try {
            $huespedes = Huesped::with('reserva')->get();
            return response()->json($huespedes);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Error al cargar huéspedes',
                'details' => $e->getMessage()
            ], 500);
        }
    }

    public function show($id)
    {
        try {
            $huesped = Huesped::with('reserva')->findOrFail($id);
            return response()->json($huesped);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Error al cargar huésped',
                'details' => $e->getMessage()
            ], 500);
        }
    }

    public function store(Request $request)
    {
         try {
             $data = $request->all();
             $huesped = Huesped::create($data);
             return response()->json($huesped, 201);
         } catch (\Exception $e) {
             return response()->json([
                 'error' => 'Error al crear huésped',
                 'details' => $e->getMessage()
             ], 500);
         }
    }
}
