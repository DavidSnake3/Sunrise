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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRoomPricesByDateId`(
    IN p_id_fecha INT
)
BEGIN
    SELECT * FROM Precios_Habitaciones WHERE id_fecha = p_id_fecha;
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS GetRoomPricesByDateId");
    }
};
