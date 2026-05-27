INSERT INTO orden_despacho (
    id_despacho, 
    id_orden_compra, 
    direccion_entrega, 
    fecha_despacho, 
    patente_camion, 
    entregado, 
    intentos_entrega
) VALUES 
(1, 1001, 'Av. Nueva Providencia 1881, Santiago', '2026-05-25', 'HH-LL-44', 'SÍ', 1),
(2, 1002, 'Calle Los Alerces 432, Concepción', '2026-05-26', 'FT-XW-88', 'NO', 2),
(3, 1003, 'Pasaje El Sol 990, Viña del Mar', '2026-05-27', 'KB-PC-12', 'SÍ', 1);