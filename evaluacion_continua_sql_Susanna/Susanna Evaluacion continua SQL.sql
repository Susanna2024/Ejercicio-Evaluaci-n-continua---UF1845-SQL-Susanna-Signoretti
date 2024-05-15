CREATE DATABASE evaluacion_continua;
use evaluacion_continua; 

-- Creación de las tablas
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    precio DECIMAL(10, 2),
    categoria VARCHAR(100)
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    email VARCHAR(255),
    ciudad VARCHAR(100)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_pedido DATE,
    estado VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Detalles_Pedidos (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);



-- Insertar productos
INSERT INTO Productos (id_producto, nombre, precio, categoria)
VALUES (1, 'Laptop', 1200.00, 'Electrónica'),
(2, 'Smartphone', 800.00, 'Electrónica'),
(3, 'Teclado', 100.00, 'Accesorios'),
(4, 'Mouse', 50.00, 'Accesorios'),
(5, 'Monitor', 300.00, 'Electrónica'),
(6, 'Impresora', 150.00, 'Oficina'),
(7, 'Tablet', 250.00, 'Electrónica'),
(8, 'Cámara', 500.00, 'Electrónica'),
(9, 'Silla de oficina', 120.00, 'Muebles'),
(10, 'Escritorio', 220.00, 'Muebles'),
(11, 'Router', 95.00, 'Electrónica'),
(12, 'Disco Duro Externo', 120.00, 'Accesorios'),
(13, 'Altavoces', 70.00, 'Electrónica'),
(14, 'Micrófono', 85.00, 'Accesorios'),
(15, 'Teclado Mecánico', 130.00, 'Accesorios'),
(16, 'Monitor Curvo', 320.00, 'Electrónica'),
(17, 'Mochila', 90.00, 'Accesorios'),
(18, 'Power Bank', 50.00, 'Electrónica'),
(19, 'Lámpara de escritorio', 45.00, 'Muebles'),
(20, 'Silla ergonómica', 180.00, 'Muebles');

-- Insertar clientes
INSERT INTO Clientes (id_cliente, nombre, email, ciudad)
VALUES
(1, 'Juan Pérez', 'juanperez@mail.com', 'Madrid'),
(2, 'Ana Gómez', 'anagomez@mail.com', 'Barcelona'),
(3, 'Luisa Fernández', 'luisafern@mail.com', 'Valencia'),
(4, 'Carlos Ruiz', 'carlosruiz@mail.com', 'Sevilla'),
(5, 'Marta López', 'martalopez@mail.com', 'Madrid'),
(6, 'Andrea Jiménez', 'andreajimenez@mail.com', 'Málaga'),
(7, 'Pablo Martínez', 'pablomartinez@mail.com', 'Bilbao'),
(8, 'Sofía Castro', 'sofiacastro@mail.com', 'Zaragoza'),
(9, 'Raúl Navarro', 'raulnavarro@mail.com', 'Alicante'),
(10, 'Irene Molina', 'irenemolina@mail.com', 'Coruña'),
(11, 'Jorge Esteban', 'jorgeesteban@mail.com', 'Granada'),
(12, 'Clara Sanz', 'clarasanz@mail.com', 'Santander'),
(13, 'Mario Redondo', 'marroredondo@mail.com', 'Toledo'),
(14, 'Lucía Marín', 'luciamarin@mail.com', 'Cádiz');

-- Insertar pedidos
INSERT INTO Pedidos (id_pedido, id_cliente, fecha_pedido, estado)
VALUES
(1, 1, '2021-03-15', 'Entregado'),
(2, 2, '2021-03-17', 'Pendiente'),
(3, 3, '2021-03-20', 'Cancelado'),
(4, 4, '2021-03-22', 'Entregado'),
(5, 5, '2021-03-24', 'Pendiente'),
(6, 6, '2021-03-25', 'Entregado'),
(7, 7, '2021-03-28', 'Cancelado'),
(8, 8, '2021-03-30', 'Entregado'),
(9, 9, '2021-04-01', 'Entregado'),
(10, 10, '2021-04-02', 'Entregado'),
(11, 11, '2021-04-03', 'Entregado'),
(12, 12, '2021-04-05', 'Pendiente'),
(13, 13, '2021-04-05', 'Cancelado'),
(14, 14, '2021-04-06', 'Entregado'),
(15, 10, '2021-04-07', 'Entregado'),
(16, 10, '2021-04-08', 'Entregado'),
(17, 11, '2021-04-09', 'Entregado'),
(18, 12, '2021-04-10', 'Pendiente');
 
-- Insertar detalles de pedidos
INSERT INTO Detalles_Pedidos (id_detalle, id_pedido, id_producto, cantidad)
VALUES 
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 1, 1),
(4, 3, 4, 1),
(5, 4, 5, 2),
(6, 5, 6, 1),
(7, 5, 7, 1),
(8, 6, 8, 1),
(9, 7, 9, 1),
(10, 8, 10, 1),
(11, 9, 5, 2),
(12, 9, 6, 3),
(13, 10, 11, 1),
(14, 11, 12, 1),
(15, 11, 13, 2),
(16, 12, 14, 1),
(17, 13, 15, 1),
(18, 14, 16, 1),
(19, 15, 17, 1),
(20, 15, 18, 2),
(21, 16, 19, 1),
(22, 17, 20, 1),
(23, 17, 11, 1),
(24, 18, 12, 2),
(25, 18, 10, 3),
(26, 18, 6, 4);
commit;


-- Consultas

-- 1. Total de Ventas por Producto: Calcula el total de ventas para cada producto, ordenado de mayor a menor.
-- Cantidad por precio
-- Selecciona el nombre del producto, su precio y calcula el total de ventas para cada producto, ordenado de mayor a menor según el total de ventas
SELECT Productos.nombre AS producto, -- Selecciona el nombre del producto
       Productos.precio AS precio, -- Selecciona el precio del producto
       SUM(Detalles_Pedidos.cantidad) AS total_ventas -- Calcula la suma de la cantidad de cada producto vendido
FROM Productos
-- Realiza un LEFT JOIN entre la tabla Productos y la tabla Detalles_Pedidos para incluir todos los productos, incluso si no han sido vendidos
LEFT JOIN Detalles_Pedidos ON Productos.id_producto = Detalles_Pedidos.id_producto
-- Agrupa los resultados por el nombre del producto y su precio
GROUP BY Productos.nombre, Productos.precio
-- Ordena los resultados en orden descendente basado en el total de ventas
ORDER BY total_ventas DESC;



-- 2. Último Pedido de Cada Cliente: Identifica el último pedido realizado por cada cliente.

SELECT id_cliente, 
       MAX(fecha_pedido) AS ultimo_pedido -- Selecciona la fecha máxima de pedido para cada cliente
FROM Pedidos
GROUP BY id_cliente; -- Agrupa los resultados por el id del cliente para obtener el último pedido de cada cliente




-- 3. Número de Pedidos por Ciudad: Determina el número total de pedidos realizados por clientes en cada ciudad.

SELECT Clientes.ciudad, 
       COUNT(*) AS numero_pedidos -- Cuenta el número total de pedidos para cada ciudad
FROM Clientes
JOIN Pedidos ON Clientes.id_cliente = Pedidos.id_cliente -- Une las tablas Clientes y Pedidos basándose en el ID del cliente
GROUP BY Clientes.ciudad; -- Agrupa los resultados por ciudad para obtener el número total de pedidos para cada ciudad




-- 4. Productos que Nunca se Han Vendido: Lista todos los productos que nunca han sido parte de un pedido.
-- Selecciona el nombre del producto de los que nunca han sido vendidos.
SELECT p.nombre
FROM Productos p
LEFT JOIN Detalles_Pedidos dp ON p.id_producto = dp.id_producto
GROUP BY p.nombre
HAVING SUM(dp.cantidad) IS NULL OR SUM(dp.cantidad) = 0;



-- 5. Productos Más Vendidos por Cantidad: Encuentra los productos más vendidos en términos de cantidad total vendida.
-- Selecciona el nombre del producto de la tabla Productos y la suma de la cantidad de la tabla Detalles_Pedidos
SELECT p.nombre AS producto, SUM(dp.cantidad) AS cantidad_total_vendida
FROM Productos p
-- Utiliza un LEFT JOIN para incluir todos los productos, incluso si no tienen detalles de pedidos
LEFT JOIN Detalles_Pedidos dp ON p.id_producto = dp.id_producto
-- Agrupa los resultados por el nombre del producto
GROUP BY p.nombre
-- Ordena los resultados en orden descendente según la cantidad total vendida
ORDER BY cantidad_total_vendida DESC;



-- 6. Clientes con Compras en Múltiples Categorías: Identifica a los clientes que han realizado compras en más de una categoría de producto.
-- Selecciona el nombre del cliente y cuenta cuántas categorías únicas de productos ha comprado
SELECT c.nombre AS cliente, -- Selecciona el nombre del cliente
       COUNT(DISTINCT p.categoria) AS categorias_compradas -- Cuenta cuántas categorías únicas de productos ha comprado el cliente
FROM Clientes c
JOIN Pedidos pe ON c.id_cliente = pe.id_cliente -- Une las tablas Clientes y Pedidos utilizando el ID del cliente
JOIN Detalles_Pedidos dp ON pe.id_pedido = dp.id_pedido -- Une la tabla Detalles_Pedidos utilizando el ID del pedido
JOIN Productos p ON dp.id_producto = p.id_producto -- Une la tabla Productos utilizando el ID del producto
-- Agrupa los resultados por el nombre del cliente
GROUP BY c.nombre
-- Filtra los resultados para incluir solo aquellos clientes que han comprado en más de una categoría
HAVING COUNT(DISTINCT p.categoria) > 1;


 

-- 7. Ventas Totales por Mes: Muestra las ventas totales agrupadas por mes y año.
-- Cantidad por precio
-- Selecciona el mes y el año de la fecha del pedido, la cantidad de productos vendidos y calcula las ventas totales para cada mes y año.
SELECT YEAR(fecha_pedido) AS anio, -- Selecciona el año de la fecha del pedido
       MONTH(fecha_pedido) AS mes, -- Selecciona el mes de la fecha del pedido
       SUM(precio * cantidad) AS ventas_totales, -- Calcula las ventas totales para cada mes y año
       SUM(cantidad) AS cantidad_total -- Calcula la cantidad total de productos vendidos para cada mes y año
FROM Pedidos pe
JOIN Detalles_Pedidos dp ON pe.id_pedido = dp.id_pedido -- Une la tabla Pedidos y Detalles_Pedidos utilizando el ID del pedido
JOIN Productos p ON dp.id_producto = p.id_producto -- Une la tabla Detalles_Pedidos y Productos utilizando el ID del producto
-- Agrupa los resultados por mes y año
GROUP BY YEAR(fecha_pedido), MONTH(fecha_pedido)
ORDER BY anio DESC, mes DESC; -- Ordena los resultados por año y mes de forma descendente




-- 8. Promedio de Productos por Pedido: Calcula la cantidad promedio de productos por pedido.

-- Calcula la cantidad promedio de productos por pedido

SELECT AVG(cantidad) AS promedio_productos_por_pedido -- Selecciona la cantidad promedio de productos por pedido y la nombra como 'promedio_productos_por_pedido'
FROM Detalles_Pedidos; -- Selecciona los datos de la tabla Detalles_Pedidos

 

-- 9. Tasa de Retención de Clientes: Determina cuántos clientes han realizado pedidos en más de una ocasión. 

-- Selecciona el nombre del cliente y cuenta la cantidad de pedidos
SELECT c.nombre AS cliente, COUNT(p.id_pedido) AS cantidad_ordenes

-- Selecciona datos de las tablas Clientes y Pedidos
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente

-- Agrupa los resultados por el ID del cliente
GROUP BY c.id_cliente

-- Filtra los resultados para incluir solo aquellos clientes con más de un pedido
HAVING COUNT(p.id_pedido) > 1;




-- 10. Tiempo Promedio entre Pedidos: Calcula el tiempo promedio que pasa entre pedidos para cada cliente.

-- Selecciona el nombre del cliente y calcula la diferencia en días entre el primer y el último pedido
SELECT 
    c.nombre AS cliente, -- Selecciona el nombre del cliente
    ABS(DATEDIFF(MIN(pe.fecha_pedido), MAX(pe.fecha_pedido))) AS tiempo_entre_pedidos_dias -- Calcula la diferencia en días entre el primer y el último pedido y obtén el valor absoluto
FROM Clientes c
JOIN Pedidos pe ON c.id_cliente = pe.id_cliente -- Une las tablas Clientes y Pedidos utilizando el ID del cliente
WHERE c.nombre IN ('Irene Molina', 'Jorge Esteban', 'Clara Sanz') -- Filtra los resultados para incluir solo los clientes especificados
GROUP BY c.nombre -- Agrupa los resultados por el nombre del cliente
HAVING COUNT(pe.id_pedido) > 1; -- Filtra los resultados para incluir solo los clientes que han realizado más de un pedido



