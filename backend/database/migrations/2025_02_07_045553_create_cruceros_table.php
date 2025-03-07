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
        Schema::create('cruceros', function (Blueprint $table) {
            $table->integer('id_crucero', true);
            $table->string('nombre', 100);
            $table->string('foto');
            $table->integer('cantidad_dias');
            $table->integer('id_barco')->index('id_barco');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cruceros');
    }
};
