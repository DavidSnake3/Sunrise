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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCruiseDate`(
    IN p_id_crucero INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_limite_pago DATE
)
BEGIN
    INSERT INTO Fechas_Cruceros (id_crucero, fecha_inicio, fecha_limite_pago)
    VALUES (p_id_crucero, p_fecha_inicio, p_fecha_limite_pago);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertCruiseDate");
    }
};
