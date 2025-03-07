<?php

namespace App\Http\Controllers;

use App\Models\Destino;
use Illuminate\Http\Request;

class DestinoController extends Controller
{
    public function index()
    {
        $destinos = Destino::all();
        return response()->json($destinos);
    }

    public function getPuertos($id)
    {
        $destino = Destino::with('puertos')->findOrFail($id);
        return response()->json($destino->puertos);
    }
}