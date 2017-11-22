CREATE DATABASE bd_banco;
--DROP DATABASE bd_banco;
use bd_banco;

CREATE TABLE privilegio(
    id int auto_increment,
    descripcion varchar(50),
    primary key(id)
);

CREATE TABLE usuario(
    id int auto_increment,
    rut varchar(50),
    nombre varchar(50),
    direccion varchar(100),
    saldo int,
    pass varchar(50),
    privilegio int,
    primary key(id),
    foreign key(privilegio) references privilegio(id)
);

CREATE TABLE tipoCuenta(
    id int auto_increment,
    descripcion varchar(100),
    primary key(id)
);
/*
CREATE TABLE cuenta(
    id int auto_increment,
    nombreOrigen varchar(50),
    idRecibir int,
    monto int,
    idTipoCuenta int,
    primary key(id),
    foreign key(idTipoCuenta) references tipoCuenta(id),
    foreign key(idRecibir) references usuario(id)
);
*/

CREATE TABLE transferir(
    id int auto_increment,
    idUsuario int,
    usuarioCuenta varchar(50), --RUT
    idTipoCuenta int,  
    monto int,
    detalle varchar(100),
    primary key(id),
    foreign key(idUsuario) references Usuario(id),
    foreign key(idTipoCuenta) references tipoCuenta(id)
);
/*

CREATE TABLE detalle(
    id int auto_increment,
    idDuenio varchar(50),
    fecha varchar(50),
    descripcion varchar(100),
    monto int, 
    saldo int,  
    primary key(id)
);

CREATE TABLE verificarSeguridad(
    id int auto_increment,
    idUsuario int,
    pregunta varchar(50),
    respuesta varchar(50),
    primary key(id),
    foreign key(idUsuario) references usuario(id)
);

CREATE TABLE tarjetaTransferencia(
    id int auto_increment,
    idUsuario int,
    rutUsuario varchar(50),
    digitos varchar(200),
    estado varchar(50),
    primary key(id),
    foreign key(rutUsuario) references usuario(rut)
);
*/
SELECT * FROM privilegio;
SELECT * FROM detalle;
SELECT * FROM tarjetaTransferencia;
SELECT * FROM tipoCuenta;
SELECT * FROM cuenta;
SELECT * FROM usuario;
SELECT * FROM verificarSeguridad;

select * from usuario where rut = '11-1' and pass = '123456';

insert into privilegio values(null,'Ejecutivo');
insert into privilegio values(null,'Simple Mortal');
insert into privilegio values(null,'Dios');

insert into usuario values(null,'11-1','Rick Sanchez','Universo 30-D',120000,'123456',3);
insert into usuario values(null,'22-2','Morty','Universo 30-D',980000,'123456',1);
insert into usuario values(null,'33-3','Jhon Salchichon','La legua',8000,'123456',2);

insert into tipoCuenta values(null,'Cuenta Rut');
insert into tipoCuenta values(null,'Cuenta Corriente');
insert into tipoCuenta values(null,'Cuenta de Ahorro');

insert into transferir values(null,1,'11-1',2,1800000,'Deposito desde la nasa');

select * from tipoCuenta;

select usuario.saldo from usuario;


--Select no peruanos
SELECT usuario.id, usuario.rut, usuario.nombre, usuario.direccion, 
usuario.saldo, usuario.pass, privilegio.descripcion
FROM usuario
INNER JOIN privilegio ON usuario.privilegio = privilegio.id;

SELECT SUM(saldo), SUM(monto) from usuario, transferir where rut = '11-1';
UPDATE usuario SET saldo = saldo + '9999' where rut = '44-4';

SELECT usuario.id, usuario.rut, usuario.nombre, usuario.direccion, usuario.saldo, usuario.pass, privilegio.descripcion, tipocuenta.descripcion
FROM usuario 
INNER JOIN privilegio ON usuario.privilegio = privilegio.id
INNER JOIN transferir ON usuario.id = transferir.idUsuario
INNER JOIN tipocuenta ON transferir.idTipoCuenta = tipocuenta.id;


