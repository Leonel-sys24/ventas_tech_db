# 🛒 RetailPro - Data Analytics & ETL Pipeline

¡Bienvenido al repositorio oficial del proyecto analítico **RetailPro**! Este proyecto abarca el ciclo de vida completo de los datos: desde el diseño relacional en SQL y el procesamiento ETL en Power Query, hasta el modelado dimensional y visualización en Power BI.

## 🛠️ Tecnologías y Herramientas
- **Base de Datos**: PostgreSQL 14+ / MySQL.
- **Transformación & ETL**: Power Query (Lenguaje M).
- **Modelado & Visualización**: Power BI Desktop (Modelo Estrella, DAX).
- **Control de Versiones**: Git & GitHub.

## ⚙️ Requisitos Previos
- Servidor de base de datos SQL activo (`localhost:5432`).
- Power BI Desktop instalado.

## 📁 Estructura del Repositorio
```text
├── sql/
│   ├── 01_schema_ventas_tech.sql    # Creación de tablas y claves (PK/FK)
│   ├── 02_insert_data.sql           # Carga inicial de datos
│   └── 03_business_queries.sql      # Consultas de análisis (M4 y M5)
├── power_bi/
│   └── RetailPro_Dashboard.pbix      # Reporte interactivo
└── README.md
🚀 Guía de Ejecución
Clonar repositorio:
git clone https://github.com/tu-usuario/RetailPro-Analytics.git
Ejecutar scripts en orden secuencial en PostgreSQL:
Primero ejecutar 01_schema_ventas_tech.sql para levantar la estructura 3NF.
Luego ejecutar 02_insert_data.sql para poblar las tablas.
Finalmente ejecutar 03_business_queries.sql para validar los hallazgos.
Power BI:
Abrir Power Query, actualizar la cadena de conexión a tu servidor local y aplicar la actualización de datos
