<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUser`(
    IN p_nombre_completo VARCHAR(100),
    IN p_admin BOOLEAN,
    IN p_genero ENUM('Masculino', 'Femenino', 'Otro'),
    IN p_edad INT,
    IN p_fecha_nacimiento DATE,
    IN p_nacionalidad VARCHAR(50),
    IN p_telefono VARCHAR(15),
    IN p_email VARCHAR(100),
    IN p_contraseña VARCHAR(255)
)
BEGIN
    INSERT INTO Usuarios (nombre_completo, admin, genero, edad, fecha_nacimiento, nacionalidad, telefono, email, contraseña)
    VALUES (p_nombre_completo, p_admin, p_genero, p_edad, p_fecha_nacimiento, p_nacionalidad, p_telefono, p_email, p_contraseña);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertUser");
    }
};
