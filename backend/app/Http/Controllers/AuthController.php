<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRegisterRequest;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AuthController extends Controller
{

    public function register(UserRegisterRequest $request)
    {
        $validateData = $request->validated();

        $user = User::create([
            'nombre_completo' => $validateData['nombre_completo'],
            'email' => $validateData['email'],
            'password' => bcrypt($validateData['password']),
            'fecha_nacimiento' => $validateData['fecha_nacimiento'],
            'edad' => $validateData['edad'],
            'genero' => $validateData['genero'],
            'nacionalidad' => $validateData['nacionalidad'],
            'telefono' => $validateData['telefono'],
        ]);

        $token = auth('api')->tokenById($user->id_usuario);

        return $this->respondWithToken($token);
    }
   
    public function login()
    {
        $credentials = request(['email', 'password']);

        if (! $token = auth('api')->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }

    public function me()
    {
        return response()->json(auth('api')->user());
    }
    public function logout()
    {
        auth('api')->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }
    public function refresh()
    {
        return $this->respondWithToken(auth('api')->refresh());
    }
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth('api')->factory()->getTTL() * 60
        ]);
    }
}