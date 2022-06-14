

CREATE TABLE USUARIO(
id_usuario int PRIMARY KEY identity NOT NULL,
nombre_u text,
apellidos_u text,
telefono_u text,
contraseña_u text,
tipo_u TEXT);

CREATE TABLE PERMISOS(
id_permiso int PRIMARY KEY identity NOT NULL,
nombre_permiso text);

CREATE TABLE usu_per(
id_permiso int,
id_usuario int,
FOREIGN KEY (id_permiso) REFERENCES PERMISOS(id_permiso),
FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario));


CREATE TABLE VENTA(
id_venta int PRIMARY KEY identity NOT NULL,
id_usuario int,
monto DECIMAL (8,2),
FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario));

CREATE TABLE PRODUCTO(
id_producto int  PRIMARY KEY identity NOT NULL,
nombre_producto text,
precio DECIMAL (8,2),
descripcion text);

CREATE TABLE ven_pro(
id_producto int,
id_venta int,
FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto),
FOREIGN KEY (id_venta) REFERENCES VENTA(id_venta));

