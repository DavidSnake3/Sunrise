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
        Schema::create('usuarios', function (Blueprint $table) {
            $table->integer('id_usuario', true);
            $table->string('nombre_completo', 100);
            $table->boolean('admin')->default(false);
            $table->enum('genero', ['Masculino', 'Femenino', 'Otro'])->nullable();
            $table->integer('edad')->nullable();
            $table->date('fecha_nacimiento')->nullable();
            $table->string('nacionalidad', 50)->nullable();
            $table->string('telefono', 15)->nullable();
            $table->string('email', 100)->nullable()->unique('email');
            $table->string('password')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('usuarios');
        
    }
};
