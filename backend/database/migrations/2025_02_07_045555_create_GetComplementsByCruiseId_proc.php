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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `GetComplementsByCruiseId`(
    IN p_id_crucero INT
)
BEGIN
    SELECT * FROM Cruceros_Complementos WHERE id_crucero = p_id_crucero;
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS GetComplementsByCruiseId");
    }
};
