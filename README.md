# RetailPro — Proyecto de Análisis de Datos

Este repositorio reúne las distintas pre-entregas del proyecto RetailPro desarrolladas durante el curso de Análisis de Datos.

El proyecto parte de información relacionada con ventas, clientes, productos y categorías, y avanza desde la construcción de una base de datos relacional hasta la creación de un modelo analítico en Power BI.

## Herramientas utilizadas

- SQL Server
- SQL Server Management Studio
- Power BI Desktop
- Power Query
- DAX
- GitHub

## Etapas del proyecto

### Módulo 3 — Base de datos

Se creó la base `Ventas_Tech_DB` con las tablas:

- categorias
- clientes
- productos
- ventas

El script incluye creación de tablas, claves primarias y foráneas, carga de datos y consultas de validación.

### Módulo 4 — Consultas de negocio

Se desarrollaron consultas para obtener:

- Resumen ejecutivo mensual.
- Ranking de productos.
- Clientes recurrentes.
- Comparación de productos contra el promedio de facturación.

### Módulo 5 — JOINs

Se combinaron las tablas para obtener una vista enriquecida con información de clientes, productos y categorías.

También se analizaron:

- Clientes sin ventas.
- Productos sin ventas.
- Consolidación de información mediante `UNION ALL`.

### Power BI y Power Query

El proyecto continuó en Power BI con:

- Limpieza de datos.
- Eliminación de duplicados.
- Tratamiento de valores nulos.
- Corrección de tipos de datos.
- Merge de consultas.
- Nomenclatura de tablas de dimensiones y hechos.

### Modelo analítico y DAX

Se creó un modelo con relaciones 1:N, una tabla calendario y una tabla exclusiva de medidas.

Entre las medidas desarrolladas se encuentran:

- Total Ventas
- Ventas Online
- Ventas YTD
- Ventas LY
- % Crecimiento Anual

## Cómo ejecutar los scripts SQL

Los scripts deben ejecutarse en SQL Server Management Studio.

Orden recomendado:

1. Ejecutar el script del Módulo 3 para crear y cargar `Ventas_Tech_DB`.
2. Ejecutar las consultas del Módulo 4 sobre la base ya creada.
3. Ejecutar las consultas del Módulo 5 para realizar los JOINs y análisis entre tablas.

Antes de ejecutar los scripts, verificar que SQL Server esté activo y que la base de datos seleccionada sea la correcta.

## Objetivo del proyecto

El objetivo general es aplicar un flujo completo de análisis de datos, desde la organización y consulta de información hasta la construcción
