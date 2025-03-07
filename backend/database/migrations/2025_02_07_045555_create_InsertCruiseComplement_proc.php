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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCruiseComplement`(
    IN p_id_crucero INT,
    IN p_id_complemento INT
)
BEGIN
    INSERT INTO Cruceros_Complementos (id_crucero, id_complemento)
    VALUES (p_id_crucero, p_id_complemento);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertCruiseComplement");
    }
};
