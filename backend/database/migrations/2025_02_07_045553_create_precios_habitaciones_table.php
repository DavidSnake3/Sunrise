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
        Schema::create('precios_habitaciones', function (Blueprint $table) {
            $table->integer('id_precio', true);
            $table->integer('id_fecha')->index('id_fecha');
            $table->integer('id_habitacion')->index('id_habitacion');
            $table->decimal('precio', 10);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('precios_habitaciones');
    }
};
