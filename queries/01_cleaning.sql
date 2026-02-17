/* Comprobación de valores nulos en tablas clave */
SELECT 'customers' AS tabla, COUNT(*) AS nulos
FROM customers
WHERE customer_id IS NULL

UNION ALL

SELECT 'orders', COUNT(*)
FROM orders
WHERE order_id IS NULL

UNION ALL

SELECT 'order_items', COUNT(*)
FROM order_items
WHERE order_id IS NULL;

/* Duplicados en IDs de clientes */
SELECT customer_id, COUNT(*) AS repeticiones
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

/*Tratamiento de datos duplicados*/
WITH duplicados AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY customer_id) AS rn
    FROM customers
)
DELETE FROM duplicados
WHERE rn > 1;

/* Fechas potencialmente problemáticas */
SELECT order_id, order_date
FROM orders
WHERE order_date IS NULL;

/* Productos con precio cero o negativo */
SELECT product_id, product_name, list_price
FROM products
WHERE list_price <= 0;
