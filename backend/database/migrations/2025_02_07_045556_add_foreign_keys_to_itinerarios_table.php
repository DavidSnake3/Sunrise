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
        Schema::table('itinerarios', function (Blueprint $table) {
            $table->foreign(['id_crucero'], 'itinerarios_ibfk_1')->references(['id_crucero'])->on('cruceros')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['id_puerto'], 'itinerarios_ibfk_2')->references(['id_puerto'])->on('puertos')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('itinerarios', function (Blueprint $table) {
            $table->dropForeign('itinerarios_ibfk_1');
            $table->dropForeign('itinerarios_ibfk_2');
        });
    }
};
