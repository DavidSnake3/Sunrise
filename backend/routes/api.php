<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BarcoController;
use App\Http\Controllers\CruceroController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DestinoController;
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

Route::get('/usuarios', [UserController::class, 'index']);
Route::get('/cruceros', [CruceroController::class, 'index']);
Route::get('/destinos', [DestinoController::class, 'index']);
Route::get('/barcos', [BarcoController::class, 'index']);
Route::get('/fechas-crucero', [FechasCruceroController::class, 'index']);
Route::get('/dashboard', [DashboardController::class, 'index']);


Route::get('/destinos/{destino}/puertos', [DestinoController::class, 'getPuertos']);
Route::get('/barcos/{barco}/habitaciones', [BarcoController::class, 'getHabitaciones']);
Route::get('/habitaciones/{habitacion}/detalles', [HabitacionController::class, 'showDetails']);
Route::get('/itinerarios/{id_crucero}', [ItinerarioController::class, 'getByCrucero']);
Route::get('/fechas-crucero/{id_crucero}', [FechasCruceroController::class, 'getByCrucero']);
Route::get('/precio-habitacion/{id_habitacion}/{id_fecha}', [PreciosHabitacionController::class, 'getPrecio']);
Route::get('/precio-habitacion/{id_fecha}', [PreciosHabitacionController::class, 'getPrecioPorFecha']);
Route::get('/barcos/{id_barco}', [BarcoController::class, 'show']);

// Reserva
    // Reservas
    Route::get('/reservas', [ReservaController::class, 'index']);
    Route::get('/reservas/{id}', [ReservaController::class, 'show']);
    // Nueva ruta para factura/detalle completo
    Route::get('/reservas/{id}/detalleFactura', [ReservaController::class, 'detalleFactura']);

    // Facturas
    Route::get('/facturas', [FacturaController::class, 'index']);
    Route::get('/facturas/{id}', [FacturaController::class, 'show']);
    Route::post('/facturas', [FacturaController::class, 'store']);

    // Huéspedes
    Route::get('/huespedes', [HuespedController::class, 'index']);
    Route::get('/huespedes/{id}', [HuespedController::class, 'show']);
    Route::post('/huespedes', [HuespedController::class, 'store']);

Route::get('/imagenes/cruceros/{filename}', function ($filename) {
    return response()->file(public_path("imagenes/cruceros/{$filename}"));
})->where('filename', '.*');
Route::get('/imagenes/destinos/{filename}', function ($filename) {
    return response()->file(public_path("imagenes/destinos/{$filename}"));
})->where('filename', '.*');
Route::get('/imagenes/puertos/{filename}', function ($filename) {
    return response()->file(public_path("imagenes/puertos/{$filename}"));
})->where('filename', '.*');