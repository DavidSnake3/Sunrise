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
        Schema::table('huespedes', function (Blueprint $table) {
            $table->foreign(['Id_reserva'], 'huespedes_ibfk_1')->references(['id_reserva'])->on('reservas')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('huespedes', function (Blueprint $table) {
            $table->dropForeign('huespedes_ibfk_1');
        });
    }
};
