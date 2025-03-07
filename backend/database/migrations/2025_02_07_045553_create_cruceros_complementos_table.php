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
        Schema::create('cruceros_complementos', function (Blueprint $table) {
            $table->integer('id_crucero_complemento', true);
            $table->integer('id_crucero')->index('id_crucero');
            $table->integer('id_complemento')->index('id_complemento');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cruceros_complementos');
    }
};
