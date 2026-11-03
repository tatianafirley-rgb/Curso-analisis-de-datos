USE Ventas_Tech_DB;
GO

-- =========================================
-- CONSULTA 1: VISTA BASE DEL PROYECTO
-- Propósito: reunir en una sola consulta la información
-- de ventas, clientes, productos y categorías.
-- =========================================

SELECT
    v.fecha_venta,
    v.id_cliente,
    c.nombre AS cliente,
    c.ciudad,
    v.id_producto,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria;
    -- Hallazgo: La vista permite analizar las 10 ventas junto con el cliente,
-- su ciudad, el producto y la categoría correspondiente en una sola consulta.
-- =========================================
-- CONSULTA 2: CLIENTES SIN VENTAS
-- Propósito: detectar clientes registrados que nunca realizaron una compra.
-- =========================================

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;
-- Hallazgo: No se encontraron clientes registrados sin compras.
-- Para CRM, esto indica que todos los clientes cargados ya realizaron al menos una operación.
-- =========================================
-- CONSULTA 3: PRODUCTOS SIN VENTAS
-- Propósito: identificar productos del catálogo que todavía no registran ventas.
-- =========================================

SELECT
    p.nombre_producto,
    cat.nombre_categoria,
    p.precio
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;
-- Hallazgo: No se encontraron productos del catálogo sin ventas.
-- Para el área de producto, esto indica que todos los artículos cargados tuvieron movimiento.
SELECT
    canal,
    SUM(total) AS total_canal
FROM (
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Primera mitad del mes' AS canal
    FROM ventas
    WHERE DAY(fecha_venta) <= 10

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Segunda mitad del mes' AS canal
    FROM ventas
    WHERE DAY(fecha_venta) > 10
) AS consolidado
GROUP BY canal;
-- Hallazgo: La primera mitad del mes concentró una mayor facturación
-- que la segunda mitad, mostrando una mayor actividad comercial en esos días.
-- Hallazgo: La primera mitad del mes facturó $3.620,
-- superando a la segunda mitad, que facturó $2.824.