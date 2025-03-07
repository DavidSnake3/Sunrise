<?php

namespace App\Models;


use App\Notifications\ResetPasswordNotification;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements JWTSubject
{
    use HasApiTokens, Notifiable;

    // Si tu tabla en la base de datos tiene un nombre diferente, 
    // puedes especificarlo aquí. Ejemplo: 'usuarios'.
    protected $table = 'usuarios';

    // Si usas un campo diferente como la clave primaria (usualmente 'id')
    protected $primaryKey = 'id_usuario';

    // Si tus campos de timestamps no están configurados, puedes deshabilitarlos.
    public $timestamps = false;

    // Si solo quieres que algunos campos sean asignables masivamente:
    protected $fillable = [
        'nombre_completo', 'email', 'password',
        'fecha_nacimiento', 'edad', 'genero', 'nacionalidad', 'telefono'
    ];
    

    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

    public function sendPasswordResetNotification($token)
    {
        $this->notify(new ResetPasswordNotification($token));
    }
}
