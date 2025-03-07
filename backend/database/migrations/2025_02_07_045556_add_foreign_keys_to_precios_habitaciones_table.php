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
        Schema::table('precios_habitaciones', function (Blueprint $table) {
            $table->foreign(['id_fecha'], 'precios_habitaciones_ibfk_1')->references(['id_fecha'])->on('fechas_cruceros')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['id_habitacion'], 'precios_habitaciones_ibfk_2')->references(['id_habitacion'])->on('habitaciones')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('precios_habitaciones', function (Blueprint $table) {
            $table->dropForeign('precios_habitaciones_ibfk_1');
            $table->dropForeign('precios_habitaciones_ibfk_2');
        });
    }
};
