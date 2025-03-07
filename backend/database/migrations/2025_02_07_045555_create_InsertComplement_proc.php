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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertComplement`(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10,2),
    IN p_aplicado_por ENUM('camarote', 'huésped')
)
BEGIN
    INSERT INTO Complementos (nombre, descripcion, precio, aplicado_por)
    VALUES (p_nombre, p_descripcion, p_precio, p_aplicado_por);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertComplement");
    }
};
