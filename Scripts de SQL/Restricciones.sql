-- Se ejecuta DESPUÉS de Tablas.sql y ANTES de Datos.sql.
-- Todas las restricciones tienen nombre propio.
-- Las claves foráneas siguen el patrón <tabla>_<columna>_fkey.


--    UNIQUE: valores que no pueden repetirse

-- No hay dos productos con el mismo nombre comercial.
ALTER TABLE PRODUCTO
  ADD CONSTRAINT producto_nombre_unico UNIQUE (nombre_comercial);

-- El código de lote identifica un único lote.
ALTER TABLE LOTE
  ADD CONSTRAINT lote_codigo_unico UNIQUE (codigo_lote);

-- Un registro médico no se repite en dos recetas.
ALTER TABLE RECETA_MEDICA
  ADD CONSTRAINT receta_registro_unico UNIQUE (registro_medico);

--    CHECK: validaciones del negocio

-- Un producto no se vende gratis ni con precio negativo.
ALTER TABLE PRODUCTO
  ADD CONSTRAINT producto_precio_positivo CHECK (precio > 0);

-- No puede haber stock negativo.
ALTER TABLE LOTE
  ADD CONSTRAINT lote_cantidad_no_negativa CHECK (cantidad_disponible >= 0);

-- El total de una venta no es negativo.
ALTER TABLE VENTA
  ADD CONSTRAINT venta_valor_no_negativo CHECK (valor_total >= 0);

-- No se vende cero ni menos unidades, ni a precio cero o negativo.
ALTER TABLE DETALLE_VENTA
  ADD CONSTRAINT detalle_venta_cantidad_positiva CHECK (cantidad > 0);
ALTER TABLE detalle_venta
  ADD CONSTRAINT detalle_venta_precio_positivo CHECK (precio_unitario > 0);

-- Una pérdida es de al menos una unidad y su valor no es negativo.
ALTER TABLE PERDIDA
  ADD CONSTRAINT perdida_valor_no_negativo CHECK (valor_perdido >= 0);
ALTER TABLE PERDIDA
  ADD CONSTRAINT perdida_cantidad_positiva CHECK (cantidad_perdida > 0);

--    FOREIGN KEY con ON DELETE CASCADE
--    La fila hija no tiene sentido sin su padre: es una especialización
--    o una línea de detalle.

-- Un empleado y un cliente SON una persona.
ALTER TABLE EMPLEADO
  ADD CONSTRAINT empleado_id_persona_fkey
  FOREIGN KEY (id_persona) REFERENCES PERSONA(id_persona) ON DELETE CASCADE;

ALTER TABLE CLIENTE
  ADD CONSTRAINT cliente_id_persona_fkey
  FOREIGN KEY (id_persona) REFERENCES PERSONA(id_persona) ON DELETE CASCADE;

-- Un medicamento y un insumo médico SON un producto.
ALTER TABLE MEDICAMENTO
  ADD CONSTRAINT medicamento_referencia_producto_fkey
  FOREIGN KEY (referencia_producto) REFERENCES PRODUCTO(referencia) ON DELETE CASCADE;

ALTER TABLE INSUMO_MEDICO
  ADD CONSTRAINT insumo_medico_referencia_producto_fkey
  FOREIGN KEY (referencia_producto) REFERENCES PRODUCTO(referencia) ON DELETE CASCADE;

-- Un medicamento controlado y uno libre SON un medicamento.
ALTER TABLE MEDICAMENTO_CONTROLADO
  ADD CONSTRAINT medicamento_controlado_referencia_medicamento_fkey
  FOREIGN KEY (referencia_medicamento) REFERENCES MEDICAMENTO(referencia_producto) ON DELETE CASCADE;

ALTER TABLE MEDICAMENTO_LIBRE
  ADD CONSTRAINT medicamento_libre_referencia_medicamento_fkey
  FOREIGN KEY (referencia_medicamento) REFERENCES MEDICAMENTO(referencia_producto) ON DELETE CASCADE;

-- Las líneas de un pedido o de una venta no existen sin su cabecera.
ALTER TABLE DETALLE_PEDIDO
  ADD CONSTRAINT detalle_pedido_id_pedido_fkey
  FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido) ON DELETE CASCADE;

ALTER TABLE DETALLE_VENTA
  ADD CONSTRAINT detalle_venta_id_venta_fkey
  FOREIGN KEY (id_venta) REFERENCES VENTA(id_venta) ON DELETE CASCADE;

--    FOREIGN KEY con ON DELETE RESTRICT
--    Hay que conservar el historial y la trazabilidad: no se puede
--    borrar lo que ya está referenciado.

-- Historial de compras: quién pidió y a qué proveedor.
ALTER TABLE PEDIDO
  ADD CONSTRAINT pedido_nit_proveedor_fkey
  FOREIGN KEY (nit_proveedor) REFERENCES PROVEEDOR(nit) ON DELETE RESTRICT;

ALTER TABLE PEDIDO
  ADD CONSTRAINT pedido_id_empleado_fkey
  FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_persona) ON DELETE RESTRICT;

-- No se borra un producto que ya fue pedido.
ALTER TABLE DETALLE_PEDIDO
  ADD CONSTRAINT detalle_pedido_referencia_producto_fkey
  FOREIGN KEY (referencia_producto) REFERENCES PRODUCTO(referencia) ON DELETE RESTRICT;

-- Trazabilidad del lote: de quién vino, qué producto es y quién lo recibió.
ALTER TABLE LOTE
  ADD CONSTRAINT lote_nit_proveedor_fkey
  FOREIGN KEY (nit_proveedor) REFERENCES PROVEEDOR(nit) ON DELETE RESTRICT;

ALTER TABLE LOTE
  ADD CONSTRAINT lote_referencia_producto_fkey
  FOREIGN KEY (referencia_producto) REFERENCES PRODUCTO(referencia) ON DELETE RESTRICT;

ALTER TABLE LOTE
  ADD CONSTRAINT lote_id_empleado_fkey
  FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_persona) ON DELETE RESTRICT;

-- Historial de ventas: quién vendió y a quién.
ALTER TABLE VENTA
  ADD CONSTRAINT venta_id_empleado_fkey
  FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_persona) ON DELETE RESTRICT;

ALTER TABLE VENTA
  ADD CONSTRAINT venta_id_cliente_fkey
  FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_persona) ON DELETE RESTRICT;

-- Trazabilidad sanitaria: qué lote se vendió y con qué receta.
ALTER TABLE DETALLE_VENTA
  ADD CONSTRAINT detalle_venta_id_lote_fkey
  FOREIGN KEY (id_lote) REFERENCES LOTE(id_lote) ON DELETE RESTRICT;

ALTER TABLE DETALLE_VENTA
  ADD CONSTRAINT detalle_venta_id_receta_fkey
  FOREIGN KEY (id_receta) REFERENCES RECETA_MEDICA(id_receta_medica) ON DELETE RESTRICT;

-- Se conserva de qué lote fue la pérdida y quién la registró.
ALTER TABLE PERDIDA
  ADD CONSTRAINT perdida_id_lote_fkey
  FOREIGN KEY (id_lote) REFERENCES LOTE(id_lote) ON DELETE RESTRICT;

ALTER TABLE PERDIDA
  ADD CONSTRAINT perdida_id_empleado_fkey
  FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_persona) ON DELETE RESTRICT;
