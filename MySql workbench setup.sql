create database workbenchsetup;

USE workbenchsetup;

create table tabla_de_querys
(
    Id int not null AUTO_INCREMENT,
    Nombre varchar(255),
    Edad int,
    primary key (Id)
);

use workbenchsetup;
insert into tabla_de_querys
(
    Nombre,
    Edad
)
values
(
    'Ariel',
    29
);

use workbenchsetup;
insert into tabla_de_querys
(
    Nombre,
    Edad
)
values
(
    'Camila',
    24
);


insert into tabla_de_querys
(
    Nombre,
    Edad
)
values
(
    'Nole',
    34
);

use workbenchsetup;
select * from tabla_de_querys;

use workbenchsetup;
update tabla_de_querys
set Edad = 33
where Nombre = 'Nole';

use workbenchsetup;
delete from tabla_de_querys where Id > 1;