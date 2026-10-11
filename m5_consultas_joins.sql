/* ==============================================================================
   1. LIMPIEZA PREVIA (DROP TABLES)
   ============================================================================== */
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS territorios; -- Se borra al final porque clientes depende de esta
DROP TABLE IF EXISTS categorias;

/* ==============================================================================
   2. CREACIÓN DE TABLAS (CREATE TABLES)
   ============================================================================== */
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

-- Se crea primero porque clientes la necesita
CREATE TABLE territorios (
    id_territorio INT PRIMARY KEY,
    ciudad VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    id_territorio INT,
    segmento VARCHAR(50),
    fecha_registro DATE NOT NULL,
    FOREIGN KEY (id_territorio) REFERENCES territorios(id_territorio)
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo TINYINT(1) DEFAULT 1,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

/* ==============================================================================
   3. INSERCIÓN DE DATOS (INSERT DATA)
   ============================================================================== */
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES 
(1, 'Computación', 'Laptops, PCs y monitores'),
(2, 'Accesorios', 'Periféricos y complementos'),
(3, 'Audio', 'Auriculares y parlantes'),
(4, 'Almacenamiento', 'Discos y memorias');

-- Primero se insertan los territorios
INSERT INTO territorios (id_territorio, ciudad, region) VALUES 
(1, 'Buenos Aires', 'Centro'),
(2, 'Córdoba', 'Centro'),
(3, 'Rosario', 'Litoral'),
(4, 'Mendoza', 'Cuyo'),
(5, 'Tucumán', 'Norte');

-- Luego los clientes referenciando el id_territorio y agregando el segmento
INSERT INTO clientes (id_cliente, nombre, email, id_territorio, segmento, fecha_registro) VALUES 
(1, 'María López', 'maria@mail.com', 1, 'Corporativo', '2024-01-05'),
(2, 'Carlos Ruiz', 'carlos@mail.com', 2, 'Minorista', '2024-01-10'),
(3, 'Ana Gómez', 'ana@mail.com', 3, 'Corporativo', '2024-02-01'),
(4, 'Pedro Sanz', 'pedro@mail.com', 4, 'Minorista', '2024-02-15'),
(5, 'Laura Torres', 'laura@mail.com', 5, 'Minorista', '2024-03-01');

-- (Resto de inserts de productos y ventas...)
