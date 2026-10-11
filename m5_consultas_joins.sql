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
right JOIN
ventas v
ON v.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL

