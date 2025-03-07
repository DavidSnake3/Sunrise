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
        Schema::table('detalles_reserva', function (Blueprint $table) {
            $table->foreign(['id_reserva'], 'detalles_reserva_ibfk_1')->references(['id_reserva'])->on('reservas')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['id_complemento'], 'detalles_reserva_ibfk_2')->references(['id_complemento'])->on('complementos')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['id_habitacion'], 'detalles_reserva_ibfk_3')->references(['id_habitacion'])->on('habitaciones')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('detalles_reserva', function (Blueprint $table) {
            $table->dropForeign('detalles_reserva_ibfk_1');
            $table->dropForeign('detalles_reserva_ibfk_2');
            $table->dropForeign('detalles_reserva_ibfk_3');
        });
    }
};
