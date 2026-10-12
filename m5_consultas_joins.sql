--Consulta 1.
-- fecha, identificación del cliente, descripción del producto, cantidad, precio unitario y total de venta.
--Sumá además las columnas descriptivas que existan en tu propio esquema.

SELECT V.fecha_venta, V.id_cliente,T.provincia, P.nombre_producto, V.cantidad, V.precio_unitario, (V.cantidad*V.precio_unitario) AS total_venta
FROM ventas V
JOIN productos P
ON V.id_producto = P.id_producto
JOIN territorios T
ON V.id_territorio = T.id_territorio;

--Consulta 2 — Clientes sin ventas (LEFT JOIN) Identificá clientes registrados que aún no han realizado ninguna compra. Mostrá su nombre, email y fecha de registro. Usá WHERE ... IS NULL para aislar los casos.

SELECT  c.nombre, c.email, c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
ON v.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL;

--La consutla no mostró ningun valor, es decir que no existen clientes registrados que no hayan realizado ninguna compra.

--Consulta 3.
-- Productos sin ventas (LEFT JOIN) Identificá productos del catálogo que no tienen ninguna venta registrada. 
--Mostrá nombre del producto, categoría y precio. Usá WHERE ... IS NULL.

SELECT * FROM productos
SELECT * FROM ventas

SELECT p.id_producto, p.nombre_producto, P.id_categoria, P.precio,
v.id_venta, v.id_producto
FROM productos p
LEFT JOIN ventas v
ON v.id_producto=p.id_producto
WHERE v.id_producto is null;

----La consulta no mostró ningun valor, es decir que no existen productos registrados que nunca hayan sido comprados.

--Consulta 4.
--Escribí dos SELECT sobre tus ventas, separados por el criterio que corresponda a tu caso 
--(por ejemplo, ventas de dos períodos, dos sucursales o dos orígenes distintos),y agregá en cada uno una columna de texto fija que identifique el origen.
--Unilos con UNION ALL y agrupá ese resultado por origen para obtener el total de cada uno.

-- La consulta busca hallar el total de las ventas del centro y diferenciarla del resto de las zonas.

SELECT 
clasificacion_territorio,
SUM (total_venta) AS venta_total_consolidada
FROM (
-- Bloque 1: Ventas de zona centro.
SELECT 
v.id_venta, v.cantidad * v.precio_unitario AS total_venta,
'Zona Centro' AS clasificacion_territorio
FROM ventas v
INNER JOIN territorios t ON v.id_territorio = t.id_territorio
WHERE t.zona = 'Centro'

UNION ALL

-- Bloque 2: Ventas del resto de las zonas
SELECT v.id_venta, v.cantidad * v.precio_unitario AS total_venta,
'Otras Zonas' AS clasificacion_territorio
FROM ventas v
INNER JOIN territorios AS t ON v.id_territorio = t.id_territorio
WHERE t.zona <> 'Centro'
) AS consolidado_ventas
GROUP BY clasificacion_territorio;
