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
        Schema::create('puertos', function (Blueprint $table) {
            $table->integer('id_puerto', true);
            $table->integer('id_destino')->index('id_destino');
            $table->string('nombre', 100);
            $table->string('pais', 50);
            $table->string('foto');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('puertos');
    }
};
