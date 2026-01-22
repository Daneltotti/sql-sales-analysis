/* Conteo de registros por tabla */
SELECT 'customers' AS tabla, COUNT(*) AS total FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;

/* Productos únicos */
SELECT COUNT(DISTINCT product_name) AS productos_unicos
FROM products;

/* Clientes que han realizado pedidos */
SELECT COUNT(DISTINCT customer_id) AS clientes_activos
FROM orders;

/* Distribución de pedidos por cliente */
SELECT customer_id, COUNT(*) AS pedidos
FROM orders
GROUP BY customer_id
ORDER BY pedidos DESC;

/* Categorías de productos disponibles */
SELECT DISTINCT category_id
FROM products;
