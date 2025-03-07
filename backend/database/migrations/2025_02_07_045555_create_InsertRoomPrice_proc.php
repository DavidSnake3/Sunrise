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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRoomPrice`(
    IN p_id_fecha INT,
    IN p_id_habitacion INT,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    INSERT INTO Precios_Habitaciones (id_fecha, id_habitacion, precio)
    VALUES (p_id_fecha, p_id_habitacion, p_precio);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertRoomPrice");
    }
};
