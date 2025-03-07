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
        Schema::create('barcos', function (Blueprint $table) {
            $table->integer('id_barco', true);
            $table->string('nombre', 100);
            $table->integer('capacidad_pasajeros');
            $table->integer('capacidad_tripulantes');
            $table->integer('total_habitaciones');
            $table->decimal('velocidad_maxima', 5);
            $table->decimal('tonelaje', 10);
            $table->decimal('altura', 5);
            $table->decimal('largo', 5);
            $table->decimal('ancho', 5);
            $table->year('año_construccion');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('barcos');
    }
};
