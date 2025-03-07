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
        Schema::create('detalles_reserva', function (Blueprint $table) {
            $table->integer('id_detalle', true);
            $table->integer('id_reserva')->index('id_reserva');
            $table->integer('id_complemento')->index('id_complemento');
            $table->integer('id_habitacion')->index('id_habitacion');
            $table->integer('cantidad');
            $table->decimal('subtotal', 10);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('detalles_reserva');
    }
};
