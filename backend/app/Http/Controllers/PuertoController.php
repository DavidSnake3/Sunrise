<?php

namespace App\Http\Controllers;

use App\Models\Puerto;
use Illuminate\Http\Request;

class PuertoController extends Controller
{
    public function getByBarco($barcoId)
    {
        $puertos = Puerto::whereHas('barcos', function($query) use ($barcoId) {
            $query->where('id_barco', $barcoId);
        })->get();

        return response()->json($puertos);
    }

    public function index()
    {
        $puerto = Puerto::all();
        return response()->json($puerto);
    }
    
}