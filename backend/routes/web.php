<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;


Route::get('/usuarios', [UserController::class, 'index']);



Route::get('/', function () {
    return view('welcome');
});