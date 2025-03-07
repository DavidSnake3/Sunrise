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
        Schema::table('puertos', function (Blueprint $table) {
            $table->foreign(['id_destino'], 'puertos_ibfk_1')->references(['id_destino'])->on('destinos')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('puertos', function (Blueprint $table) {
            $table->dropForeign('puertos_ibfk_1');
        });
    }
};
