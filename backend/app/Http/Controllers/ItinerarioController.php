<?php

namespace App\Http\Controllers;

use App\Models\Itinerario;
use Illuminate\Http\Request;

class ItinerarioController extends Controller
{
    public function getByCrucero($id_crucero)
    {
        $itinerarios = Itinerario::where('id_crucero', $id_crucero)->get();

        return response()->json($itinerarios);
    }
}
