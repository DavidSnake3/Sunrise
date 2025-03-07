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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGuestsByReservationId`(
    IN p_id_reserva INT
)
BEGIN
    SELECT * FROM Huespedes WHERE Id_reserva = p_id_reserva;
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS GetGuestsByReservationId");
    }
};
