<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "nombre_completo" => "required|string|max:255",
            "email" => "required|string|email|unique:users|max:255",
            "password" => "required|string|min:6|confirmed",
            "fecha_nacimiento" => "required|date",
            "edad" => "required|integer|min:0",
            "genero" => "required|in:1,2,3",
            "nacionalidad" => "required|string|max:255",
            "telefono" => "nullable|string|max:20",
        ];
    }
}
