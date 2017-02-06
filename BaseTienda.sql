create database TiendaVrt;
use TiendaVrt;
create table Cliente
(
IdCliente int not null,
Nombre varchar(12),
Apellido text,
Direccion text,
Telefono int,
Contraseña text,
primary key(IdCliente)
);
create table Producto
(
CodProducto int not null,
NombreProducto varchar(12),
Precio real,
Cantidad int,
CodCategoria int ,
primary key(CodProducto)
);
create table Categorias
(
CodCategoria int not null,
NombreCategoria varchar(12),
primary key(CodCategoria)
);

create table Compras
(
IdFactura int not null,
CodProducto int not null,
NombreProducto varchar(12),
Precio real,
Cantidad int,
primary key(IdFactura)
);
create table Facturas
(
IdFactura int not null,
IdCliente int,
Fecha date,
Total real,
primary key(Idfactura)
);
alter table Compras add foreign key(CodProducto) references Compras(IdFactura);
alter table Facturas add foreign key(IdCliente) references Cliente(IdCliente);
alter table Compras add foreign key(IdFactura) references Facturas(IdFactura);
alter table Producto add foreign key(CodProducto) references Compras(CodProducto);
#alter table Categorias add foreign key(CodCategoria) references Productos(CodCategoria);

#insertar Cliente
delimiter $$
create procedure InsertarCliente
(

in InsertIdCliente int,
in InsertNombre varchar(12),
in InsertApellido text,
in InsertDireccion text,
in InsertTelefono int,
in InsertContraseña text
)
begin insert into Clientes(

IdCliente,
Nombre,
Apellido,
Direccion,
Telefono,
Contraseña 
)
Values 
(

InsertIdCliente,
InsertNombre,
InsertApellido,
InsertDireccion,
InsertTelefono,
InsertContraseña
);
end $$
delimiter $$

delimiter $$
create procedure modificarCliente
(

in ModIdCliente int,
in ModNombre varchar(12),
in ModApellido text,
in ModDireccion text,
in ModTelefono int,
in ModContraseña text
)
begin 
	update Cliente 
	set Nombre = ModNombre,
	Apellido = ModApellido,
	Direccion = ModDireccion,
	Telefono = ModTelefono,
	Contraseña = ModContraseña
	where ModIdCliente = IdCliente;
end $$
delimiter $$

delimiter $$
create procedure borrarCliente
(
in BorrarIdCliente int
)
begin 
	delete from Cliente 
	where BorrarIdCliente = IdCliente;
end $$
delimiter $$


delimiter $$
create procedure InsertarProducto
(

in InsertarCodProducto int, 
in InsertarNombreProducto varchar(12),
in InsertarPrecio real,
in InsertarCantidad int,
in InsertarCodCategoria int 
)
begin insert into Productos(

CodProducto,
NombreProducto,
Precio,
Cantidad,
CodCategoria
)
Values 
(

InsertarCodProducto, 
InsertarNombreProducto,
InsertarPrecio,
InsertarCantidad,
InsertarCodCategoria 
);
end $$
delimiter $$

delimiter $$
create procedure modificarProducto
(

in ModCodProducto int, 
in ModNombreProducto varchar(12),
in ModPrecio real,
in ModCantidad int,
in ModCodCategoria int 
)
begin 
	update Producto 
	set NombreProducto = ModNombreProducto,
	Precio = ModPrecio,
	Cantidad = ModCantidad
	where ModCodProducto = CodProducto;
end $$
delimiter $$

delimiter $$
create procedure borrarProducto
(
in BorrarCodProducto int
)
begin 
	delete from Producto
	where BorrarCodProducto = CodProducto;
end $$
delimiter $$

delimiter $$
create procedure InsertarCompra
(
in InsertarIdFactura int,
in InsertarCodProducto int,
in InsertarNombreProducto varchar(12),
in InsertarPrecio real,
in InsertarCantidad int
)
begin insert into Compras(
IdFactura,
CodProducto,
NombreProducto,
Preciol,
Cantidad 
)
Values 
(
InsertarIdFactura,
InsertarCodProducto,
InsertarNombreProducto,
InsertarPrecio,
InsertarCantidad 
);
end $$
delimiter $$

delimiter $$
create procedure modificarCompra
(
in ModIdFactura int,
in ModCodProducto int,
in ModNombreProducto varchar(12),
in ModPrecio real,
in ModCantidad int
)
begin 
	update Compras
	set Cantidad = ModCantidad
	where ModCodProducto = CodProducto;
end $$
delimiter $$
create procedure borrarCompra
(
in BorrarCodProducto int
)
begin 
	delete from Compras
	where BorrarCodProducto = CodProducto;
end $$
delimiter $$
