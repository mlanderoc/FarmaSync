
INSERT INTO PERSONA (id_persona, nombre, correo, telefono) VALUES
  (1,  'Laura Gómez',     'laura.gomez@drogueria.com',  '3001112233'),
  (2,  'Carlos Pérez',    'carlos.perez@drogueria.com', '3002223344'),
  (3,  'Marta Ruiz',      'marta.ruiz@drogueria.com',   '3003334455'),
  (4,  'Andrés Torres',   'andres.torres@drogueria.com','3004445566'),
  (5,  'Sofía Díaz',      'sofia.diaz@drogueria.com',   '3005556677'),
  (6,  'Juan Castro',     'juan.castro@correo.com',     '3101112233'),
  (7,  'Paula Mejía',     'paula.mejia@correo.com',     '3102223344'),
  (8,  'Diego Rojas',     'diego.rojas@correo.com',     '3103334455'),
  (9,  'Valentina Cruz',  'valentina.cruz@correo.com',  '3104445566'),
  (10, 'Camilo Núñez',    'camilo.nunez@correo.com',    '3105556677');

INSERT INTO EMPLEADO (id_persona, cargo) VALUES
  (1, 'Regente de farmacia'),
  (2, 'Auxiliar de farmacia'),
  (3, 'Cajero'),
  (4, 'Auxiliar de bodega'),
  (5, 'Administrador');

INSERT INTO CLIENTE (id_persona) VALUES (6), (7), (8), (9), (10);

-- Proveedores 
INSERT INTO PROVEEDOR (nit, nombre, direccion, correo, telefono) VALUES
  ('900123456-1', 'Droguería Mayorista S.A.S.',  'Calle 10 # 20-30, Bogotá',   'ventas@mayorista.com',   '6011234567'),
  ('900234567-2', 'Laboratorios Andinos',        'Carrera 50 # 8-15, Medellín','pedidos@andinos.com',    '6042345678'),
  ('900345678-3', 'Insumos Médicos del Sur',     'Avenida 6 # 14-22, Cali',    'contacto@insumossur.com','6023456789'),
  ('900456789-4', 'Distribuciones Salud Total',  'Calle 72 # 10-05, Bogotá',   'info@saludtotal.com',    '6014567890'),
  ('900567890-5', 'Farma Express',               'Carrera 15 # 17-21, Bogotá', 'hola@farmaexpress.com',  '6015678901');

-- Productos 
INSERT INTO PRODUCTO (referencia, nombre_comercial, precio, presentacion) VALUES
  -- medicamentos controlados
  ('MED-C01', 'Tramadol 50 mg',          18500.00, 'Caja x 20 cápsulas'),
  ('MED-C02', 'Alprazolam 0.5 mg',       15200.00, 'Caja x 30 tabletas'),
  ('MED-C03', 'Clonazepam 2 mg',         21000.00, 'Caja x 30 tabletas'),
  ('MED-C04', 'Morfina 10 mg/ml',        32000.00, 'Ampolla x 1 ml'),
  ('MED-C05', 'Zolpidem 10 mg',          24500.00, 'Caja x 10 tabletas'),
  -- medicamentos de venta libre
  ('MED-L01', 'Acetaminofén 500 mg',      8500.00, 'Caja x 100 tabletas'),
  ('MED-L02', 'Ibuprofeno 400 mg',        9800.00, 'Caja x 50 tabletas'),
  ('MED-L03', 'Loratadina 10 mg',         6400.00, 'Caja x 20 tabletas'),
  ('MED-L04', 'Omeprazol 20 mg',         11200.00, 'Caja x 28 cápsulas'),
  ('MED-L05', 'Suero oral sabor frutas',  4200.00, 'Sobre x 1'),
  -- insumos médicos
  ('INS-01',  'Jeringa 5 ml',              900.00, 'Unidad'),
  ('INS-02',  'Guantes de nitrilo',      24000.00, 'Caja x 100'),
  ('INS-03',  'Gasa estéril 10x10',       7500.00, 'Paquete x 10'),
  ('INS-04',  'Tapabocas quirúrgico',    12000.00, 'Caja x 50'),
  ('INS-05',  'Termómetro digital',      18000.00, 'Unidad');

INSERT INTO MEDICAMENTO (referencia_producto, principio_activo) VALUES
  ('MED-C01', 'Tramadol'),
  ('MED-C02', 'Alprazolam'),
  ('MED-C03', 'Clonazepam'),
  ('MED-C04', 'Morfina'),
  ('MED-C05', 'Zolpidem'),
  ('MED-L01', 'Acetaminofén'),
  ('MED-L02', 'Ibuprofeno'),
  ('MED-L03', 'Loratadina'),
  ('MED-L04', 'Omeprazol'),
  ('MED-L05', 'Sales de rehidratación oral');

INSERT INTO INSUMO_MEDICO (referencia_producto, material) VALUES
  ('INS-01', 'Polipropileno'),
  ('INS-02', 'Nitrilo'),
  ('INS-03', 'Algodón'),
  ('INS-04', 'Tela no tejida'),
  ('INS-05', 'Plástico y electrónica');

INSERT INTO MEDICAMENTO_CONTROLADO (referencia_medicamento, dosis_max) VALUES
  ('MED-C01', '400 mg/día'),
  ('MED-C02', '4 mg/día'),
  ('MED-C03', '20 mg/día'),
  ('MED-C04', '120 mg/día'),
  ('MED-C05', '10 mg/día');

INSERT INTO MEDICAMENTO_LIBRE (referencia_medicamento, contraindicaciones) VALUES
  ('MED-L01', 'Enfermedad hepática grave'),
  ('MED-L02', 'Úlcera gástrica; embarazo en el tercer trimestre'),
  ('MED-L03', 'Hipersensibilidad al principio activo'),
  ('MED-L04', 'Uso simultáneo con nelfinavir'),
  ('MED-L05', 'Obstrucción intestinal');

-- Pedidos a proveedores 
INSERT INTO PEDIDO (id_pedido, estado, nit_proveedor, id_empleado) VALUES
  (1, 'Recibido',  '900123456-1', 4),
  (2, 'Recibido',  '900234567-2', 4),
  (3, 'Recibido',  '900345678-3', 5),
  (4, 'Pendiente', '900456789-4', 5),
  (5, 'Cancelado', '900123456-1', 4);

INSERT INTO DETALLE_PEDIDO (id_pedido, referencia_producto) VALUES
  (1, 'MED-L01'), (1, 'MED-L02'), (1, 'MED-L03'),
  (2, 'MED-C01'), (2, 'MED-C02'), (2, 'MED-C03'),
  (3, 'INS-01'),  (3, 'INS-02'),  (3, 'INS-03'),
  (4, 'MED-L04'),
  (5, 'MED-C04');

-- Lotes 
INSERT INTO LOTE (id_lote, codigo_lote, cantidad_disponible, fecha_vencimiento,
                  nit_proveedor, referencia_producto, id_empleado) VALUES
  (1, 'L-2026-001', 200, '2027-06-30', '900123456-1', 'MED-L01', 4),
  (2, 'L-2026-002', 150, '2027-03-15', '900123456-1', 'MED-L02', 4),
  (3, 'L-2026-003', 120, '2027-09-01', '900123456-1', 'MED-L03', 4),
  (4, 'L-2026-004',  60, '2027-01-20', '900234567-2', 'MED-C01', 4),
  (5, 'L-2026-005',  80, '2027-02-28', '900234567-2', 'MED-C02', 4),
  (6, 'L-2026-006',  40, '2026-12-31', '900234567-2', 'MED-C03', 4),
  (7, 'L-2026-007', 500, '2028-01-01', '900345678-3', 'INS-01',  5),
  (8, 'L-2026-008', 100, '2027-11-30', '900345678-3', 'INS-02',  5);

-- Recetas médicas 
INSERT INTO RECETA_MEDICA (id_receta_medica, registro_medico, eps) VALUES
  (1, 'RM-10001', 'Sanitas'),
  (2, 'RM-10002', 'Sura'),
  (3, 'RM-10003', 'Nueva EPS'),
  (4, 'RM-10004', 'Compensar'),
  (5, 'RM-10005', 'Salud Total');

-- Ventas 
-- valor_total = suma de cantidad * precio_unitario de sus detalles
INSERT INTO VENTA (id_venta, valor_total, id_empleado, id_cliente) VALUES
  (1, 26800.00, 3, 6),   
  (2, 18500.00, 3, 6),   
  (3, 38300.00, 3, 7),   
  (4, 30400.00, 2, 8),   
  (5,  8500.00, 3, 9);   

INSERT INTO DETALLE_VENTA (id_venta, id_lote, cantidad, precio_unitario, id_receta) VALUES
  (1, 1, 2,  8500.00, NULL),
  (1, 2, 1,  9800.00, NULL),
  (2, 4, 1, 18500.00, 1),
  (3, 1, 3,  8500.00, NULL),
  (3, 3, 2,  6400.00, NULL),
  (4, 5, 2, 15200.00, 2),
  (5, 1, 1,  8500.00, NULL);

-- Pérdidas 
-- valor_perdido = cantidad_perdida * precio del producto
INSERT INTO PERDIDA (id_perdida, valor_perdido, cantidad_perdida, accion, id_lote, id_empleado) VALUES
  (1, 17000.00, 2, 'Destrucción por empaque dañado', 1, 4),
  (2, 19600.00, 2, 'Devolución al proveedor',        2, 4),
  (3, 21000.00, 1, 'Destrucción por rotura',         6, 5),
  (4,  1800.00, 2, 'Destrucción por empaque dañado', 7, 5),
  (5, 48000.00, 2, 'Devolución al proveedor',        8, 4);



