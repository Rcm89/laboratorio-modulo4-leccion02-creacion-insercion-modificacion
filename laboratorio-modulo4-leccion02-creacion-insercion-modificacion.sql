# laboratorio-modulo4-leccion02-creacion-insercion-modificacion
# Ejercicio 1: Creación de la Base de Datos y Tablas
1. **Crear una base de datos** llamada logistica.
-- Creamos la base de datos haciendo click con el derecho en bases de datos y nombrándola logistica
-- y poniendo postgres de user 

2. Dentro de la base de datos, crea las siguientes tablas:

   - **Clientes**: Incluye campos como `id_cliente` (clave primaria), `nombre`, `email`, `direccion`, `telefono`, `pais`.

   - **Empleados**: Incluye campos como `id_empleado` (clave primaria), `nombre`, `cargo`, `email`.

   - **Proveedores**: Incluye campos como `id_proveedor` (clave primaria), `nombre`, `contacto`, `telefono`, `direccion`.

   - **Envíos**: Incluye campos como `id_envio` (clave primaria), `id_cliente` (clave foránea), `id_empleado` (clave foránea), `id_proveedor` (clave foránea), `fecha_envio`, `estado`, `total`.

   - **Detalle de Envíos**: Incluye campos como `id_detalle` (clave primaria), `id_envio` (clave foránea), `producto`, `cantidad`, `precio_unitario`.

CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    genero CHAR(1) CHECK (genero IN ('M', 'F')),
    fecha_nacimiento DATE CHECK (fecha_nacimiento < CURRENT_DATE)
);
