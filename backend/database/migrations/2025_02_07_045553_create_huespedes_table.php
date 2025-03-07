<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('huespedes', function (Blueprint $table) {
            $table->integer('Id_huesped', true);
            $table->integer('Id_reserva')->index('id_reserva');
            $table->string('nombre_completo', 100);
            $table->enum('genero', ['Masculino', 'Femenino', 'Otro']);
            $table->integer('edad');
            $table->date('fecha_nacimiento');
            $table->string('nacionalidad', 50);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('huespedes');
    }
};
