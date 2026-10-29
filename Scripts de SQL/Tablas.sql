-- CREACIÓN DE TABLAS
--
-- Se definieron columnas, tipos, NOT NULL
-- Las restricciones UNIQUE, CHECK, PRIMARY KEY y FOREIGN KEY se agregan en
-- Restricciones.sql con ALTER TABLE y se ejecuta despues de este script.


--  Personas 
CREATE TABLE PERSONA (
  id_persona integer,
  nombre varchar(100) NOT NULL,
  correo varchar(120),
  telefono varchar(20)
);

CREATE TABLE EMPLEADO (
  id_persona integer,
  cargo varchar(50) NOT NULL
);

CREATE TABLE CLIENTE (
  id_persona integer
);

--  Proveedores 
CREATE TABLE PROVEEDOR (
  nit varchar(20),
  nombre varchar(100) NOT NULL,
  direccion varchar(150),
  correo varchar(120),
  telefono varchar(20)
);

--  Productos y sus especializaciones 
CREATE TABLE PRODUCTO (
  referencia varchar(30),
  nombre_comercial varchar(100) NOT NULL,
  precio numeric(12,2) NOT NULL,
  presentacion varchar(60)
);

CREATE TABLE MEDICAMENTO (
  referencia_producto varchar(30),
  principio_activo varchar(100) NOT NULL
);

CREATE TABLE INSUMO_MEDICO (
  referencia_producto varchar(30),
  material varchar(100)
);

CREATE TABLE MEDICAMENTO_CONTROLADO (
  referencia_medicamento varchar(30),
  dosis_max varchar(50) NOT NULL
);

CREATE TABLE MEDICAMENTO_LIBRE (
  referencia_medicamento varchar(30),
  contraindicaciones varchar(300)
);

--  Pedidos a proveedores 
CREATE TABLE PEDIDO (
  id_pedido integer,
  estado varchar(30) NOT NULL,
  nit_proveedor varchar(20) NOT NULL,
  id_empleado integer NOT NULL
);

CREATE TABLE DETALLE_PEDIDO (
  id_pedido integer,
  referencia_producto varchar(30)
);

--  Inventario 
CREATE TABLE LOTE (
  id_lote integer,
  codigo_lote varchar(30) NOT NULL,
  cantidad_disponible integer NOT NULL,
  fecha_vencimiento date NOT NULL,
  nit_proveedor varchar(20) NOT NULL,
  referencia_producto varchar(30) NOT NULL,
  id_empleado integer NOT NULL
);

--  Ventas 
CREATE TABLE RECETA_MEDICA (
  id_receta_medica integer,
  registro_medico varchar(30) NOT NULL,
  eps varchar(60)
);

CREATE TABLE VENTA (
  id_venta integer,
  valor_total numeric(12,2) NOT NULL,
  id_empleado integer NOT NULL,
  id_cliente integer NOT NULL
);

CREATE TABLE DETALLE_VENTA (
  id_venta integer,
  id_lote integer,
  cantidad integer NOT NULL,
  precio_unitario numeric(12,2) NOT NULL,
  id_receta integer           -- Es NULL cuando la venta no requiere receta
);

--  Pérdidas 
CREATE TABLE PERDIDA (
  id_perdida integer,
  valor_perdido numeric(12,2) NOT NULL,
  cantidad_perdida integer NOT NULL,
  accion varchar(100),
  id_lote integer NOT NULL,
  id_empleado integer NOT NULL
);
