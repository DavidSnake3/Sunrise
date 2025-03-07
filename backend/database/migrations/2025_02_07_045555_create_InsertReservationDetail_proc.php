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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertReservationDetail`(
    IN p_id_reserva INT,
    IN p_id_complemento INT,
    IN p_id_habitacion INT,
    IN p_cantidad INT,
    IN p_subtotal DECIMAL(10,2)
)
BEGIN
    INSERT INTO Detalles_Reserva (id_reserva, id_complemento, id_habitacion, cantidad, subtotal)
    VALUES (p_id_reserva, p_id_complemento, p_id_habitacion, p_cantidad, p_subtotal);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertReservationDetail");
    }
};
