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
        Schema::table('reservas', function (Blueprint $table) {
            $table->foreign(['id_usuario'], 'reservas_ibfk_1')->references(['id_usuario'])->on('usuarios')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['id_crucero'], 'reservas_ibfk_2')->references(['id_crucero'])->on('cruceros')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['id_fecha'], 'reservas_ibfk_3')->references(['id_fecha'])->on('fechas_cruceros')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('reservas', function (Blueprint $table) {
            $table->dropForeign('reservas_ibfk_1');
            $table->dropForeign('reservas_ibfk_2');
            $table->dropForeign('reservas_ibfk_3');
        });
    }
};
