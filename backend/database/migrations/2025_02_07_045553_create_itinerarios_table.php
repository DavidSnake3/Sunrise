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
        Schema::create('itinerarios', function (Blueprint $table) {
            $table->integer('id_itinerario', true);
            $table->integer('id_crucero')->index('id_crucero');
            $table->integer('dia');
            $table->integer('id_puerto')->index('id_puerto');
            $table->text('descripcion')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('itinerarios');
    }
};
