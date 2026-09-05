# Mapeo del Esquema relacional
 Políticas de Borrado
| *Venta* → *Detalle_venta* | CASCADE | Si se anula y elimina una factura del sistema por un error de digitación, los renglones asociados a esa venta deben desaparecer automáticamente para no dejar registros contables huérfanos. |
| *Pedido* → *Detalle_pedido* | CASCADE | Si se cancela y borra una orden de pedido al proveedor, el listado de los productos solicitados pierde validez y debe eliminarse en cascada. |
| *Persona* → *Empleado / Cliente* | CASCADE | Por regla de especialización (herencia), si el registro raíz de una persona es eliminado de la base de datos, su rol específico también debe ser destruido. |
| *Producto* → *Lote* | RESTRICT | No se puede eliminar un producto del catálogo maestro si todavía existen lotes físicos registrados en la bodega. Esto previene la pérdida de trazabilidad en el inventario. |
| *Proveedor* → *Lote* | RESTRICT | Un proveedor no puede ser eliminado del sistema si la droguería aún conserva lotes suministrados por ellos en los estantes. |
| *Lote* → *Detalle_venta* | RESTRICT | Se prohíbe estrictamente eliminar un lote de la base de datos si ya se han despachado ventas de este. Permitir el borrado corrompería la contabilidad histórica. |
| *Receta_medica* → *Detalle_venta*| SET NULL (o ANULAR) | Si una receta médica debe ser purgada del sistema (por políticas de privacidad o retención de datos), el detalle de la venta se conserva intacto para la auditoría financiera, dejando el identificador de la receta en blanco. |
