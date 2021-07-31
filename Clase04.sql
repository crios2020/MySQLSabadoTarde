-- Laboratorio

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
insert into autos(marca,modelo,color,anio,precio) values ('Ford','Ka','Negro',2012,700000); 
insert into autos(marca,modelo,color,anio,precio) values ('Ford','Ka','Rojo',2014,800000); 
insert into autos(marca,modelo,color,anio,precio) values ('Ford','Ka','Negro',2009,400000); 
insert into autos(marca,modelo,color,anio,precio) values ('Ford','Mondeo','Negro',2011,800000); 
insert into autos(marca,modelo,color,anio,precio) values ('Ford','Mondeo','Azul',2015,1000000); 
insert into autos(marca,modelo,color,anio,precio) values ('VW','Passat','Gris',2019,1300000); 
insert into autos(marca,modelo,color,anio,precio) values ('Ford','Ka','Negro',2011,600000); 
insert into autos(marca,modelo,color,anio,precio) values ('VW','Passat','Rojo',2015,1000000); 
insert into autos(marca,modelo,color,anio,precio) values ('VW','Passat','Azul',2012,9000000); 
insert into autos(marca,modelo,color,anio,precio) values ('Toyota','Ethios','Gris',2019,800000); 
insert into autos(marca,modelo,color,anio,precio) values ('Toyota','Ethios','Gris',2019,800000.34567); 
insert into autos(marca,modelo,color,anio,precio) values ('Renault','12','Azul',1992,400000); 

insert into autos(marca,modelo,color,anio,precio) values ('VW','Passat','Gris',2016,1300000); 
insert into autos(marca,modelo,color,anio,precio) values ('Ford','Ka','Negro',2016,600000); 
insert into autos(marca,modelo,color,anio,precio) values ('VW','Passat','Rojo',2017,1000000); 
insert into autos(marca,modelo,color,anio,precio) values ('VW','Passat','Azul',2018,9000000); 
insert into autos(marca,modelo,color,anio,precio) values ('Toyota','Ethios','Gris',2018,800000); 
insert into autos(marca,modelo,color,anio,precio) values ('Toyota','Ethios','Gris',2017,800000.34567); 
insert into autos(marca,modelo,color,anio,precio) values ('Renault','12','Azul',2016,400000); 
insert into autos(marca,modelo,color,anio,precio) values ('Renault','12','Azul',1973,200000); 

select * from autos;

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
select count(*) 'cantidad de autos' from autos;

-- 	g. obtener la cantidad de autos que tienen un precio entre $235.000 y $240.000.
select count(*) cantidad_de_autos from autos where precio between 235000 and 240000; 

-- 	h. obtener la cantidad de autos que hay en cada año.
select anio año, count(*) 'cantidad de autos' from autos group by anio; 

-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
select anio año, count(*) 'cantidad de autos', round(avg(precio),2) 'precio promedio' from autos group by anio;

-- 	j. obtener la suma de precios y el promedio de precios según marca.
select marca, round(sum(precio),2) precio_total, round(avg(precio),2) precio_promedio from autos group by marca; 

--  k. informar los autos con el menor precio.
select min(precio) precio_minimo from autos;
select * from autos where precio=400000; 
select * from autos where precio=(select min(precio) precio_minimo from autos);

--  l. informar los autos con el menor precio entre los años 2016 y 2018.
select min(precio) precio_minimo from autos where anio between 2016 and 2018;
select * from autos where anio between 2016 and 2018 
	and precio=(select min(precio) precio_minimo from autos where anio between 2016 and 2018);

-- error
-- select * from autos where precio=(select min(precio) precio_minimo from autos where anio between 2016 and 2018);

-- error
-- select * from autos where anio between 2016 and 2018 
-- 	and precio=(select min(precio) precio_minimo from autos);
    
    
--  m. listar los autos ordenados ascendentemente por marca,modelo,año.
select * from autos order by marca, modelo, anio; 

--  n. contar cuantos autos hay de cada marca.
select marca, count(*) cant_autos_por_marca from autos group by marca; 

--  o. borrar los autos del siglo pasado.
set sql_safe_updates = 0;
delete from autos where anio <2000; 


use negocio;
select * from facturas;
-- total facturado por año?
select *, year(fecha) año from facturas;
select year(fecha) año, sum(monto) total from facturas group by año;
select year(fecha) año, sum(monto) total from facturas group by year(fecha);

use negocio;

-- Clave Foranea (foreign key) FK
alter table facturas add codigoCliente int;
alter table facturas
	add constraint FK_Facturas_CodigoCliente
    foreign key(codigoCliente)
    references clientes(codigo);
    
describe facturas;
select * from facturas;
select * from clientes;
update facturas set codigoCliente=1 where numero=1;
update facturas set codigoCliente=2 where numero=2;
update facturas set codigoCliente=2 where numero=3;
update facturas set codigoCliente=2 where numero=4;
update facturas set codigoCliente=4 where numero=5;
update facturas set codigoCliente=5 where numero=6;
update facturas set codigoCliente=8 where numero>=7;

-- Consulta del producto cartesiano
select * from clientes,facturas;
select count(*) cantidad from clientes;				-- 74 clientes
select count(*) cantidad from facturas;				-- 10 facturas
select count(*) cantidad from clientes,facturas;	-- 740 registros

-- Consulta del producto relacionado
select * from clientes,facturas where codigo=codigoCliente;

-- uso del alias en tabla
select * from clientes, facturas where clientes.codigo=facturas.codigoCliente;
select * from clientes c, facturas f where c.codigo=f.codigoCliente;

-- Uso del Join
select * from clientes c join facturas f on c.codigo=f.codigoCliente;

-- Left Join
select * from clientes c left join facturas f on c.codigo=f.codigoCliente;

-- Right Join 
select * from clientes c right join facturas f on c.codigo=f.codigoCliente;

-- Quienes (nombre apellido) compraron en el dia de hoy?
select distinct nombre,apellido from clientes c join facturas f on c.codigo=f.codigoCliente where fecha=curdate();

-- Cuales son las facturas de Juan Perez?
select letra,numero,fecha,monto 
	from clientes c join facturas f on c.codigo=f.codigoCliente 
	where nombre='Juan' and apellido='Perez';

-- Cuanto es el total facturado a Jose Benuto?
select sum(monto) total from clientes c join facturas f on c.codigo=f.codigoCliente 
	where nombre='Jose' and apellido='Benuto';
    
    