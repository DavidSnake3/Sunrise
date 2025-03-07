<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        // Obtiene todos los usuarios desde la tabla 'usuarios'
        $users = User::all();

        // Retorna los usuarios como respuesta JSON (ideal para APIs o vistas)
        return response()->json($users);
    }
}
