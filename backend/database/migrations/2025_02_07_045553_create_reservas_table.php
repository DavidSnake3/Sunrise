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
        Schema::create('reservas', function (Blueprint $table) {
            $table->integer('id_reserva', true);
            $table->integer('id_usuario')->index('id_usuario');
            $table->integer('id_crucero')->index('id_crucero');
            $table->integer('id_fecha')->index('id_fecha');
            $table->integer('cantidad_huespedes');
            $table->enum('estado', ['pendiente', 'pagada', 'cancelada']);
            $table->date('fecha_reserva');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reservas');
    }
};
