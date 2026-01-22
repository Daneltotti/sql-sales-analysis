/*¿Cuántos clientes únicos hay?*/
/* KPI: total de clientes únicos registrados */
SELECT COUNT(distinct(customer_id)) AS clientes_unicos FROM customers

/*¿Cuántos pedidos totales se realizaron?*/
/* KPI: total de pedidos realizados en toda la base */
SELECT COUNT(*) AS total_pedido FROM orders

/*¿Cuántos productos se vendieron en total?*/
/* KPI: unidades totales vendidas (suma de quantity) */
SELECT SUM(quantity) AS total_producto FROM order_items

/*¿Cuál es el ingreso total generado?*/
/* KPI: ingresos totales generados por ventas */
SELECT ROUND(SUM(quantity* list_price),1) AS total_ganancia FROM order_items


/*¿Cómo evolucionaron las ventas por mes?*/
/* Análisis temporal: ingresos mensuales agregados por mes */
SELECT DATE_FORMAT(O.order_date, '%Y-%m') AS mes,
ROUND(SUM(OI.quantity * OI.list_price),1) AS gastos_mensuales
FROM order_items OI
JOIN orders O ON O.order_id = OI.order_id
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY mes ASC;


/*¿Cuál fue el mejor mes en términos de ingresos?*/
/* Ranking mensual: meses con mayores ingresos */
SELECT DATE_FORMAT(O.order_date, '%Y-%m') AS mes,
ROUND(SUM(OI.quantity * OI.list_price),1) AS gastos_mensuales
FROM order_items OI
JOIN orders O ON O.order_id = OI.order_id
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY gastos_mensuales DESC
LIMIT 3;


/*¿Cuál es el promedio de ventas mensuales?*/
/* KPI: promedio de ingresos mensuales */
SELECT ROUND(AVG(gastos_mensuales),1) AS promedio_mensual FROM(

SELECT DATE_FORMAT(O.order_date, '%Y-%m') AS mes,
ROUND(SUM(OI.quantity * OI.list_price),1) AS gastos_mensuales
FROM order_items OI
JOIN orders O ON O.order_id = OI.order_id
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY mes ASC) AS ventas_mensuales;


/*¿Cuál es el producto más vendido?*/
/* Ranking de productos por unidades vendidas */
SELECT P.product_name AS producto, SUM(OI.quantity) AS cantidad
FROM products P 
JOIN order_items OI ON OI.product_id = P.product_id
GROUP BY P.product_name
ORDER BY cantidad DESC
LIMIT 5;


/*¿Cuál es el cliente que más ha comprado?*/
/* Ranking de clientes por gasto total */
SELECT C.first_name AS nombre, C.last_name AS apellido, ROUND(SUM(OI.quantity * OI.list_price),1) AS total_gastado
FROM order_items OI
JOIN orders O ON O.order_id = OI.order_id
JOIN customers C ON C.customer_id = O.customer_id 
GROUP BY C.first_name, C.last_name
ORDER BY total_gastado DESC
LIMIT 5;

/*¿Cuál es la categoría más vendida?*/
/* Ranking de categorías por unidades vendidas */
SELECT CA.category_name AS nombre_categoria, SUM(OI.quantity) AS total_vendido
FROM order_items OI
JOIN products P ON P.product_id = OI.product_id
JOIN categories CA ON CA.category_id = P.category_id
GROUP BY CA.category_name
ORDER BY total_vendido DESC
LIMIT 5;

/*¿Qué producto ha generado más ingresos totales?*/
/* Ranking de productos por ingresos generados */
SELECT 
     P.product_id,
     P.product_name AS producto,
     ROUND(SUM(OI.quantity * OI.list_price), 1) AS total_ventas
FROM order_items OI
JOIN products P ON P.product_id = OI.product_id
GROUP BY P.product_id, P.product_name
ORDER BY total_ventas DESC
LIMIT 5;


/*Clasifica a los clientes según su gasto total (Bajo / Medio / Alto) y muestra cuántos hay en cada segmento.*/
/* Segmentación de clientes según su gasto total */
SELECT rango,
		COUNT(*) AS cantidad_clientes,
		RANK() OVER(ORDER BY COUNT(*) DESC) AS ranking_segmento FROM( 
SELECT C.customer_id, C.first_name AS nombre, C.last_name AS apellido, ROUND(SUM(OI.quantity*OI.list_price),1) AS gasto_cliente,
CASE
	WHEN SUM(OI.quantity*OI.list_price) < 20000 THEN 'Bajo'
    WHEN SUM(OI.quantity*OI.list_price) BETWEEN 20000 AND 100000 THEN 'Medio'
    ELSE 'Alto'
END AS rango
FROM order_items OI
JOIN orders O ON O.order_id = OI.order_id
JOIN customers C ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name
) AS segmento
GROUP BY rango;


/*¿Qué porcentaje del total de ingresos generan los top 20% de clientes?*/
/* Análisis de concentración: ingresos aportados por el top 20% de clientes */
SELECT ROUND(SUM(
	CASE
    WHEN top_20 = 1 THEN total_gastado
    END)
    / SUM(total_gastado)*100,2) AS porcentaje_20
    
    FROM(

SELECT  customer_id, 
		total_gastado, 
        ntile(5) OVER(ORDER BY total_gastado DESC) AS top_20
	FROM(

SELECT C.customer_id, C.first_name AS nombre, C.last_name AS apellido, ROUND(SUM(OI.quantity * OI.list_price),1) AS total_gastado
FROM order_items OI
JOIN orders O ON O.order_id = OI.order_id
JOIN customers C ON C.customer_id = O.customer_id 
GROUP BY C.customer_id , C.first_name, C.last_name
) AS clientes
) AS ranking
;


/*¿Cuál es el cliente con mayor valor promedio por pedido?*/
/* Ranking de clientes por valor promedio por pedido */
SELECT customer_id, nombre, apellido, ROUND((total_gastado/cantidad),2) AS promedio_por_pedido
FROM(

SELECT C.customer_id, C.first_name AS nombre, C.last_name AS apellido, ROUND(SUM(OI.quantity * OI.list_price),1) AS total_gastado, COUNT(distinct O.order_id) AS cantidad
FROM order_items OI
JOIN orders O ON O.order_id = OI.order_id
JOIN customers C ON C.customer_id = O.customer_id 
GROUP BY C.customer_id , C.first_name, C.last_name

) promedio
ORDER BY promedio_por_pedido DESC
LIMIT 3
;

