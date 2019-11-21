DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);



/*1.Lista el nombre de todos los productos que hay en la tabla producto.*/
select nombre from producto;

/*2.Lista los nombres y los precios de todos los productos de la tabla producto.*/
select nombre, precio from producto;

/*Lista todas las columnas de la tabla producto.*/
select * from producto;

/*Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).*/
select nombre, precio, round(precio * 1.11) as precio_dolares from producto;

/*Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.*/
select 
	nombre AS 'Nombre del producto', 
    precio AS 'Euros', 
    round(precio * 1.11) as 'Dólares' 
from producto; 

/*Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.*/
select upper(nombre), precio from producto;

/*Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.*/
select lower(nombre), precio from producto;

/*Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.*/
select upper(left(nombre,2))from fabricante;

/*Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.*/
select nombre, round(precio)from producto;

/*Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.*/
select nombre, round(precio) from producto;

/*Lista el código de los fabricantes que tienen productos en la tabla producto.*/
select codigo_fabricante from producto;

/*Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.*/
select distinct(codigo_fabricante) from producto;

/*Lista los nombres de los fabricantes ordenados de forma ascendente.*/
SELECT * FROM fabricante ORDER BY nombre ASC

/*Lista los nombres de los fabricantes ordenados de forma descendente.*/
SELECT * FROM fabricante ORDER BY nombre DESC

/*Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.*/
  select *
    from producto
order by nombre asc, precio desc

/*Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/
SELECT * FROM producto LIMIT 5;

/*Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.*/
select * from fabricante limit 2;

/*lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)*/
select nombre,precio from producto where precio=(Select MIN(Precio) From producto);


/*Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)*/
select nombre,precio from producto where precio=(Select max(Precio) From producto);

/*20-Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.*/
select AVG (nombre) from producto where idCodigo=2;

/*21-Lista el nombre de los productos que tienen un precio menor o igual a 120€.*/
select Nombre from producto where precio >='120€';

/*22-Lista el nombre de los productos que tienen un precio mayor o igual a 400€.*/
 select nombre from producto where Precio <='400€';

/*23-Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.*/
select Nombre from producto where precio <='400€';

/*24-Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.*/
 select * from producto where Precio>='80€' and Precio <='300€';
 
 /*25-a todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN*/
  SELECT precio FROM producto WHERE precio BETWEEN '60€' AND '200€';
  
  /*26-Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.*/
  
  
  /*27-Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.*/
  SELECT *
  FROM Employees
  WHERE EmployeeID (3,5,8);
  
  /*28-Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.*/

  
  /*Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.*/
   SELECT nombre FROM fabricante WHERE nombre LIKE 's%'
   
   /*Lista los nombres de los fabricantes cuyo nombre termine por la vocal e*/
   
   
   

  