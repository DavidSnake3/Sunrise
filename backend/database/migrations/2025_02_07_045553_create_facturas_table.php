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
        Schema::create('facturas', function (Blueprint $table) {
            $table->integer('id_factura', true);
            $table->integer('id_reserva')->index('id_reserva');
            $table->decimal('subtotal', 10);
            $table->decimal('impuestos', 10);
            $table->decimal('tarifas', 10);
            $table->decimal('total', 10);
            $table->enum('metodo_pago', ['pago_unico', 'dos_pagos']);
            $table->date('fecha_pago');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('facturas');
    }
};
