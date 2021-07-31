-- Ampliación de la base Negocio, se agregan relaciones y tabla detalles
-- Requiere tener la base negocio

use negocio;

-- declaro la Foreign Key FK
alter table facturas add codigocliente integer not null;


-- cargamos todas las facturas a los clientes 1,2,3 y 4 para despues poder crear la restriccion fk
set sql_safe_updates=0;
update facturas set codigocliente=1 where letra='a';
update facturas set codigocliente=2 where letra='b';
update facturas set codigocliente=3 where letra='c';
update facturas set codigocliente=4 where letra='f';

alter table facturas
add constraint FK_facturas_codcli
foreign key (codigocliente)
references clientes(codigo)
on delete cascade;

insert into facturas values ('a',1050,curdate(),250,1);

-- ------------------------
-- Agrego la tabla detalles
-- ------------------------

create table detalles(
letra char(1) not null,
numero int not null,
codigo int not null,
cantidad int unsigned not null,
primary key(letra,numero,codigo)
);

-- ------------------------
-- inserto detalles de las facturas
-- ------------------------

insert into detalles values('a',1,3,10);
insert into detalles values('a',1,1,3);
insert into detalles values('a',1,5,3);
insert into detalles values('a',2,3,10);
insert into detalles values('b',3,3,10);

alter table detalles
add constraint FK_facturas_letra_numero
foreign key (letra,numero)
references facturas(letra,numero)
on delete cascade;

