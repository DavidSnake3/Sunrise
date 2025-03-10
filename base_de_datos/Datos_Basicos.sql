use sunrise_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE detalles_reserva;
TRUNCATE TABLE precios_habitaciones;
TRUNCATE TABLE detalles_habitacion;
TRUNCATE TABLE huespedes;
TRUNCATE TABLE facturas;
TRUNCATE TABLE reservas;
TRUNCATE TABLE fechas_cruceros;
TRUNCATE TABLE cruceros_complementos;
TRUNCATE TABLE cruceros;
TRUNCATE TABLE complementos;
TRUNCATE TABLE habitaciones;
TRUNCATE TABLE fotos_barco;
TRUNCATE TABLE barcos;
TRUNCATE TABLE itinerarios;
TRUNCATE TABLE puertos;
TRUNCATE TABLE destinos;
SET FOREIGN_KEY_CHECKS = 1;



INSERT INTO destinos (nombre, foto) VALUES
('América del Norte', 'america_norte.jpg'),
('América del Sur', 'america_sur.jpg'),
('Caribe', 'caribe.jpg'),
('Oceano', 'caribe.jpg');



INSERT INTO puertos (id_destino, nombre, pais, foto) VALUES
-- América del Norte
(1, 'Orlando (Puerto Cañaveral)', 'Estados Unidos', 'orlando.jpg'),
(1, 'Nassau', 'Bahamas', 'nassau.jpg'),
(1, 'Ocean Cay MSC Marine Reserve', 'Bahamas', 'ocean_cay.jpg'),
(1, 'Los Angeles', 'Estados Unidos', 'los_angeles.jpg'),
(1, 'Cabo San Lucas', 'México', 'cabo_san_lucas.jpg'),
(1, 'Mazatlan', 'México', 'mazatlan.jpg'),
(1, 'Puerto Vallarta', 'México', 'puerto_vallarta.jpg'),
(1, 'Catalina Island', 'Estados Unidos', 'catalina_island.jpg'),
(1, 'Ensenada', 'México', 'ensenada.jpg'),
(1, 'Victoria', 'Canadá', 'victoria.jpg'),
(1, 'Vancouver', 'Canadá', 'vancouver.jpg'),
-- América del Sur
(2, 'Buenos Aires', 'Argentina', 'buenos_aires.jpg'),
(2, 'Montevideo', 'Uruguay', 'montevideo.jpg'),
(2, 'Puerto Madryn', 'Argentina', 'puerto_madryn.jpg'),
(2, 'Port Stanley', 'Islas Malvinas', 'port_stanley.jpg'),
(2, 'Cape Horn (navegación)', 'Chile', 'cape_horn.jpg'),
(2, 'Ushuaia', 'Argentina', 'ushuaia.jpg'),
(2, 'Punta Arenas', 'Chile', 'punta_arenas.jpg'),
(2, 'Amalia Glaciar (navegación)', 'Chile', 'amalia_glaciar.jpg'),
(2, 'Puerto Montt', 'Chile', 'puerto_montt.jpg'),
(2, 'San Antonio', 'Chile', 'san_antonio.jpg'),
(2, 'Roca Leon Dormido', 'Ecuador', 'roca_leon.jpg'),
(2, 'San Cristóbal', 'Ecuador', 'san_cristobal.jpg'),
(2, 'Bartolome', 'Ecuador', 'bartolome.jpg'),
(2, 'Punta Espinoza, Fernandina', 'Ecuador', 'punta_espinoza.jpg'),
(2, 'Punta Vicente Roca, Isabela', 'Ecuador', 'punta_vicente.jpg'),
(2, 'Bahia Elizabeth, Isabela', 'Ecuador', 'bahia_elizabeth.jpg'),
(2, 'Caleta Tagus', 'Ecuador', 'caleta_tagus.jpg'),
(2, 'Punta Cormorant, Floreana', 'Ecuador', 'punta_cormorant.jpg'),
(2, 'Islote Campéon, Floreana', 'Ecuador', 'islote_campeon.jpg'),
(2, 'Bahia Post Office (Floreana Island)', 'Galápagos, Ecuador', 'bahia_post_office.jpg'),
(2, 'Estacion Darwin and Puerto Ayora, Santa Cruz', 'Ecuador', 'estacion_darwin.jpg'),
(2, 'Los Gemelos, Santa Cruz', 'Ecuador', 'los_gemelos.jpg'),
(2, 'Cerro Dragon, Santa Cruz', 'Ecuador', 'cerro_dragon.jpg'),
(2, 'São Paulo (Puerto de Santos)', 'Brasil', 'sao_paulo.jpg'),
(2, 'Camboriu', 'Brasil', 'camboriu.jpg'),
(2, 'Porto Belo', 'Brasil', 'porto_belo.jpg'),
(2, 'Abraao (Ilha Grande Island)', 'Brasil', 'abraao.jpg'),
(2, 'Buzios', 'Brasil', 'buzios.jpg'),
(2, 'Angra dos Reis', 'Brasil', 'angra_reis.jpg'),
-- Caribe
(3, 'Miami', 'Estados Unidos', 'miami.jpg'),
(3, 'Harvest Cay (Isla privada)', 'Belice', 'harvest_cay.jpg'),
(3, 'Isla de Roatán', 'Honduras', 'roatan.jpg'),
(3, 'Costa Maya Port (Majahual)', 'México', 'costa_maya.jpg'),
(3, 'Cozumel', 'México', 'cozumel.jpg'),
(3, 'Puerto Plata', 'República Dominicana', 'puerto_plata.jpg'),
(3, 'Charlotte Amalie, St Thomas', 'Islas Vírgenes de EE. UU.', 'charlotte_amalie.jpg'),
(3, 'Tortola', 'Islas Vírgenes Británicas', 'tortola.jpg'),
(3, 'Great Stirrup Cay (private beach)', 'Bahamas', 'great_stirrup.jpg'),
(3, 'Basseterre, St Kitts', 'San Cristóbal y Nieves', 'basseterre.jpg'),
(3, 'Cococay', 'Bahamas', 'cococay.jpg'),
(3, 'Ocean Cay MSC Marine Reserve', 'Bahamas', 'ocean_cay_caribe.jpg'),
(3, 'San Juan', 'Puerto Rico', 'san_juan.jpg'),
-- Oceano
(4, 'Navegando', 'Oceano', 'oceano.jpg');



INSERT INTO barcos (nombre, capacidad_pasajeros, capacidad_tripulantes, total_habitaciones, velocidad_maxima, tonelaje, altura, largo, ancho, año_construccion) VALUES
('Sunrise Voyager', 2500, 800, 1200, 22.50, 85000.00, 60.00, 300.00, 40.00, 2015),
('Ocean Dream', 3000, 900, 1500, 23.00, 90000.00, 65.00, 320.00, 42.00, 2018),
('Caribbean Star', 2000, 700, 1000, 21.00, 75000.00, 55.00, 280.00, 38.00, 2016),
('Pacific Explorer', 2800, 850, 1300, 22.00, 88000.00, 62.00, 310.00, 41.00, 2017),
('Atlantic Majesty', 2600, 820, 1250, 21.50, 87000.00, 61.00, 305.00, 40.50, 2019),
('Mediterranean Pearl', 2400, 780, 1100, 20.50, 82000.00, 58.00, 290.00, 39.00, 2014),
('Arctic Aurora', 2200, 750, 1050, 20.00, 80000.00, 57.00, 285.00, 38.50, 2013),
('Indian Ocean Queen', 2700, 830, 1280, 21.80, 86000.00, 60.50, 308.00, 40.20, 2020),
('Baltic Serenity', 2300, 770, 1150, 20.80, 83000.00, 59.00, 295.00, 39.50, 2015),
('Red Sea Jewel', 2900, 880, 1400, 22.20, 89000.00, 63.00, 315.00, 41.50, 2018),
('Black Sea Legend', 2100, 720, 1080, 20.30, 81000.00, 56.50, 288.00, 38.80, 2014),
('Arabian Nights', 3100, 920, 1600, 23.50, 92000.00, 66.00, 325.00, 43.00, 2021),
('Coral Princess', 2500, 800, 1200, 22.00, 85000.00, 60.00, 300.00, 40.00, 2016),
('Golden Horizon', 2400, 790, 1180, 21.20, 84000.00, 59.50, 298.00, 39.80, 2017),
('Sapphire Seas', 2600, 810, 1230, 21.70, 85500.00, 60.20, 302.00, 40.10, 2018);



INSERT INTO habitaciones (id_barco, categoria, nombre, descripcion, capacidad_min, capacidad_max, tamaño, cantidad_Disponibles) VALUES
-- Barco 1 (Sunrise Voyager)
(1, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(1, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(1, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(1, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 2 (Ocean Dream)
(2, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 12),
(2, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 10),
(2, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 8),
(2, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 6),
-- Barco 3 (Caribbean Star)
(3, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 15),
(3, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 12),
(3, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 10),
(3, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 8),
-- Barco 4 (Pacific Explorer)
(4, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(4, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(4, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(4, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 5 (Atlantic Majesty)
(5, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(5, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(5, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(5, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 6 (Mediterranean Pearl)
(6, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(6, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(6, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(6, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 7 (Arctic Aurora)
(7, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(7, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(7, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(7, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 8 (Indian Ocean Queen)
(8, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(8, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(8, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(8, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 9 (Baltic Serenity)
(9, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(9, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(9, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(9, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 10 (Red Sea Jewel)
(10, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(10, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(10, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(10, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 11 (Black Sea Legend)
(11, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(11, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(11, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(11, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 12 (Arabian Nights)
(12, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(12, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(12, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(12, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 13 (Coral Princess)
(13, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(13, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(13, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(13, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 14 (Golden Horizon)
(14, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(14, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(14, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(14, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4),
-- Barco 15 (Sapphire Seas)
(15, 'Interior', 'Habitación Interior', 'Habitación cómoda y económica.', 1, 2, 18.00, 10),
(15, 'Vista al mar', 'Habitación Vista al Mar', 'Habitación con vistas al océano.', 1, 2, 22.00, 8),
(15, 'Balcón', 'Habitación con Balcón', 'Habitación con balcón privado.', 2, 4, 25.00, 6),
(15, 'Suite', 'Suite de Lujo', 'Suite espaciosa con jacuzzi.', 2, 4, 45.00, 4);



INSERT INTO detalles_habitacion (id_habitacion, descripcion_larga, metros_cuadrados, cantidad_camas, tipo_cama, amenidades, capacidad_maxima, vista_mar, balcon, created_at, updated_at) VALUES
-- Habitaciones del barco 1 (Sunrise Voyager)
(1, 'Habitación interior cómoda y acogedora, ideal para viajeros que buscan comodidad a un precio accesible.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
(2, 'Habitación con vista al mar y decoración moderna, perfecta para disfrutar de las vistas del océano.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(3, 'Suite de lujo con amplio espacio y vistas panorámicas al mar, incluye jacuzzi privado.', 45.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón"]', 4, 1, 1, NOW(), NOW()),
(4, 'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.', 30.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 4, 0, 0, NOW(), NOW()),
-- Habitaciones del barco 2 (Ocean Dream)
(5, 'Habitación interior económica, perfecta para viajeros solitarios o parejas que buscan ahorrar.', 15.00, 1, 'Individual', '["TV", "Aire acondicionado"]', 1, 0, 0, NOW(), NOW()),
(6, 'Habitación con balcón privado y vistas al océano, decoración elegante y moderna.', 25.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(7, 'Suite presidencial con servicios exclusivos, incluye acceso a áreas VIP del barco.', 60.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón", "Servicio de habitaciones"]', 2, 1, 1, NOW(), NOW()),
(8, 'Habitación con vista al mar y decoración clásica, ideal para una estancia relajante.', 20.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
-- Habitaciones del barco 3 (Caribbean Star)
(9, 'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
(10, 'Habitación con balcón y vistas al mar, decoración tropical que evoca el espíritu del Caribe.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(11, 'Suite familiar con espacio amplio y comodidades adicionales, ideal para familias grandes.', 35.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón"]', 4, 1, 1, NOW(), NOW()),
(12, 'Habitación interior económica, perfecta para viajeros que buscan una opción sencilla y funcional.', 15.00, 1, 'Individual', '["TV", "Aire acondicionado"]', 1, 0, 0, NOW(), NOW()),
-- Habitaciones del barco 4 (Pacific Explorer)
(13, 'Habitación con vista al mar y decoración moderna, perfecta para disfrutar del paisaje oceánico.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(14, 'Suite de lujo con amplio espacio y comodidades exclusivas, incluye jacuzzi privado.', 50.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón", "Servicio de habitaciones"]', 2, 1, 1, NOW(), NOW()),
(15, 'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.', 30.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 4, 0, 0, NOW(), NOW()),
(16, 'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
-- Habitaciones del barco 5 (Atlantic Majesty)
(17, 'Habitación interior cómoda y económica, ideal para viajeros que buscan comodidad a un precio accesible.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
(18, 'Habitación con vista al mar y decoración moderna, perfecta para disfrutar de las vistas del océano.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(19, 'Suite de lujo con amplio espacio y vistas panorámicas al mar, incluye jacuzzi privado.', 45.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón"]', 4, 1, 1, NOW(), NOW()),
(20, 'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.', 30.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 4, 0, 0, NOW(), NOW()),
-- Habitaciones del barco 6 (Mediterranean Pearl)
(21, 'Habitación interior económica, perfecta para viajeros solitarios o parejas que buscan ahorrar.', 15.00, 1, 'Individual', '["TV", "Aire acondicionado"]', 1, 0, 0, NOW(), NOW()),
(22, 'Habitación con balcón privado y vistas al océano, decoración elegante y moderna.', 25.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(23, 'Suite presidencial con servicios exclusivos, incluye acceso a áreas VIP del barco.', 60.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón", "Servicio de habitaciones"]', 2, 1, 1, NOW(), NOW()),
(24, 'Habitación con vista al mar y decoración clásica, ideal para una estancia relajante.', 20.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
-- Habitaciones del barco 7 (Arctic Aurora)
(25, 'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
(26, 'Habitación con balcón y vistas al mar, decoración tropical que evoca el espíritu del Caribe.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(27, 'Suite familiar con espacio amplio y comodidades adicionales, ideal para familias grandes.', 35.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón"]', 4, 1, 1, NOW(), NOW()),
(28, 'Habitación interior económica, perfecta para viajeros que buscan una opción sencilla y funcional.', 15.00, 1, 'Individual', '["TV", "Aire acondicionado"]', 1, 0, 0, NOW(), NOW()),
-- Habitaciones del barco 8 (Indian Ocean Queen)
(29, 'Habitación con vista al mar y decoración moderna, perfecta para disfrutar del paisaje oceánico.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(30, 'Suite de lujo con amplio espacio y comodidades exclusivas, incluye jacuzzi privado.', 50.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón", "Servicio de habitaciones"]', 2, 1, 1, NOW(), NOW()),
(31, 'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.', 30.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 4, 0, 0, NOW(), NOW()),
(32, 'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
-- Habitaciones del barco 9 (Baltic Serenity)
(33, 'Habitación interior cómoda y económica, ideal para viajeros que buscan comodidad a un precio accesible.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
(34, 'Habitación con vista al mar y decoración moderna, perfecta para disfrutar de las vistas del océano.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(35, 'Suite de lujo con amplio espacio y vistas panorámicas al mar, incluye jacuzzi privado.', 45.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón"]', 4, 1, 1, NOW(), NOW()),
(36, 'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.', 30.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 4, 0, 0, NOW(), NOW()),
-- Habitaciones del barco 10 (Red Sea Jewel)
(37, 'Habitación interior económica, perfecta para viajeros solitarios o parejas que buscan ahorrar.', 15.00, 1, 'Individual', '["TV", "Aire acondicionado"]', 1, 0, 0, NOW(), NOW()),
(38, 'Habitación con balcón privado y vistas al océano, decoración elegante y moderna.', 25.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(39, 'Suite presidencial con servicios exclusivos, incluye acceso a áreas VIP del barco.', 60.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón", "Servicio de habitaciones"]', 2, 1, 1, NOW(), NOW()),
(40, 'Habitación con vista al mar y decoración clásica, ideal para una estancia relajante.', 20.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
-- Habitaciones del barco 11 (Black Sea Legend)
(41, 'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
(42, 'Habitación con balcón y vistas al mar, decoración tropical que evoca el espíritu del Caribe.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(43, 'Suite familiar con espacio amplio y comodidades adicionales, ideal para familias grandes.', 35.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón"]', 4, 1, 1, NOW(), NOW()),
(44, 'Habitación interior económica, perfecta para viajeros que buscan una opción sencilla y funcional.', 15.00, 1, 'Individual', '["TV", "Aire acondicionado"]', 1, 0, 0, NOW(), NOW()),
-- Habitaciones del barco 12 (Arabian Nights)
(45, 'Habitación con vista al mar y decoración moderna, perfecta para disfrutar del paisaje oceánico.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(46, 'Suite de lujo con amplio espacio y comodidades exclusivas, incluye jacuzzi privado.', 50.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón", "Servicio de habitaciones"]', 2, 1, 1, NOW(), NOW()),
(47, 'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.', 30.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 4, 0, 0, NOW(), NOW()),
(48, 'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
-- Habitaciones del barco 13 (Coral Princess)
(49, 'Habitación con vista al mar y decoración moderna, perfecta para disfrutar del paisaje oceánico.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(50, 'Suite de lujo con amplio espacio y comodidades exclusivas, incluye jacuzzi privado.', 50.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón", "Servicio de habitaciones"]', 2, 1, 1, NOW(), NOW()),
(51, 'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.', 30.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 4, 0, 0, NOW(), NOW()),
(52, 'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
-- Habitaciones del barco 14 (Golden Horizon)
(53, 'Habitación interior económica, perfecta para viajeros solitarios o parejas que buscan ahorrar.', 15.00, 1, 'Individual', '["TV", "Aire acondicionado"]', 1, 0, 0, NOW(), NOW()),
(54, 'Habitación con balcón privado y vistas al océano, decoración elegante y moderna.', 25.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(55, 'Suite presidencial con servicios exclusivos, incluye acceso a áreas VIP del barco.', 60.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón", "Servicio de habitaciones"]', 2, 1, 1, NOW(), NOW()),
(56, 'Habitación con vista al mar y decoración clásica, ideal para una estancia relajante.', 20.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
-- Habitaciones del barco 15 (Sapphire Seas)
(57, 'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.', 18.00, 2, 'Queen Size', '["TV", "Minibar", "Aire acondicionado"]', 2, 0, 0, NOW(), NOW()),
(58, 'Habitación con balcón y vistas al mar, decoración tropical que evoca el espíritu del Caribe.', 22.00, 2, 'King Size', '["TV", "Minibar", "Aire acondicionado", "Balcón"]', 2, 1, 1, NOW(), NOW()),
(59, 'Suite familiar con espacio amplio y comodidades adicionales, ideal para familias grandes.', 35.00, 4, '2 Queen Size', '["TV", "Minibar", "Aire acondicionado", "Jacuzzi", "Balcón"]', 4, 1, 1, NOW(), NOW()),
(60, 'Habitación interior económica, perfecta para viajeros que buscan una opción sencilla y funcional.', 15.00, 1, 'Individual', '["TV", "Aire acondicionado"]', 1, 0, 0, NOW(), NOW());



INSERT INTO complementos (nombre, descripcion, precio, aplicado_por) VALUES
('Wi-Fi Premium', 'Acceso a internet de alta velocidad durante todo el viaje.', 50.00, 'huésped'),
('Paquete de bebidas ilimitadas', 'Bebidas alcohólicas y no alcohólicas ilimitadas.', 200.00, 'huésped'),
('Excursión en tierra', 'Tour guiado en uno de los puertos de escala.', 100.00, 'huésped'),
('Spa completo', 'Acceso ilimitado al spa y tratamientos relajantes.', 150.00, 'huésped'),
('Cena gourmet', 'Cena de 5 platos en el restaurante exclusivo del barco.', 80.00, 'huésped'),
('Servicio de lavandería', 'Lavado y planchado de ropa durante el viaje.', 30.00, 'camarote'),
('Decoración especial', 'Decoración temática para celebraciones en el camarote.', 50.00, 'camarote'),
('Paquete fotográfico', 'Sesión fotográfica profesional y álbum de recuerdo.', 120.00, 'huésped'),
('Clases de cocina', 'Clases exclusivas con el chef del barco.', 70.00, 'huésped'),
('Tour VIP', 'Acceso exclusivo a áreas restringidas del barco.', 90.00, 'huésped'),
('Seguro de viaje', 'Cobertura médica y de cancelación durante el viaje.', 60.00, 'huésped'),
('Alquiler de toallas', 'Toallas exclusivas para uso en piscinas y playas.', 20.00, 'huésped'),
('Paquete romántico', 'Champán, fresas y decoración romántica en el camarote.', 100.00, 'camarote'),
('Clases de buceo', 'Curso básico de buceo con instructores certificados.', 150.00, 'huésped'),
('Tour cultural', 'Visita guiada a museos y sitios históricos en puertos.', 75.00, 'huésped');



INSERT INTO cruceros (nombre, foto, cantidad_dias, id_barco, id_destino) VALUES
('Caribe Dream', 'caribe_dream.jpg', 5, 1, 3),
('South America Explorer', 'south_america_explorer.jpg', 3, 2, 2),
('North Atlantic Adventure', 'north_atlantic.jpg', 5, 3, 1),
('Pacific Paradise', 'pacific_paradise.jpg', 3, 4, 1),
('Mediterranean Escape', 'mediterranean_escape.jpg', 3, 5, 3);
/*('Arctic Expedition', 'arctic_expedition.jpg', 12, 6, 2),
('Indian Ocean Voyage', 'indian_ocean.jpg', 14, 7, 3),
('Baltic Discovery', 'baltic_discovery.jpg', 10, 8, 1),
('Red Sea Magic', 'red_sea_magic.jpg', 7, 9, 3),
('Black Sea Explorer', 'black_sea.jpg', 8, 10, 2),
('Arabian Nights Cruise', 'arabian_nights.jpg', 9, 11, 3),
('Coral Islands Tour', 'coral_islands.jpg', 7, 12, 1),
('Golden Horizon Journey', 'golden_horizon.jpg', 10, 13, 2),
('Sapphire Seas Adventure', 'sapphire_seas.jpg', 8, 14, 3),
('Tropical Getaway', 'tropical_getaway.jpg', 7, 15, 1);*/



INSERT INTO itinerarios (id_crucero, dia, id_puerto, descripcion, hora_llegada, hora_salida) VALUES
(1, 1, 1, 'Salida de Orlando (Puerto Cañaveral).', null, 12),
(1, 2, 54, 'Navegando', null, null),
(1, 3, 3, 'Día en Ocean Cay MSC Marine Reserve.', 7, 20),
(1, 4, 54, 'Navegando', null, null),
(1, 5, 1, 'Regreso a Orlando (Puerto cañaveral)', 12, null),
(2, 1, 13, 'Salida de Buenos Aires, Argentina.', null, 8),
(2, 2, 14, 'Visita a Montevideo, Uruguay.', 6, 22),
(2, 3, 15, 'Regreso de Buenos Aires, Argentina', 16, null),
(3, 1, 4, 'Salida de Los Angeles, Estados Unidos.', null, 12),
(3, 2, 5, 'Visita a Cabo San Lucas, México.', 9, 17),
(3, 3, 6, 'Día en Mazatlán, México.', 10, 16),
(3, 4, 5, 'Navegando', null, null),
(3, 5, 6, 'Regreso a Los Angeles, Estados Unidos.', 10, null),
(4, 1, 7, 'Llegada a Puerto Vallarta, México.', 8, 18),
(4, 2, 8, 'Visita a Catalina Island, Estados Unidos.', 9, 17),
(4, 3, 9, 'Día en Ensenada, México.', 10, 16),
(5, 1, 10, 'Llegada a Victoria, Canadá.', 8, 18),
(5, 2, 11, 'Visita a Vancouver, Canadá.', 9, 17),
(5, 3, 12, 'Día en San Cristóbal, Ecuador.', 10, 16);



INSERT INTO cruceros_complementos (id_crucero, id_complemento) VALUES
(1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (3, 6), (3, 7), (4, 8), (4, 9), (5, 10),
(5, 11); /*(6, 12), (6, 13), (7, 14), (7, 15), (8, 1), (8, 2), (9, 3), (9, 4), (10, 5),
(10, 6), (11, 7), (11, 8), (12, 9), (12, 10), (13, 11), (13, 12), (14, 13), (14, 14), (15, 15);*/



INSERT INTO fechas_cruceros (id_crucero, fecha_inicio, fecha_limite_pago) VALUES
(1, '2025-02-01', '2025-01-25'),
(1, '2025-03-20', '2025-03-10'),
(1, '2025-04-10', '2025-04-01'),
(1, '2025-04-25', '2025-04-18'),
(1, '2025-05-15', '2025-05-08'),
(2, '2025-02-05', '2025-01-27'),
(2, '2025-02-20', '2025-02-12'),
(2, '2025-03-10', '2025-03-01'),
(2, '2025-03-28', '2025-03-20'),
(2, '2025-04-12', '2025-04-03'),
(3, '2025-04-14', '2025-04-04'),
(3, '2025-04-29', '2025-04-20'),
(3, '2025-05-18', '2025-05-10'),
(4, '2025-04-15', '2025-04-05'),
(4, '2025-05-01', '2025-04-22'),
(4, '2025-05-22', '2025-05-14'),
(5, '2025-04-15', '2025-04-05'),
(5, '2025-04-28', '2025-04-20'),
(5, '2025-05-10', '2025-05-01');



INSERT INTO precios_habitaciones (id_fecha, id_habitacion, precio) VALUES
-- Fechas del crucero 1 (Sunrise Voyager)
(1, 1, 500.00),  -- Habitación 1
(1, 2, 700.00),  -- Habitación 2
(1, 3, 900.00),  -- Habitación 3
(1, 4, 1200.00), -- Habitación 4
-- Fechas del crucero 2 (Ocean Dream)
(2, 5, 550.00),  -- Habitación 5
(2, 6, 750.00),  -- Habitación 6
(2, 7, 950.00),  -- Habitación 7
(2, 8, 1250.00), -- Habitación 8
-- Fechas del crucero 3 (Caribbean Star)
(3, 9, 600.00),  -- Habitación 9
(3, 10, 800.00), -- Habitación 10
(3, 11, 1000.00),-- Habitación 11
(3, 12, 1300.00),-- Habitación 12
-- Fechas del crucero 4 (Pacific Explorer)
(4, 13, 650.00), -- Habitación 13
(4, 14, 850.00), -- Habitación 14
(4, 15, 1050.00),-- Habitación 15
(4, 16, 1350.00),-- Habitación 16
-- Fechas del crucero 5 (Atlantic Majesty)
(5, 17, 700.00), -- Habitación 17
(5, 18, 900.00), -- Habitación 18
(5, 19, 1100.00),-- Habitación 19
(5, 20, 1400.00);-- Habitación 20



INSERT INTO reservas (id_usuario, id_crucero, id_fecha, cantidad_huespedes, estado, fecha_reserva) VALUES
(4, 1, 1, 2, 'pagada', '2023-09-01'),
(6, 2, 2, 2, 'pendiente', '2023-09-02'),
(8, 3, 3, 2, 'pagada', '2023-09-03'),
(9, 4, 4, 2, 'cancelada', '2023-09-04'),
(10, 5, 5, 2, 'pagada', '2023-09-05'),
(11, 1, 6, 2, 'pendiente', '2023-09-06'),
(12, 2, 7, 2, 'pagada', '2023-09-07'),
(13, 3, 8, 2, 'cancelada', '2023-09-08'),
(14, 4, 9, 2, 'pagada', '2023-09-09'),
(15, 5, 10, 2, 'pendiente', '2023-09-10'),
(16, 1, 11, 2, 'pagada', '2023-09-11'),
(17, 2, 12, 2, 'cancelada', '2023-09-12'),
(18, 3, 13, 2, 'pagada', '2023-09-13'),
(19, 4, 14, 2, 'pendiente', '2023-09-14'),
(20, 5, 15, 2, 'pagada', '2023-09-15');



INSERT INTO detalles_reserva (id_reserva, id_complemento, id_habitacion, cantidad, subtotal) VALUES
-- Reserva 1
(1, 1, 1, 1, 50.00),  -- Wi-Fi Premium para habitación 1
(1, 2, 1, 1, 200.00), -- Paquete de bebidas ilimitadas para habitación 1
-- Reserva 2
(2, 3, 2, 1, 100.00), -- Excursión en tierra para habitación 2
(2, 4, 2, 1, 150.00), -- Spa completo para habitación 2
-- Reserva 3
(3, 5, 3, 1, 80.00),  -- Cena gourmet para habitación 3
(3, 6, 3, 1, 30.00),  -- Servicio de lavandería para habitación 3
-- Reserva 4
(4, 7, 4, 1, 50.00),  -- Decoración especial para habitación 4
(4, 8, 4, 1, 120.00), -- Paquete fotográfico para habitación 4
-- Reserva 5
(5, 9, 5, 1, 70.00),  -- Clases de cocina para habitación 5
(5, 10, 5, 1, 90.00), -- Tour VIP para habitación 5
-- Reserva 6
(6, 11, 6, 1, 60.00), -- Seguro de viaje para habitación 6
(6, 12, 6, 1, 20.00), -- Alquiler de toallas para habitación 6
-- Reserva 7
(7, 13, 7, 1, 100.00), -- Paquete romántico para habitación 7
(7, 14, 7, 1, 150.00), -- Clases de buceo para habitación 7
-- Reserva 8
(8, 15, 8, 1, 75.00),  -- Tour cultural para habitación 8
-- Reserva 9
(9, 1, 9, 1, 50.00),  -- Wi-Fi Premium para habitación 9
(9, 2, 9, 1, 200.00), -- Paquete de bebidas ilimitadas para habitación 9
-- Reserva 10
(10, 3, 10, 1, 100.00), -- Excursión en tierra para habitación 10
(10, 4, 10, 1, 150.00), -- Spa completo para habitación 10
-- Reserva 11
(11, 5, 11, 1, 80.00),  -- Cena gourmet para habitación 11
(11, 6, 11, 1, 30.00),  -- Servicio de lavandería para habitación 11
-- Reserva 12
(12, 7, 12, 1, 50.00),  -- Decoración especial para habitación 12
(12, 8, 12, 1, 120.00), -- Paquete fotográfico para habitación 12
-- Reserva 13
(13, 9, 13, 1, 70.00),  -- Clases de cocina para habitación 13
(13, 10, 13, 1, 90.00), -- Tour VIP para habitación 13
-- Reserva 14
(14, 11, 14, 1, 60.00), -- Seguro de viaje para habitación 14
(14, 12, 14, 1, 20.00), -- Alquiler de toallas para habitación 14
-- Reserva 15
(15, 13, 15, 1, 100.00), -- Paquete romántico para habitación 15
(15, 14, 15, 1, 150.00); -- Clases de buceo para habitación 15



INSERT INTO huespedes (Id_reserva, nombre_completo, genero, edad, fecha_nacimiento, nacionalidad) VALUES
(1, 'Juan Pérez', 'Masculino', 35, '1988-05-15', 'Costa Rica'),
(1, 'María González', 'Femenino', 32, '1991-02-10', 'España'),
(2, 'Carlos López', 'Masculino', 40, '1983-07-18', 'México'),
(2, 'Ana Martínez', 'Femenino', 38, '1985-06-25', 'Argentina'),
(3, 'Pedro Ramírez', 'Masculino', 45, '1978-12-05', 'Colombia'),
(3, 'Sofía Herrera', 'Femenino', 42, '1981-04-10', 'Chile'),
(4, 'Luis Torres', 'Masculino', 50, '1973-08-22', 'Perú'),
(4, 'Laura Díaz', 'Femenino', 48, '1975-11-30', 'Ecuador'),
(5, 'Jorge Morales', 'Masculino', 55, '1968-03-12', 'Venezuela'),
(5, 'Carmen Ruiz', 'Femenino', 52, '1971-09-20', 'Uruguay'),
(6, 'Miguel Ángel Castro', 'Masculino', 60, '1963-01-05', 'Paraguay'),
(6, 'Isabel Mendoza', 'Femenino', 58, '1965-07-15', 'Bolivia'),
(7, 'Fernando Gómez', 'Masculino', 65, '1958-10-25', 'Panamá'),
(7, 'Patricia Silva', 'Femenino', 62, '1961-04-30', 'El Salvador'),
(8, 'Ricardo Rojas', 'Masculino', 70, '1953-12-20', 'Honduras');



INSERT INTO facturas (id_reserva, subtotal, impuestos, tarifas, total, metodo_pago, fecha_pago) VALUES
(1, 250.00, 25.00, 10.00, 285.00, 'pago_unico', '2023-10-01'),
(2, 250.00, 25.00, 10.00, 285.00, 'dos_pagos', '2023-10-02'),
(3, 110.00, 11.00, 5.00, 126.00, 'pago_unico', '2023-10-03'),
(4, 170.00, 17.00, 8.00, 195.00, 'dos_pagos', '2023-10-04'),
(5, 160.00, 16.00, 7.00, 183.00, 'pago_unico', '2023-10-05'),
(6, 80.00, 8.00, 3.00, 91.00, 'dos_pagos', '2023-10-06'),
(7, 250.00, 25.00, 10.00, 285.00, 'pago_unico', '2023-10-07'),
(8, 75.00, 7.50, 3.00, 85.50, 'dos_pagos', '2023-10-08'),
(9, 200.00, 20.00, 8.00, 228.00, 'pago_unico', '2023-10-09'),
(10, 150.00, 15.00, 6.00, 171.00, 'dos_pagos', '2023-10-10'),
(11, 120.00, 12.00, 5.00, 137.00, 'pago_unico', '2023-10-11'),
(12, 90.00, 9.00, 4.00, 103.00, 'dos_pagos', '2023-10-12'),
(13, 70.00, 7.00, 3.00, 80.00, 'pago_unico', '2023-10-13'),
(14, 60.00, 6.00, 2.00, 68.00, 'dos_pagos', '2023-10-14'),
(15, 100.00, 10.00, 4.00, 114.00, 'pago_unico', '2023-10-15');

