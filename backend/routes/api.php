<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BarcoController;
use App\Http\Controllers\ComplementoController;
use App\Http\Controllers\CruceroController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DestinoController;
use App\Http\Controllers\DetalleReservaController;
use App\Http\Controllers\FacturaController;
use App\Http\Controllers\FechaCruceroController;
use App\Http\Controllers\FechasCruceroController;
use App\Http\Controllers\ForgotPasswordController;
use App\Http\Controllers\HabitacionController;
use App\Http\Controllers\HuespedController;
use App\Http\Controllers\ItinerarioController;
use App\Http\Controllers\PreciosHabitacionController;
use App\Http\Controllers\PuertoController;
use App\Http\Controllers\ReservaController;
use App\Http\Controllers\ReservaHabitacionController;
use App\Http\Controllers\ResetPasswordController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


//Route::get('/user', function (Request $request) {
 //   return $request->user();
//})->middleware('auth:sanctum');

Route::group(['prefix' => 'auth'], function ($router) {
    Route::post('login', [AuthController::class,'login']);
    Route::post('register', [AuthController::class,'register']);
});


Route::post('password/email',[ForgotPasswordController::class,'sendResetLinkEmail']);
Route::post('password/reset',[ResetPasswordController::class,'reset'])->name('password.reset');
Route::middleware(['auth:api'])->group(function() {
    Route::post('logout', [AuthController::class,'logout']);
    Route::post('refresh', [AuthController::class,'refresh']);
    Route::post('me', [AuthController::class,'me']);
    
});

Route::get('usuarios', [UserController::class, 'index']);


//Destinos
Route::get('destinos', [DestinoController::class, 'getAll']);
Route::get('puertos', [DestinoController::class, 'getAllPuertos']);
//Crud
Route::post('destinos/', [DestinoController::class, 'store']);
Route::patch('destinos/{id}', [DestinoController::class, 'update']);
Route::delete('destinos/{id}', [DestinoController::class, 'deactivate']);

//Barcos e habitaciones
Route::get('barcos', [BarcoController::class, 'getAll']);
Route::get('habitaciones', [BarcoController::class, 'getAllHabitaciones']);
Route::get('detalle_habitacion', [BarcoController::class, 'getDetalleHabitacion']);
Route::get('/barcos/{idBarco}/fotos', [BarcoController::class, 'getFotos']);
//Crud
Route::post('barcos', [BarcoController::class, 'store']);
Route::patch('barcos/{id}', [BarcoController::class,'update']);
Route::delete('barcos/{id}', [BarcoController::class, 'desactivate']);

// Crucero y relaciones
Route::get('cruceros', [CruceroController::class, 'getAll']);
Route::get('itinerarios', [CruceroController::class, 'getItinerariosByCrucero']);
Route::get('fechas', [CruceroController::class, 'getFechasByCrucero']);
Route::get('precios_habitaciones', [CruceroController::class, 'getPreciosByFecha']);
Route::get('crucero_complementos', [CruceroController::class, 'getComplementosByCrucero']);

// Complementos generales
Route::get('complementos', [ComplementoController::class, 'getAll']);
Route::get('complemento', [ComplementoController::class, 'getById']);

// Reservas principales
Route::get('reservas', [ReservaController::class, 'getAll']);

// Sub-entidades con filtros por parámetros
Route::get('huespedes', [HuespedController::class, 'getAll']);
Route::get('detalles_reserva', [DetalleReservaController::class, 'getAll']);
Route::get('reserva_habitaciones', [ReservaHabitacionController::class, 'getAll']);
Route::get('registros_factura', [FacturaController::class, 'getRegistros']);




//Imagenes 

Route::get('/imagenes/cruceros/{filename}', function ($filename) {
    return response()->file(public_path("imagenes/cruceros/{$filename}"));
})->where('filename', '.*');
Route::get('/imagenes/destinos/{filename}', function ($filename) {
    return response()->file(public_path("imagenes/destinos/{$filename}"));
})->where('filename', '.*');
Route::get('/imagenes/puertos/{filename}', function ($filename) {
    return response()->file(public_path("imagenes/puertos/{$filename}"));
})->where('filename', '.*');