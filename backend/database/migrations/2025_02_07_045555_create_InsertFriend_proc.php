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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertFriend`(
    IN p_id_usuario INT,
    IN p_nombre_completo VARCHAR(100),
    IN p_genero ENUM('Masculino', 'Femenino', 'Otro'),
    IN p_edad INT,
    IN p_fecha_nacimiento DATE,
    IN p_nacionalidad VARCHAR(50)
)
BEGIN
    INSERT INTO Amigos (id_usuario, nombre_completo, genero, edad, fecha_nacimiento, nacionalidad)
    VALUES (p_id_usuario, p_nombre_completo, p_genero, p_edad, p_fecha_nacimiento, p_nacionalidad);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertFriend");
    }
};
