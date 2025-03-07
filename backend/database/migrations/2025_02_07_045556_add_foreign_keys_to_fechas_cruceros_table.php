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
        Schema::table('fechas_cruceros', function (Blueprint $table) {
            $table->foreign(['id_crucero'], 'fechas_cruceros_ibfk_1')->references(['id_crucero'])->on('cruceros')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('fechas_cruceros', function (Blueprint $table) {
            $table->dropForeign('fechas_cruceros_ibfk_1');
        });
    }
};
