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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUser`(
    IN p_id_usuario INT,
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
    UPDATE Usuarios
    SET nombre_completo = p_nombre_completo,
        admin = p_admin,
        genero = p_genero,
        edad = p_edad,
        fecha_nacimiento = p_fecha_nacimiento,
        nacionalidad = p_nacionalidad,
        telefono = p_telefono,
        email = p_email,
        contraseña = p_contraseña
    WHERE id_usuario = p_id_usuario;
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS UpdateUser");
    }
};
