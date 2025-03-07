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
        DB::unprepared("CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertInvoice`(
    IN p_id_reserva INT,
    IN p_subtotal DECIMAL(10,2),
    IN p_impuestos DECIMAL(10,2),
    IN p_tarifas DECIMAL(10,2),
    IN p_total DECIMAL(10,2),
    IN p_metodo_pago ENUM('pago_unico', 'dos_pagos'),
    IN p_fecha_pago DATE
)
BEGIN
    INSERT INTO Facturas (id_reserva, subtotal, impuestos, tarifas, total, metodo_pago, fecha_pago)
    VALUES (p_id_reserva, p_subtotal, p_impuestos, p_tarifas, p_total, p_metodo_pago, p_fecha_pago);
END");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::unprepared("DROP PROCEDURE IF EXISTS InsertInvoice");
    }
};
