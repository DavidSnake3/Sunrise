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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertItinerary`(
    IN p_id_crucero INT,
    IN p_dia INT,
    IN p_id_puerto INT,
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO Itinerarios (id_crucero, dia, id_puerto, descripcion)
    VALUES (p_id_crucero, p_dia, p_id_puerto, p_descripcion);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertItinerary");
    }
};
