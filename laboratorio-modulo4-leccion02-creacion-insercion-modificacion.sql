--laboratorio-modulo4-leccion02-creacion-insercion-modificacion
Ejercicio 1: Creación de la Base de Datos y Tablas
1. Crear una base de datos** llamada logistica.
	-- lo dejo comentado porque ya la cree con el mouse.
	 CREATE DATABASE logistica;

2. Dentro de la base de datos, crea las siguientes tablas:

   - **Clientes**: Incluye campos como `id_cliente` (clave primaria), `nombre`, `email`, `direccion`, `telefono`, `pais`.

   - **Empleados**: Incluye campos como `id_empleado` (clave primaria), `nombre`, `cargo`, `email`.

   - **Proveedores**: Incluye campos como `id_proveedor` (clave primaria), `nombre`, `contacto`, `telefono`, `direccion`.

   - **Envíos**: Incluye campos como `id_envio` (clave primaria), `id_cliente` (clave foránea), `id_empleado` (clave foránea), `id_proveedor` (clave foránea), `fecha_envio`, `estado`, `total`.

   - **Detalle de Envíos**: Incluye campos como `id_detalle` (clave primaria), `id_envio` (clave foránea), `producto`, `cantidad`, `precio_unitario`.
   
   - **Regiones**: Incluye campos como `id_region` (clave primaria), `nombre`, `pais`.


create table clientes(
	id_cliente SERIAL primary key,
	nombre varchar(100) not null,
	email varchar(100) unique not null,
	direccion varchar(100) not null,
	telefono numeric not null,
	pais varchar(100) not null
);

	
create table empleados(
	id_empleado SERIAL primary key,
	nombre varchar(100) not null,
	cargo varchar(100) not null,
	email varchar(100) unique not null
);

create table proveedores(
	id_proveedor SERIAL primary key,
	nombre varchar(100) not null,
	contacto varchar(100) not null,
	telefono int not null,
	direccion varchar(100) not null
);

create table envios(
	id_envio SERIAL primary key,
	id_cliente int not null,
	id_empleado int not null,
	id_proveedor int not null,
	fecha_envio date not null,
	estado varchar(100) not null,
	total decimal not null,
	foreign key (id_cliente) references clientes(id_cliente) on delete restrict on update cascade,
	foreign key (id_empleado) references empleados(id_empleado) on delete restrict on update cascade,
	foreign key (id_proveedor) references proveedores(id_proveedor) on delete restrict on update cascade
);

create table detalles_envios(
	id_detalle SERIAL primary key,
	id_envio int not null,
	producto varchar(100) not null,
	cantidad decimal not null,
	precio_unitario decimal not null,
	foreign key (id_envio) references envios(id_envio) on delete restrict on update cascade
);

create table regiones(
	id_region SERIAL primary key,
	nombre varchar(100) not null,
	pais varchar(100) not null
);
Ejercicio 2: Inserción de Datos
:

insert into Clientes (nombre, email, direccion, telefono, pais) VALUES
('Cliente 1', 'cliente1@example.com', 'Direccion 1', '600123456', 'España'),
('Cliente 2', 'cliente2@example.com', 'Direccion 2', '600123457', 'España'),
('Cliente 3', 'cliente3@example.com', 'Direccion 3', '600123458', 'Portugal'),
('Cliente 4', 'cliente4@example.com', 'Direccion 4', '600123459', 'Francia'),
('Cliente 5', 'cliente5@example.com', 'Direccion 5', '600123460', 'Italia'),
('Cliente 6', 'cliente6@example.com', 'Direccion 6', '600123461', 'España'),
('Cliente 7', 'cliente7@example.com', 'Direccion 7', '600123462', 'Alemania'),
('Cliente 8', 'cliente8@example.com', 'Direccion 8', '600123463', 'España'),
('Cliente 9', 'cliente9@example.com', 'Direccion 9', '600123464', 'Portugal'),
('Cliente 10', 'cliente10@example.com', 'Direccion 10', '600123465', 'España');



insert into Empleados (nombre, cargo, email) VALUES
('Empleado 1', 'Supervisor de Envíos', 'empleado1@example.com'),
('Empleado 2', 'Gerente', 'empleado2@example.com'),
('Empleado 3', 'Asistente de Logística', 'empleado3@example.com'),
('Empleado 4', 'Coordinador de Envíos', 'empleado4@example.com'),
('Empleado 5', 'Director de Operaciones', 'empleado5@example.com');


insert into proveedores (nombre, contacto, telefono, direccion)
values 
('Distribuidora Central', 'Proveedor 1', 987654321, 'Calle Comercio, 90'),
('Almacenes Globales', 'Proveedor 2', 912345678, 'Avenida Empresarial, 23'),
('Proveedora Latina', 'Proveedor 3', 987321654, 'Calle Industrial, 45');

insert into Envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total) 
values
(1, 1, 1, '2024-10-01', 'Enviado', 350.75),
(2, 2, 2, '2024-10-02', 'Enviado', 500.50),
(3, 3, 1, '2024-10-03', 'En camino', 600.90),
(4, 4, 3, '2024-10-04', 'Pendiente', 750.00),
(5, 5, 1, '2024-10-05', 'Enviado', 200.25),
(6, 2, 2, '2024-10-06', 'Enviado', 850.00),
(7, 3, 3, '2024-10-07', 'En camino', 620.50),
(8, 4, 2, '2024-10-08', 'Enviado', 900.75);



insert into detalles_envios (id_envio, producto, cantidad, precio_unitario)
values
(1, 'Producto A', 2, 50.85),
(1, 'Producto B', 1, 100.25),
(2, 'Producto C', 10, 50.05),
(3, 'Producto A', 7, 70.15),
(4, 'Producto D', 8, 100.00),
(5, 'Producto E', 2, 100.12),
(6, 'Producto B', 6, 30.20),
(7, 'Producto C', 4, 50.05),
(8, 'Producto A', 12, 70.15);



INSERT INTO Regiones (nombre, pais) VALUES
('Caracas', 'Venezuela'),
('Segovia', 'España'),
('Cancún', 'México'),
('Santiago', 'Chile'),
('Medellín', 'Colombia');

Ejercicio 3: Modificación y Actualización de Datos


1. Actualizar el Estado de un Envío. Actualiza el estado del envío con `id_envio = 3` a "Entregado".

update envios
set estado = 'Entregado'
where id_envio = 3;

2. Modificar el Cargo de un Empleado. Cambia el cargo del empleado con `id_empleado = 5` a "Director de Datos".
update empleados
set cargo = 'Director de Datos'
where id_empleado = 5;

3. Incrementar el Precio Unitario de un Producto. Incrementa en un 10% el precio unitario del producto "Producto A" en la tabla `Detalle_Envíos`.
update detalles_envios
set precio_unitario = precio_unitario * 1.1
where producto = 'Producto A';

-- 4. Actualizar la Dirección de un Cliente. Modifica la dirección del cliente con `id_cliente = 2` a "Nueva Calle B, 123".
update clientes
set direccion = 'Nueva Calle B, 123'
where id_cliente = 2;





