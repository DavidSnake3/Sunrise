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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertReservation`(
    IN p_id_usuario INT,
    IN p_id_crucero INT,
    IN p_id_fecha INT,
    IN p_cantidad_huespedes INT,
    IN p_estado ENUM('pendiente', 'pagada', 'cancelada'),
    IN p_fecha_reserva DATE
)
BEGIN
    INSERT INTO Reservas (id_usuario, id_crucero, id_fecha, cantidad_huespedes, estado, fecha_reserva)
    VALUES (p_id_usuario, p_id_crucero, p_id_fecha, p_cantidad_huespedes, p_estado, p_fecha_reserva);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertReservation");
    }
};
