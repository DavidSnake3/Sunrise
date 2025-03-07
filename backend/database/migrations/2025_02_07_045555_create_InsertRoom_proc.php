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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRoom`(
    IN p_id_barco INT,
    IN p_categoria ENUM('Interior', 'Vista al mar', 'Balcón', 'Suite'),
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_capacidad_min INT,
    IN p_capacidad_max INT,
    IN p_tamaño DECIMAL(5,2),
    IN p_cantidad_Disponibles INT
)
BEGIN
    INSERT INTO Habitaciones (id_barco, categoria, nombre, descripcion, capacidad_min, capacidad_max, tamaño, cantidad_Disponibles)
    VALUES (p_id_barco, p_categoria, p_nombre, p_descripcion, p_capacidad_min, p_capacidad_max, p_tamaño, p_cantidad_Disponibles);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertRoom");
    }
};
