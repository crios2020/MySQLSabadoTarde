-- Clase 03
use negocio;

-- comando DML delete		ANSI
select * from clientes;

delete from clientes where codigo=40;

delete from clientes where codigo>=20;

delete from clientes;		-- Borra todos los registros

truncate clientes;			-- Trunca la tabla DDL

-- desactivamos la protección safe updates.
set sql_safe_updates = 0;

insert into clientes (codigo,nombre,apellido) values (100,'Homero','Simpson');
delete from clientes where codigo=100;
insert into clientes (nombre,apellido) values ('Bart','Simpson');

-- comando DDL Update ANSI
select * from clientes;
update clientes set nombre='Javier' where codigo=2;
update clientes set nombre='Valeria', apellido='Naco', cuit='12345678' where codigo=3;
update clientes set direccion='Larrea 234' where codigo=7;

update clientes set nombre='';
update clientes set nombre='Juan';

select * from clientes;

-- comando DDL Insert

-- Insert Modo normal con definición de campos		ANSI
insert into clientes (nombre,apellido,direccion) values ('Mariana','Garcia','Lemos 234');

-- Insert Modo Abreviado sin definición de campos 	ANSI
insert into clientes values (null,'Mariana','Herrera','23444','Laprida 2345',null);

-- Insert SET			No ANSI
insert clientes set nombre='Mario', apellido='Molina';

-- Insert masivo		ANSI
insert into clientes (nombre,apellido) values 
	('Cristina','Scotti'),
    ('Melina','Miguel'),
    ('Paula','Puppo'),
    ('Martin','Hussien');
    
update clientes set edad=34 where codigo=1;

-- Alter Table DDL
-- Alter table add
alter table clientes add edad int after apellido;
describe clientes;

update clientes set edad=34 where codigo=1;
update clientes set edad=38 where codigo=2;
select * from clientes;

-- Alter table modify
alter table clientes modify edad tinyint unsigned;

-- alter table drop
alter table clientes drop edad;


-- Funciones de agrupamiento.

-- funcion max(arg) 	arg: numero texto o fecha
select max(monto) from facturas;
select max(monto) monto_maximo from facturas;

select max(nombre) ultimo_nombre from clientes;

select max(fecha) ultima_factura from facturas;

-- funcion min(arg) 	arg: numero texto o fecha
select min(monto) monto_minimo from facturas;

select min(nombre) primer_nombre from clientes;

select min(fecha) primer_fecha from facturas;

-- función sum(numero)
select sum(monto) total from facturas;

-- función avg(numero)
select avg(monto) promedio from facturas;

-- función count(*)
select count(*) cantidad from facturas;
select count(*) cantidad from clientes;					-- 74 clientes
select count(direccion) cantidad from clientes;			-- 22 cliente con dirección


-- subconsultas	-	subQueries
select max(monto) monto_maximo from facturas;			-- 2500

select * from facturas where monto=2500;

select * from facturas where monto=(select max(monto) monto_maximo from facturas);
select * from facturas where monto=(select max(monto) monto_maximo from facturas where fecha=curdate()) and fecha=curdate();

select count(*) cantidad from clientes where direccion is null;

-- agrupamientos con group by
select letra, sum(monto) total from facturas where  letra='a';
select letra, sum(monto) total from facturas where  letra='b';
select letra, sum(monto) total from facturas where  letra='c';

select letra, sum(monto) total from facturas group by letra;

/*
		letra	total
			a	3890
			b  	1000
            c 	 300
            
            
*/

select fecha, sum(monto) total from facturas group by fecha;

select year(fecha) año, sum(monto) total from facturas group by year(fecha);

select letra, sum(monto) total from facturas group by letra having total>=1000;


-- 1- Crear la tabla 'autos' en una nueva base de datos (Vehiculos) con el siguiente detalle:

-- 	codigo	INTEGER y PK
-- 	marca	VARCHAR(25)
-- 	modelo	VARCHAR(25)
-- 	color	VARCHAR(25)
-- 	anio	INTEGER
-- 	precio	DOUBLE

--  nota: (anio - año) seguramente tu computadora tiene soporte para la letra ñ,
--        pero muchas instalaciones (ej: web host alquilados) pueden que no tenga soporte para esa letra.
-- 		  en programación se acostumbra a usar los caracteres menores a 128 en la tabla ASCII.

drop database if exists vehiculos;
create database vehiculos;
use vehiculos;
create table autos(
	codigo int auto_increment primary key,
    marca varchar(25),
    modelo varchar(25),
    color varchar(25),
    anio int,
    precio double
);


-- 2- Agregar el campo patente despues del campo modelo.
alter table autos add patente char(9);

-- 3- Cargar la tabla con 15 autos (hacerlo con MySQL WorkBench o el INSERT INTO).
insert into autos(marca,modelo,color,anio,precio) values ('Ford','Ka','Negro',2011,600000);

-- 4- Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
select max(precio) precio_máximo from autos;

-- 	b. obtener el precio mínimo.
Select min(precio) precio_minimo from autos; 

-- 	c. obtener el precio mínimo entre los años 2010 y 2018.
select min(precio) precio_minimo from autos where anio between 2010 and 2018;

-- 	d. obtener el precio promedio.
select avg(precio) precio_promedio from autos;

-- 	e. obtener el precio promedio del año 2016.
select avg(precio) precio_promedio from autos where anio=2016;

-- 	f. obtener la cantidad de autos.
-- 	g. obtener la cantidad de autos que tienen un precio entre $235.000 y $240.000.
-- 	h. obtener la cantidad de autos que hay en cada año.
-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
-- 	j. obtener la suma de precios y el promedio de precios según marca.
--  k. informar los autos con el menor precio.
--  l. informar los autos con el menor precio entre los años 2016 y 2018.
--  m. listar los autos ordenados ascendentemente por marca,modelo,año.
--  n. contar cuantos autos hay de cada marca.
--  o. borrar los autos del siglo pasado.






