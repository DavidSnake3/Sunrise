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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPort`(
    IN p_id_destino INT,
    IN p_nombre VARCHAR(100),
    IN p_pais VARCHAR(50),
    IN p_foto VARCHAR(255)
)
BEGIN
    INSERT INTO Puertos (id_destino, nombre, pais, foto)
    VALUES (p_id_destino, p_nombre, p_pais, p_foto);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertPort");
    }
};
