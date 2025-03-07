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
        Schema::create('fechas_cruceros', function (Blueprint $table) {
            $table->integer('id_fecha', true);
            $table->integer('id_crucero')->index('id_crucero');
            $table->date('fecha_inicio');
            $table->date('fecha_limite_pago');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fechas_cruceros');
    }
};
