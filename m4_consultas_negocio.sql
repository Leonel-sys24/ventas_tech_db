--Consulta 1. Resumen ejecutivo mensual: Total facturado, cantidad de pedidos y ticket promedio.--
use Ventas_Tech_DB
select
extract (MONTH from fecha_venta) as mes,
avg (cantidad * precio_unitario) as 'ticket promedio', 
count(id_venta) as 'cantidad de pedidos',
SUM(cantidad * precio_unitario) as facturacion
from ventas
group by MONTH(fecha_venta)
--===========================================================================================================--
--Consulta 2. Ranking de productos. Top 5 de id_producto por total facturado, mostrando las unidades vendidas--

select top(5) id_producto as producto,
sum(cantidad) as 'unidades vendidas',
sum (cantidad * precio_unitario) as 'total facturado'
from ventas
group by id_producto
order by 'unidades vendidas'

--===========================================================================================================--
--Consulta 3. Clientes recurrentes

select id_cliente as cliente,
count(id_cliente) as 'cantidad de pedidos',
sum(cantidad*precio_unitario) as 'total gastado'
from ventas
group by id_cliente
having count(id_cliente) > 1 

--===========================================================================================================--

--Consulta 4. Meses por encima/debajo del promedio.

SELECT 
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
CASE 
WHEN SUM(cantidad * precio_unitario) >= (
SELECT AVG(total_mensual) 
FROM (
SELECT SUM(cantidad * precio_unitario) AS total_mensual 
FROM ventas 
GROUP BY MONTH(fecha_venta)
) AS sub
) THEN 'Por encima'
ELSE 'Por debajo'
END AS etiqueta
FROM ventas
GROUP BY MONTH(fecha_venta)

--comentarios de hallazgos concretos--
-- 1. El producto 1 concentra el 55,86 % de la facturación.--
-- 2. Los clientes 1 y 5 concentran el 73,55 de la facturación.--
-- 3. El producto 6 es el mas vendido, pero concentra el 5,89% de la facturación.--
