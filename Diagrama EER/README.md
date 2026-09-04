# Diagrama Entidad-Relación Extendido (EER) - FarmaSync

Este documento contiene el modelo conceptual del sistema de inventario **FarmaSync**, estructurado bajo la notación estándar para cumplir con los requerimientos de la primera entrega académica.

##  Decisiones de Diseño y Arquitectura

El modelo conceptual se ha diseñado para garantizar la integridad referencial, la trazabilidad de los medicamentos y el cumplimiento estricto del principio **FEFO** (*First Expired, First Out*). Las decisiones clave implementadas en el diagrama son:

###  Núcleo del Inventario (Gestión de Lotes y Productos)
*   **Relación Producto-Lote (1:N):** Se estructuró de forma unidireccional. Un producto específico puede contar con múltiples lotes activos en bodega con distintas fechas de caducidad, pero cada lote pertenece estrictamente a un único producto, evitando así la duplicidad de datos del fabricante.
*   **Especialización de Productos:** Se implementó una jerarquía mediante una superclase `Producto` que se especializa en tres categorías de negocio con reglas diferenciadas: `Medicamento_controlado`, `Medicamento_libre` e `Insumo_medico`.

###  Gestión de Entradas y Trazabilidad de Personal
*   **Relación Proveedor-Pedido (1:N):** Cada orden de pedido es emitida a un único proveedor, la cual contiene múltiples referencias de productos a través de la entidad asociativa `Detalle_pedido`.
*   **Entidad Empleado y Trazabilidad:** Se incorporó la entidad `Empleado` (derivada de una generalización con `Persona`) para registrar la autoría y responsabilidad operativa en la generación de pedidos, el registro de ventas y la gestión de mermas, cumpliendo con los requisitos de auditoría interna.

###  Gestión de Salidas y Control FEFO
*   **Entidad Débil Detalle_Venta:** Funciona como la tabla puente entre la cabecera de la `Venta` y el `Lote` físico del que se desprenden las unidades. Esto permite al sistema registrar con exactitud matemática de qué lote específico salió la mercancía vendida.
*   **Manejo de Recetas Médicas:** Se estructuró la entidad independiente `Receta_medica` vinculada al detalle de la venta, permitiendo asociar de manera condicional los datos del médico tratante cuando el sistema comercializa fármacos de control especial.
*   **Control de Pérdidas (Mermas):** Se añadió la entidad `Perdida` para registrar de forma aislada los lotes que caducaron en estante sin venderse, permitiendo calcular el impacto financiero por proveedor y producto.
