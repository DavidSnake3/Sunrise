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
        Schema::create('complementos', function (Blueprint $table) {
            $table->integer('id_complemento', true);
            $table->string('nombre', 100);
            $table->text('descripcion')->nullable();
            $table->decimal('precio', 10);
            $table->enum('aplicado_por', ['camarote', 'huésped']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('complementos');
    }
};
