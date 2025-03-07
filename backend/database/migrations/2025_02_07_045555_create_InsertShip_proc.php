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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertShip`(
    IN p_nombre VARCHAR(100),
    IN p_capacidad_pasajeros INT,
    IN p_capacidad_tripulantes INT,
    IN p_total_habitaciones INT,
    IN p_velocidad_maxima DECIMAL(5,2),
    IN p_tonelaje DECIMAL(10,2),
    IN p_altura DECIMAL(5,2),
    IN p_largo DECIMAL(5,2),
    IN p_ancho DECIMAL(5,2),
    IN p_año_construccion YEAR
)
BEGIN
    INSERT INTO Barcos (nombre, capacidad_pasajeros, capacidad_tripulantes, total_habitaciones, velocidad_maxima, tonelaje, altura, largo, ancho, año_construccion)
    VALUES (p_nombre, p_capacidad_pasajeros, p_capacidad_tripulantes, p_total_habitaciones, p_velocidad_maxima, p_tonelaje, p_altura, p_largo, p_ancho, p_año_construccion);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertShip");
    }
};
