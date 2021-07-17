-- Falta float double decimal y fecha hora

use cursoSabado;

/*

	precio float  (32 bits)
    
    10/3
    
    3.333333
    --------
    
    100/3
    
    33.33333
    --------

	precio double (64 bits)

	10/3
    
	3.33333333333333
	----------------
    
    
    100/3
    
    33.3333333333333
    ----------------
    
    
    precio decimal(6,2)

	9999,99
	----,--
    
    precio decimal(7,2)
    
    99999,99
    -----,--

*/

select 'Hola Mundo!';
select 'Hola Mundo!' saludo;
select 'Hola Mundo!' as saludo;

select 'Columna 1' c1,'Columna 2' c2,'Columna 3' c3,'Columna 4' c4;

select 2 + 2;
select 2 + 2 total;

select pi();
select round(pi(),2) Valor_PI;
select round(pi(),2) 'Valor PI';

select curdate() fecha_actual;
select curtime() hora_actual;
select sysdate() fecha_hora_actual;
select year(curdate()) año;

drop database if exists negocio;
create database negocio;
use negocio;

create table clientes (
codigo integer auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
cuit char(13),
direccion varchar(50),
comentarios varchar(140),
primary key (codigo)
);

create table facturas(
letra char(1),
numero integer,
fecha date,
monto double,
primary key (letra,numero)
);

create table articulos(
codigo integer auto_increment,
nombre varchar(50),
precio double,
stock integer,
primary key (codigo)
);

insert into clientes (nombre,apellido,cuit,direccion) values ('juan','perez','xxxxx','peru 323');
insert into clientes (nombre,apellido,cuit,direccion) values ('diego','torres','xxxxx','chile 320');
insert into clientes (nombre,apellido,cuit,direccion) values ('laura','gomez','xxxxx','san juan 420');
insert into clientes (nombre,apellido,cuit,direccion) values ('mario','lopez','xxxxx','lavalle 770');
insert into clientes (nombre,apellido,cuit,direccion) values ('dario','sanchez','xxxxx','mexico 150');

insert into articulos values (1,'destornillador',25,50);
insert into articulos values (2,'pinza',35,22);
insert into articulos values (3,'martillo',15,28);
insert into articulos values (4,'maza',35,18);
insert into articulos values (5,'valde',55,13);

insert into facturas values ('a',0001,'2011/10/18',500);
insert into facturas values ('a',0002,'2011/10/18',2500);
insert into facturas values ('b',0003,'2011/10/18',320);
insert into facturas values ('b',0004,'2011/10/18',120);
insert into facturas values ('b',0005,'2011/10/18',560);
-- inserto un registro con la fecha actual
insert into facturas values ('c',0006,curdate(),300);

insert into clientes (nombre,apellido,cuit,direccion) values ('maria','fernandez','xxxxx','');
insert into clientes (nombre,apellido,cuit,direccion) values ('gustavo','ramirez','xxxxx',null);


insert into facturas values ('f',0006,curdate(),300);
insert into facturas values ('f',0007,curdate(),400);

insert into clientes (nombre,apellido,cuit,direccion) values ('jose','benuto','3647493','loria 940');

insert into facturas (letra,numero,fecha,monto) values ('a',1001,'2012/10/25',350);
insert into facturas (letra,numero,fecha,monto) values ('a',1002,curdate(),540);

insert into articulos (codigo,nombre,precio,stock) values (110,'destornillador',30,100);
insert into articulos (codigo,nombre,precio,stock) values (111,'martillo',40*1.21,50);

insert into clientes (nombre,apellido,direccion) values ('Andrea','Abate','Laprida 648');
insert into clientes (apellido,nombre) values ('Stuart','Jhon');
insert into clientes values(null,'Laura','Georgeff','56565','Berutti 2589','');
insert into clientes (codigo,nombre,apellido,cuit,direccion) values (null,'jose','sanchez','xxxxx','chile 150');
insert into clientes values (null,'marta','martinez','xxxxx','florida 150','');
insert into clientes (nombre,apellido,cuit,direccion) values ('carlos','flores','xxxxx','bolivar 150');
insert into clientes values (20,'Romeo','Lopez','34343434','Anchorena 950','');
insert into clientes (nombre,apellido,cuit,direccion) values ('Florencia','Salinas','82828282','W.Morris 3420');
insert into clientes (apellido,nombre,direccion) values ('Ana','Salone',null);


show tables;
describe clientes;
select * from clientes;

describe articulos;
select * from articulos;

describe facturas;
select * from facturas;


-- ------------------------
-- Definiciones importantes
-- ------------------------


-- Significado de SQL
-- Structured Query Language

-- ANSI SQL
-- En la actualidad el SQL es el estándar de facto de la inmensa mayoría de los SGBD comerciales.
-- Y, aunque la diversidad de añadidos particulares que incluyen las distintas implementaciones
-- comerciales del lenguaje es amplia, el soporte al estándar SQL-92 es general y muy amplio.


-- DDL (DATA DEFINITION LANGUAGE)
-- Create table
-- Alter table
-- Drop table

-- DML (DATA MANIPULATION LANGUAGE)
-- Select
-- Insert
-- Update
-- Delete

-- Comando DML Select

-- * comodin para mostrar todos los campos
select * from clientes;

select nombre,apellido from clientes;
select apellido, nombre, apellido, curdate() fecha_actual from clientes;

-- columnas calculadas
select * from facturas;
select letra,numero,fecha,monto, round(monto*1.21,2) valor_iva from facturas;
select *, round(monto*1.21,2) valor_iva from facturas;  -- No ANSI

-- filtrado con Where
select * from clientes where nombre='laura';

-- Operadores Relacionales
-- =	igual
-- != 	no igual
-- <>	distinto
-- >	mayor
-- <	menor
-- >=	mayor o igual
-- <=	menor o igual

select * from clientes where nombre != 'laura';
select * from clientes where nombre <> 'laura';

select * from facturas where monto < 1000;
select * from facturas where monto >=1000;

insert into clientes (nombre,apellido) values
	('Juan','Gomez'),
    ('Juan','Torres'),
    ('Juan','Mendez'),
    ('Diego','Perez'),
    ('Laura','Perez');

-- Operadores logicos and or
select * from clientes where nombre='juan' and apellido='perez';
select * from clientes where nombre='juan' or apellido='perez';

-- facturas con monto entre 300 y 400$
select * from facturas where monto>=300 and monto<=400;

-- facturas con monto no este entre 300 y 400$
select * from facturas where monto<300 or monto>400;

-- Operador Between y not between
select * from facturas where monto between 300 and 400;
select * from facturas where monto not between 300 and 400;

-- Operador In not in
select * from clientes 
	where codigo=3
	or codigo=5
    or codigo=8
    or codigo=12
    or codigo=13;

select * from clientes where codigo in(3, 5, 8, 12 ,13);
select * from clientes where codigo not in(3, 5, 8, 12 ,13);

-- valores null
insert into clientes (nombre,apellido,direccion) values
	('Omar','Perez',''),
    ('Andrea','Moretti',null);
    
    
select * from clientes where direccion ='';
select * from clientes where direccion is null;
select * from clientes where direccion is not null;  

select * from clientes where direccion = null;	-- no funciona  

-- Busqueda de expresiones con like

insert into clientes (nombre,apellido) values
	('Martina','Ferrero'),('Martin','Ferrero'),
    ('Magali','Ferrero'),('Marina','Ferrero'),
    ('Mirta','Ferrero'),('Monica','Ferrero'),
    ('Armando','Ferrero'),('Omar','Ferrero'),
    ('Melina','Ferrero'),('Marta','Ferrero');

insert into clientes (nombre,apellido) values
	('Ana','Ferrero'),('Jose','Ferrero'),
    ('Mercedes','Ferrero'),('Marcelo','Ferrero'),
    ('Marcela','Ferrero'),('Miguel','Ferrero');

select * from clientes where nombre not like 'm%';
select * from clientes where nombre like 'm%';
select * from clientes where nombre like 'ma%';
select * from clientes where nombre like 'mar%';
select * from clientes where nombre like '%a';
select * from clientes where nombre like 'm%a';

select * from clientes where nombre like 'm%' or nombre like 'l%'; 

select * from clientes where nombre like '%ar%';

select * from clientes where nombre like 'm_r%';
select * from clientes where nombre like '___';
select * from clientes where nombre like '____';
select * from clientes where nombre like '_____';
select * from clientes where nombre like '_____%';


insert into articulos (nombre,precio,stock) values 
	('Lampara led 9w',230,20);

insert into articulos (nombre,precio,stock) values 
	('Lampara led 5w',70,20);
insert into articulos (nombre,precio,stock) values 
	('Lampara led 7w',85,20);
insert into articulos (nombre,precio,stock) values 
	('Lampara led 9w',90,20);


-- order by
select * from clientes;
select * from clientes order by nombre;
select * from clientes order by nombre asc;
select * from clientes order by nombre desc;
select * from clientes order by apellido, nombre;

-- Laboratorio
-- Basándose en la tabla artículos obtener los siguientes listados.

-- a-	artículos con precio mayor a 100
select * from articulos where precio > 100;

-- b-	artículos con precio entre 20 y 40 (usar < y >)
select * from articulos where precio >=20 or precio <= 40; 

-- c-	artículos con precio entre 40 y 60 (usar BETWEEN)
select * from articulos where precio between 40 and 60; 

-- d-	artículos con precio = 20 y stock mayor a 30
select * from articulos where precio = 20 and stock > 30;

-- e-	artículos con precio (12,20,30) no usar IN
select * from articulos where precio = 12 or precio = 20 or precio = 30; 

-- f-	artículos con precio (12,20,30) usar el IN
select * from articulos where precio in (12, 20, 30);

-- g-	artículos que su precio no sea (12,20,30)
select * from articulos where precio != 12 and precio != 20 and precio != 30; 
select * from articulos where precio not in (12,20,30); 

-- h-   artículos que su precio mas iva(21 %) sea mayor a 100
select * from articulos where precio*1.21>100;

-- i-   listar nombre y stock de los artículos que no cuesten $100
select nombre, stock from articulos where precio != 100; 
describe articulos;

-- j- 	artículos con nombre que contenga la cadena 'lampara' (usar like)
select * from articulos where nombre like '%lampara%'; 

-- k-   artículos que su precio sea menor que 200 y en su nombre no contenga la letra 'a'
select * from articulos where precio < 200 and nombre not like '%a%'; 

-- 	2- Listar los artículos ordenados por precio de mayor a menor, 
--     si hubiera precio iguales deben quedar ordenados por nombre.
select * from articulos order by precio desc, nombre asc;

-- 	3- Listar todos los artículos incluyendo una columna denominada precio con IVA, 
--     la cual deberá tener el monto con el iva del producto.
select codigo,nombre,precio,round(precio*1.21,2) precio_con_iva, stock
	from articulos;

-- 	4- Listar todos los artículos incluyendo una columna denominada 'cantidad de cuotas' 
--     y otra 'valor de cuota', la cantidad es fija y es 3, 
--     el valor de cuota corresponde a 1/3 del monto con un 5% de interés.
select codigo,nombre,precio, 3 cantidad_de_cuotas, round(precio/3*1.05,2) valor_cuota, stock
	from articulos;

