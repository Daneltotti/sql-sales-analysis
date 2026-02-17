# Análisis de Ventas con SQL

Este proyecto realiza un análisis completo de datos de ventas usando SQL, siguiendo un flujo profesional de trabajo con datos:

---

## 🧼 01 — Limpieza de datos

Se verifica la calidad del dataset:
- Búsqueda de valores nulos en claves primarias
- ![Búsqueda de nulos](https://github.com/Daneltotti/sql-sales-analysis/blob/3ea3dce09632fe5aa625be354fc81116f793140c/Image/Busqueda%20de%20valores%20nulos.png)
- ![Resultados de nulos](https://github.com/Daneltotti/sql-sales-analysis/blob/f3bab56e3f8b8c88ac04fd92d7d88b26d64e0631/Image/Resultado%20de%20valores%20nulos.png)
- Detección de duplicados
- ![Busqueda de duplicados](https://github.com/Daneltotti/sql-sales-analysis/blob/f3bab56e3f8b8c88ac04fd92d7d88b26d64e0631/Image/Deteccion%20de%20duplicados.png)
- ![Resultados de Duplicados](https://github.com/Daneltotti/sql-sales-analysis/blob/f3bab56e3f8b8c88ac04fd92d7d88b26d64e0631/Image/Resultado%20de%20duplicados.png)
- Validación de fechas y precios
- ![Busqueda de fechas](https://github.com/Daneltotti/sql-sales-analysis/blob/f3bab56e3f8b8c88ac04fd92d7d88b26d64e0631/Image/Fechas%20Problematicas.png)
- ![Resultados de fechas](https://github.com/Daneltotti/sql-sales-analysis/blob/f3bab56e3f8b8c88ac04fd92d7d88b26d64e0631/Image/Resultado%20de%20fechas%20problematicas.png)
- Confirmación de integridad en las tablas principales
- ![Busqueda de precios irregulares](https://github.com/Daneltotti/sql-sales-analysis/blob/f3bab56e3f8b8c88ac04fd92d7d88b26d64e0631/Image/Productos%20con%20precios%20irregulares.png)
- ![Resultados de precios irregulares](https://github.com/Daneltotti/sql-sales-analysis/blob/f3bab56e3f8b8c88ac04fd92d7d88b26d64e0631/Image/Resultados%20de%20Productos%20con%20precios%20irregulares.png)
---

## 🔍 02 — Exploración inicial

Se realiza una exploración general para entender la estructura:
- Conteo de registros por tabla
- ![Búsqueda de registros](https://github.com/Daneltotti/sql-sales-analysis/blob/5c98d74e1b71c760802d92a7f25a7f96abee8314/Image/Busqueda%20de%20registros.png)
- ![Resultado de registros](https://github.com/Daneltotti/sql-sales-analysis/blob/5c98d74e1b71c760802d92a7f25a7f96abee8314/Image/Resultado%20de%20registros.png)
- Productos únicos
- ![Búsqueda de Productos](https://github.com/Daneltotti/sql-sales-analysis/blob/5c98d74e1b71c760802d92a7f25a7f96abee8314/Image/Busqueda%20de%20productos.png)
- ![Resultado de Productos](https://github.com/Daneltotti/sql-sales-analysis/blob/5c98d74e1b71c760802d92a7f25a7f96abee8314/Image/Resultados%20de%20productos.png)
- Clientes activos
- ![Búsqueda de Clientes](https://github.com/Daneltotti/sql-sales-analysis/blob/5c98d74e1b71c760802d92a7f25a7f96abee8314/Image/Busqueda%20de%20clientes.png)
- ![Resultado de Clientes](https://github.com/Daneltotti/sql-sales-analysis/blob/5c98d74e1b71c760802d92a7f25a7f96abee8314/Image/Resultados%20de%20clientes.png)
- Distribución de pedidos
- ![Búsqueda de pedidos](https://github.com/Daneltotti/sql-sales-analysis/blob/5c98d74e1b71c760802d92a7f25a7f96abee8314/Image/Busqueda%20de%20pedidos.png)
- ![Resultado de pedidos](https://github.com/Daneltotti/sql-sales-analysis/blob/5c98d74e1b71c760802d92a7f25a7f96abee8314/Image/Resultados%20de%20pedidos.png)
- Categorías disponibles
- ![Búsqueda de Categorías](https://github.com/Daneltotti/sql-sales-analysis/blob/5c98d74e1b71c760802d92a7f25a7f96abee8314/Image/Busqueda%20de%20categorias.png)
- ![Resultado de Categorías](https://github.com/Daneltotti/sql-sales-analysis/blob/5c98d74e1b71c760802d92a7f25a7f96abee8314/Image/Resultado%20de%20categorias.png)

---

## 📊 03 — KPIs principales

Se extraen métricas clave del negocio:
- Cliente que mas ha comprado
- ![Busqueda de Clientes](https://github.com/Daneltotti/sql-sales-analysis/blob/206d93538147329c855b92685980c72431400aba/Image/Busqueda%20Cliente%20mas%20ha%20comprado.png)
- ![Resultado de Clientes](https://github.com/Daneltotti/sql-sales-analysis/blob/206d93538147329c855b92685980c72431400aba/Image/Respuesta%20cliente%20mas%20ah%20comprado.png)
- Categoria mas vendida
- ![Busqueda de Categoria](https://github.com/Daneltotti/sql-sales-analysis/blob/206d93538147329c855b92685980c72431400aba/Image/Busqueda%20categoria%20mas%20vendida.png)
- ![Resultado de Categoria](https://github.com/Daneltotti/sql-sales-analysis/blob/206d93538147329c855b92685980c72431400aba/Image/Respuesta%20%20categoria%20mas%20vendida.png)
- Producto mas vendido
- ![Busqyeda de producto](https://github.com/Daneltotti/sql-sales-analysis/blob/206d93538147329c855b92685980c72431400aba/Image/Busqueda%20producto%20mas%20vendido.png)
- ![Resultado de producto](https://github.com/Daneltotti/sql-sales-analysis/blob/206d93538147329c855b92685980c72431400aba/Image/Respuesta%20producto%20mas%20vendido.png)
- Promedio de ventas mensuales
- ![Busqueda de ventas](https://github.com/Daneltotti/sql-sales-analysis/blob/206d93538147329c855b92685980c72431400aba/Image/Busqueda%20promedio%20de%20ventas%20mensuales.png)
- ![Resultado de ventas](https://github.com/Daneltotti/sql-sales-analysis/blob/206d93538147329c855b92685980c72431400aba/Image/Respuesta%20promedio%20de%20ventas%20mensuales.png)
- Ingreso total generado
- ![Busqueda de Ingresos](https://github.com/Daneltotti/sql-sales-analysis/blob/206d93538147329c855b92685980c72431400aba/Image/Busqueda%20ingreso%20total%20generado.png)
- ![Resultado de ingresos](https://github.com/Daneltotti/sql-sales-analysis/blob/206d93538147329c855b92685980c72431400aba/Image/Respuesta%20ingreso%20total%20generado.png)

---

## 📁 Estructura del repositorio

```
├── consultas/
│   ├── 01_limpieza.sql
│   ├── 02_exploratorio.sql
│   └── 03_kpis.sql
├── datos/
│   └── dataset_link.txt
└── LÉAME.md
```

---

## 📦 Dataset utilizado

[Bike Store Sample Database — Kaggle](https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database)

---

## 🧠 Autor

**Danel Berotto**  
Analista de Datos Junior en transición desde entorno industrial.  
Experiencia en SQL, Power BI y análisis operativo.  
Ubicado en Barcelona.
