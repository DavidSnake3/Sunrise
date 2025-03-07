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
        Schema::create('habitaciones', function (Blueprint $table) {
            $table->integer('id_habitacion', true);
            $table->integer('id_barco')->index('id_barco');
            $table->enum('categoria', ['Interior', 'Vista al mar', 'Balcón', 'Suite']);
            $table->string('nombre', 100);
            $table->text('descripcion')->nullable();
            $table->integer('capacidad_min');
            $table->integer('capacidad_max');
            $table->decimal('tamaño', 5);
            $table->integer('cantidad_Disponibles');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('habitaciones');
    }
};
