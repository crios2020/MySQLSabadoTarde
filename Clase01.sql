/*

	Curso: Introducción a las bases de datos y SQL
	Duración: 12 horas
	Días: Sábados 15:00 a 18:00 hs
	Profesor: Carlos Ríos	carlos.rios@educacionit.com
	
	Materiales: alumni.educacionit.com
				user: email
				pass: dni

	Github: https://github.com/crios2020/MySQLSabadoTarde
	
	Software:		
					Server		MySQL Community Server o MariaDB Server
	
					Client		MySQL WorkBench
	

	Paquete XAMPP	apachefriends.org
	
			X			Windows - Linux - OSX
			A			Apache Web Server
			M			MySQL Community Server - Maria DB Server
			P			PHP
			P			Perl
			
	Paquete WAMP	wampserver.com
	Paquete MAMP	Mac OS
	Paquete LAMP	Linux
	Paquete appsrv	Windows

*/

-- Linea de comentarios
/* Bloque de comentarios */

select version();			-- Devuelve la versión del server

-- ;  es el terminador de sentencias
-- control enter

SELECT VERSION();
-- el lenguaje no es case sensitive

show databases;				-- Muestra el catalogo de bases del servidor

create database cursoSabado;	-- crea una bd

CREATE DATABASE CURSOSABADO;

use cursoSabado;			-- activa la BD

show tables;				-- Muestra el catalogo de tablas

create table clientes( 
	codigo int auto_increment primary key,
	nombre varchar(25) not null,
	apellido varchar(25) not null,    
	cuit char(13),    
	direccion varchar(50),
	comentarios varchar(255)
);

describe clientes; 

select * from clientes; -- lista los registros de la tabla

insert into clientes (nombre,apellido,direccion) values ('Ana','Garcia','Lima 222');
insert into clientes (nombre,apellido,cuit,direccion) values ('Ana','Garcia','1234567890123','Lima 222');


-- -----------------------------------
-- Tipos de datos más comunes en MySQL
-- -----------------------------------


-- Tipo de datos Texto de datos más comunes

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- char(x)		x			
-- varchar(x)	x+1


/*
		nombre char(20)
        
        |ANA                 |			20 bytes
        |CARLOS              |			20 bytes
        |MAXIMILIANO         |			20 bytes
							Total:		60 bytes
                            
		nombre varchar(20)
        |ANA                 |			 3 + 1 =  4 bytes
        |CARLOS              |			 6 + 1 =  7 bytes
        |MAXIMILIANO         | 			11 + 1 = 12 bytes
									Total:		 23 bytes
                                    
		DNI	varchar(8)	8+1=9
        DNI char(8)			8
        

*/



-- Tipo de datos Numérico

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- bool (boolean)	1	(0 es false distinto de 0 es true)
-- tinyint			1	2^8			256
-- smallint			2	2^16		65536
-- mediumint		3	2^24		16777216
-- int (integer)	4	2^32		4294967296
-- bigint			8	2^64		18446744073709551616
-- float			4	 		
-- double			8
-- decimal(t,d)		t+2 

/*

	codigo tinyint auto_increment primary,  (signed)
    
    
    |-------|--------|
  -128      0       127


	codigo tinyint unsigned auto_increment primary,
    
    |----------------|
    0				255

*/


-- Tipo de datos Fecha y Hora

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- date		3	Año Mes Dia ‘2012-10-25’		
-- datetime	8
-- time		3
-- year		1


-- Falta float double decimal y fecha hora

