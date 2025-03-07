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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDestination`(
    IN p_nombre VARCHAR(100),
    IN p_foto VARCHAR(255)
)
BEGIN
    INSERT INTO Destinos (nombre, foto)
    VALUES (p_nombre, p_foto);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertDestination");
    }
};
