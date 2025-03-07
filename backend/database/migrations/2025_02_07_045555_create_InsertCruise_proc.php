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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCruise`(
    IN p_nombre VARCHAR(100),
    IN p_foto VARCHAR(255),
    IN p_cantidad_dias INT,
    IN p_id_barco INT
)
BEGIN
    INSERT INTO Cruceros (nombre, foto, cantidad_dias, id_barco)
    VALUES (p_nombre, p_foto, p_cantidad_dias, p_id_barco);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertCruise");
    }
};
