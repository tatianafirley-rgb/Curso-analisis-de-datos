USE Ventas_Tech_DB;
GO

-- =========================================
-- CONSULTA 1: RESUMEN EJECUTIVO MENSUAL
-- =========================================

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);
-- =========================================
-- CONSULTA 2: RANKING DE PRODUCTOS
-- =========================================

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;
-- =========================================
-- CONSULTA 3: CLIENTES RECURRENTES
-- =========================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;
-- =========================================
-- CONSULTA 4: PRODUCTOS POR ENCIMA/DEBAJO DEL PROMEDIO
-- =========================================

WITH facturacion_por_producto AS (
    SELECT
        id_producto,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY id_producto
)

SELECT
    id_producto,
    total_facturado,
    CASE
        WHEN total_facturado > (
            SELECT AVG(total_facturado)
            FROM facturacion_por_producto
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM facturacion_por_producto
ORDER BY total_facturado DESC;
-- =========================================
-- HALLAZGOS
-- =========================================

-- 1. En marzo de 2024 se facturaron $6.444 en total, a través de 10 pedidos,
--    con un ticket promedio de $644,40.

-- 2. El producto con mayor facturación fue el id_producto 1,
--    con $3.600 generados y 3 unidades vendidas.

-- 3. Todos los clientes realizaron más de un pedido.
--    El cliente con mayor gasto fue el id_cliente 1, con un total de $2.640.
