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
        Schema::table('fotos_barco', function (Blueprint $table) {
            $table->foreign(['Id_barco'], 'fotos_barco_ibfk_1')->references(['id_barco'])->on('barcos')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('fotos_barco', function (Blueprint $table) {
            $table->dropForeign('fotos_barco_ibfk_1');
        });
    }
};
