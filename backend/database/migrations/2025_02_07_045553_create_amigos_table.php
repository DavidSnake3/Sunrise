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
        Schema::create('amigos', function (Blueprint $table) {
            $table->integer('id_amigo', true);
            $table->integer('id_usuario')->index('id_usuario');
            $table->string('nombre_completo', 100);
            $table->enum('genero', ['Masculino', 'Femenino', 'Otro']);
            $table->integer('edad');
            $table->date('fecha_nacimiento');
            $table->string('nacionalidad', 50);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('amigos');
    }
};
