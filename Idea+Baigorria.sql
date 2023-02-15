DROP DATABASE IF EXISTS centro_distribucion;
CREATE DATABASE centro_distribucion;
USE centro_distribucion;

CREATE TABLE IF NOT EXISTS partida(
	id_partida INT UNSIGNED AUTO_INCREMENT PRIMARY KEY UNIQUE,
	fec_elab DATE NOT NULL DEFAULT 19000101,
    fec_venc DATE NOT NULL DEFAULT 20000101
);

CREATE TABLE IF NOT EXISTS productos (
	id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    id_partida INT UNSIGNED,
	CONSTRAINT fk_productos_partida FOREIGN KEY (id_partida) REFERENCES partida (id_partida),
    descripcion VARCHAR(100)
    );
    
CREATE TABLE IF NOT EXISTS cliente(
	id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100),
    mail VARCHAR(100) DEFAULT "cliente@dominio",
    contacto VARCHAR(100)
);
 CREATE TABLE IF NOT EXISTS ventas (
	id_pedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
	id_cliente INT UNSIGNED NOT NULL,
    fecha_venta DATETIME,
    CONSTRAINT fk_ventas_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
 );
 
 CREATE TABLE IF NOT EXISTS codigo_postal(
	id_codigo_postal INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	localidad VARCHAR(70) DEFAULT "Localidad no cargada",
	provincia VARCHAR(70) DEFAULT "Provincia no cargada"
 );
  
 CREATE TABLE IF NOT EXISTS locacion (
	id_locacion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    direccion VARCHAR (100) DEFAULT "Ingrese domicilio",
    id_codigo_postal INT UNSIGNED NOT NULL,
    id_cliente INT UNSIGNED NOT NULL,
    CONSTRAINT fk_locacion_codigo_postal FOREIGN KEY (id_codigo_postal) REFERENCES codigo_postal (id_codigo_postal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_locacion_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
 );
 
 CREATE TABLE IF NOT EXISTS factura(
	id_factura INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    punto_de_venta VARCHAR(4) DEFAULT "XXXX",
    numero VARCHAR(8) DEFAULT "YYYYYYYY",
    impuestos DECIMAL(8,4),
    monto DECIMAL (20,2),
    monto_total DECIMAL (20,2),
    id_pedido INT UNSIGNED NOT NULL,
    CONSTRAINT fk_factura_ventas FOREIGN KEY (id_pedido) REFERENCES ventas (id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
 );

 CREATE TABLE IF NOT EXISTS remito(
	id_remito INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
	id_factura INT UNSIGNED NOT NULL,
    codigo_postal INT UNSIGNED NOT NULL,
    CONSTRAINT fk_remito_factura FOREIGN KEY (id_factura) REFERENCES factura (id_factura) ON DELETE CASCADE ON UPDATE CASCADE,
    domicilio_envio VARCHAR(100) DEFAULT "Domicilio no ingresado",
    CONSTRAINT fk_remito_codigo_postal FOREIGN KEY (codigo_postal) REFERENCES codigo_postal (id_codigo_postal) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS choferes(
	id_chofer INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    nombre VARCHAR (100),
    apellido VARCHAR (100)
);

CREATE TABLE IF NOT EXISTS rack(
	id_rack INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
	fila VARCHAR (3),
    columna VARCHAR (3)
);

CREATE TABLE IF NOT EXISTS pallet(
	id_pallet INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    id_producto INT UNSIGNED NOT NULL,
    id_rack INT UNSIGNED NOT NULL,
    CONSTRAINT fk_pallet_producto FOREIGN KEY (id_producto) REFERENCES productos (id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_pallet_rack FOREIGN KEY (id_rack) REFERENCES rack (id_rack) ON DELETE CASCADE ON UPDATE CASCADE,
    cantidad INT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS despacho(
	id_despacho INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
    id_pedido INT UNSIGNED NOT NULL,
    CONSTRAINT fk_despacho_pedido FOREIGN KEY (id_pedido) REFERENCES ventas (id_pedido),
    fecha DATE DEFAULT 19000101,
    id_pallet INT UNSIGNED NOT NULL,
    id_chofer INT UNSIGNED NOT NULL,
    CONSTRAINT fk_despacho_pallet FOREIGN KEY (id_pallet) REFERENCES pallet (id_pallet) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_chofer_despacho FOREIGN KEY (id_chofer) REFERENCES choferes (id_chofer) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ventas_productos(
	id_pedido INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    CONSTRAINT fk_venpro_ven FOREIGN KEY (id_pedido) REFERENCES ventas (id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_venpro_pro FOREIGN KEY (id_producto) REFERENCES productos (id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
    cantidad INT UNSIGNED NOT NULL
);

-- Script carga de datos

INSERT INTO choferes (id_chofer, nombre, apellido)
VALUES
(1,'Carlos','Saucedo'),
(2,'Miguel','Palacios'),
(3,'Ricardo','Datin'),
(4,'Marcelo','Palacios'),
(5,'Sebastian','Vignolo'),
(6,'Eusebio','Constantino')
;

INSERT INTO cliente (id_cliente, nombre, mail, contacto)
VALUES
(1,'Maxiconsumo','compras@maxiconsumo.com.ar','Federico Valverde'),
(2,'Carefour San Justo','compras_carefour@carefour.com.ar','Alejandro Gomez'),
(3,'Supermercado Luna','sin mail', 'Kin Youn'),
(4,'Carefour Haedo','compras_carefour_haedo@carefour.com.ar','Sebastian Abreu'),
(5,'Carefour Morón','compras_carefour_mo@carefour.com.ar','Cristian Romero'),
(6,'Carefour Vicente Lopez','compras_carefour_vl@carefour.com.ar','Lisandro Martinez'),
(7,'Dia% Ramos Mejía','compras@dia.com.ar','Walter Samuel'),
(8,'Dia% Haedo ','compras@dia.com.ar','Walter Samuel'),
(9,'Dia% Morón','compras@dia.com.ar','Walter Samuel')
;

INSERT INTO codigo_postal (id_codigo_postal, localidad, provincia)
VALUES
(1,"Retiro","CABA"),
(2,"Balvanera","CABA"),
(3,"General Pacheco","Buenos Aires"),
(4,"Moron","Buenos Aires"),
(5,"Salsipuedes","Cordoba"),
(6,"Rosario","Santa Fe"),
(7,"Humahuaca","Jujuy"),
(8,"Chajari","Corrientes"),
(9,"Ramos Mejía","Buenos Aires"),
(10,"San Justo","Buenos Aires"),
(11,"Haedo","Buenos Aires")
;

INSERT INTO ventas (id_pedido, id_cliente)
VALUES
(1,1),
(2,2),
(3,4),
(4,1),
(5,1),
(6,2),
(7,1),
(8,3),
(9,5),
(10,4),
(11,1),
(12,2),
(13,3),
(14,5),
(15,4),
(16,1),
(17,2),
(18,2),
(19,1),
(20,4)
;

INSERT INTO factura (id_factura, punto_de_venta, numero, impuestos, monto,id_pedido)
VALUES
(1,'1','00000001',21.0,20000.0,1),
(2,'1','00000002',21.0,19144.40,2),
(3,'1','00000003',21.0,150000.79,3),
(4,'1','00000004',10.5,9999.15,4),
(5,'1','00000005',21.0,100000.0,5),
(6,'1','00000001',21.0,23441.1,6),
(7,'1','00000002',21.0,9144.40,7),
(8,'1','00000003',21.0,150788.79,8),
(9,'1','00000004',10.5,9990.15,9),
(10,'1','00000005',21.0,132577.18,10),
(11,'1','00000001',21.0,21760.0,11),
(12,'1','00000002',21.0,31914.40,12),
(13,'1','00000003',21.0,156600.79,13),
(14,'1','00000004',10.5,9999.15,14),
(15,'1','00000005',21.0,100000.0,15),
(16,'1','00000001',21.0,217300.0,16),
(17,'1','00000002',21.0,19144.40,17),
(18,'1','00000003',21.0,15000.79,18),
(19,'1','00000004',10.5,9999.15,19),
(20,'1','00000005',21.0,11883.16,20)
;

INSERT INTO locacion (id_locacion, direccion, id_codigo_postal, id_cliente)
VALUES
(1,'Av. Juan B Justo 7640',1,1),
(2,'Av Crisologo Larralde 860',2,2),
(3,'Av Directorio 1131',3,3),
(4,'Profesor Pablo Pizzurno 154',4,4),
(5,'Miraflores 146',5,5),
(6,'Av. Juan B Justo 1151',6,6),
(7,'Perito Moreno 144',7,7),
(8,'Argentina 544',8,8),
(9,'Av Constitución 1331',9,9),
(10,'Profesor Pablo Pizzurno 154',10,9)
;

INSERT INTO partida (id_partida, fec_elab, fec_venc)
VALUES
(1,'2022-01-20','2024-01-21'),
(2,'2022-03-20','2024-03-21'),
(3,'2021-07-31','2024-02-19'),
(4,'2022-03-20','2024-03-21'),
(5,'2022-06-11','2024-03-21'),
(6,'2022-03-20','2024-03-21');
;

INSERT INTO productos (id_producto, id_partida, descripcion)
VALUES
(1,1,'Salsa de tomate'),
(2,2,'Arroz integral'),
(3,3,'Arvejas en lata'),
(4,4,'Azucar pack 1 kg'),
(5,5,'Aceite de oliva'),
(6,6,'Sal fina pack 1 kg'),
(7,1,'Durazno en lata'),
(8,2,'Arroz carnaroli'),
(9,3,'Maicena x 200 g'),
(10,4,'Lenteja x 400 g'),
(11,5,'Porotos'),
(12,6,'Porotos negros');
;

INSERT INTO rack (id_rack, fila, columna)
VALUES
(1,'1','1'),
(2,'1','2'),
(3,'1','3'),
(4,'1','4'),
(5,'2','1'),
(6,'2','2'),
(7,'2','3'),
(8,'2','4'),
(9,'3','1'),
(10,'3','2'),
(11,'3','3'),
(12,'3','4')
;

INSERT INTO remito (id_remito, id_factura, codigo_postal, domicilio_envio)
VALUES
(1,1,1,'Lisandro de la Torrea 749'),
(2,2,3,'Saavedra 785'),
(3,3,2,'Lainez 1375'),
(4,4,5, 'Igualidad 885'),
(5,5,4,'Fray Mamerto Esquiu 144'),
(6,6,1,'Pilar 950'),
(7,7,3,'Chacabuco 890'),
(8,8,2,'Av Independencia 771'),
(9,9,5, 'Guemes 88'),
(10,10,4,'Defensa 1233'),
(11,11,1,'Vuelta de Obligado 160'),
(12,12,3,'Argerich'),
(13,13,2,'Av Rivadavia 15760'),
(14,14,5, 'Av de Mayo 988'),
(15,15,4,'Av Pueyrredon 73'),
(16,16,1,'Monseñor Buffano 3054'),
(17,17,3,'Arieta 143'),
(18,18,2,'Av Juan B Justo 988'),
(19,19,5, 'Congreso 888'),
(20,20,4,'Av Gaona 776')
;

INSERT INTO ventas_productos (id_pedido, id_producto, cantidad)
VALUES
(1,1,40),
(1,2,100),
(1,3,10),
(2,4,21),
(2,1,40),
(2,2,100),
(3,3,10),
(4,4,21),
(4,1,40),
(5,2,100),
(5,3,10),
(5,4,21),
(6,1,40),
(6,2,100),
(6,3,10),
(6,4,21),
(7,2,100),
(7,3,10),
(7,4,21),
(8,1,40),
(8,2,100),
(9,3,10),
(9,4,21),
(10,3,10),
(10,4,21),
(10,1,40),
(11,2,100),
(11,3,10),
(12,4,21),
(12,1,40),
(12,2,100),
(13,3,10),
(13,4,21),
(13,1,40),
(13,2,100),
(14,3,10),
(14,4,21),
(15,3,10),
(15,4,21),
(15,1,40),
(16,1,40),
(16,2,100),
(16,3,10),
(17,3,10),
(17,4,21),
(17,1,40),
(17,2,100),
(18,1,40),
(18,2,100),
(18,3,10),
(19,4,21),
(19,1,40),
(19,2,100),
(20,3,10),
(20,4,21),
(20,1,40)
;

INSERT INTO pallet (id_pallet, id_producto, id_rack, cantidad)
VALUES
(1,1,1,100),
(2,2,2,100),
(3,3,3,200),
(4,4,4,100),
(5,5,5,400),
(6,1,1,100),
(7,2,2,100),
(8,3,3,200),
(9,4,4,100),
(10,5,5,400),
(11,1,1,100),
(12,2,2,100),
(13,3,3,200),
(14,4,4,100),
(15,5,5,400),
(16,1,1,100),
(17,2,2,100),
(18,3,3,200),
(19,4,4,100),
(20,5,5,400)
;

INSERT INTO despacho (id_despacho, id_pedido, fecha, id_pallet, id_chofer)
VALUES
(1,1,'2022-03-10',1,1),
(2,2,'2022-03-15',2,2),
(3,3,'2022-04-01',3,3),
(4,4,'2022-04-10',4,4),
(5,5,'2022-05-13',5,5),
(6,1,'2022-05-22',1,1),
(7,2,'2022-05-24',2,2),
(8,3,'2022-06-01',3,3),
(9,4,'2022-06-01',4,4),
(10,5,'2022-06-19',5,5),
(11,1,'2022-06-30',1,1),
(12,2,'2022-07-15',2,2),
(13,3,'2022-07-16',3,3),
(14,4,'2022-07-29',4,4),
(15,5,'2022-08-11',5,5),
(16,1,'2022-08-12',1,1),
(17,2,'2022-09-02',2,2),
(18,3,'2022-09-21',3,3),
(19,4,'2022-09-23',4,4),
(20,5,'2022-10-10',5,5)
;

-- Script creación Views
-- Ordenamiento de facturas por monto
CREATE OR REPLACE VIEW ordenamiento_facturas AS
	( SELECT id_factura, monto FROM factura ORDER BY monto ASC);
-- Ordenamiento de clientes por orden alfabético
CREATE OR REPLACE VIEW nom_cliente_asc AS
	( SELECT nombre, mail, contacto FROM cliente ORDER BY nombre ASC);
CREATE OR REPLACE VIEW nom_cliente_desc AS
	( SELECT nombre, mail, contacto FROM cliente ORDER BY nombre DESC);    
-- Cantidad de despachos por chofer
CREATE OR REPLACE VIEW chofer_despacho AS
	(SELECT choferes.id_chofer, CONCAT(choferes.apellido , ' ', choferes.nombre) AS 'Chofer', COUNT(despacho.id_chofer) AS 'Cantidad de entregas' FROM despacho
	INNER JOIN choferes
	ON despacho.id_chofer = choferes.id_chofer
	GROUP BY id_chofer);
CREATE OR REPLACE VIEW ubicacion_en_cd AS
	(SELECT pallet.id_rack, pallet.id_pallet as 'ID Pallet', productos.id_producto as 'ID Producto',
	productos.descripcion as 'Producto' from pallet
	INNER JOIN productos ON pallet.id_producto = productos.id_producto
	ORDER BY id_rack);
-- Montos por cliente
CREATE OR REPLACE VIEW pedidos_cliente AS
	(SELECT cliente.id_cliente, cliente.nombre AS 'Nombre', COUNT(ventas.id_cliente) AS 'Cantidad de ventas'FROM cliente
	INNER JOIN ventas ON cliente.id_cliente = ventas.id_cliente 
	GROUP BY id_cliente ORDER BY COUNT(ventas.id_cliente) DESC);
-- Montos por pedido por cliente	
CREATE OR REPLACE VIEW pedidos_por_cliente AS
	(SELECT ventas.id_cliente, cliente.nombre as 'Nombre', SUM(monto) as 'TOTAL'  from factura 
	INNER JOIN ventas ON ventas.id_pedido = factura.id_pedido
	INNER JOIN cliente ON ventas.id_cliente = cliente.id_cliente
	GROUP BY id_cliente);
CREATE OR REPLACE VIEW productos_vendidos AS        
	(SELECT ventas_productos.id_producto, productos.descripcion as 'Producto', SUM(cantidad) as 'Cantidad' from ventas_productos 
    INNER JOIN productos on productos.id_producto = ventas_productos.id_producto
    group by id_producto order by SUM(cantidad) DESC);

    
    
-- Script creación funciones  
DROP FUNCTION IF EXIST `total` 
DELIMITER $$ 

CREATE FUNCTION `total`(id INT) 
RETURNS decimal(20,2)
READS SQL DATA
BEGIN
		DECLARE monto_final DECIMAL (20,2);
		DECLARE iva DECIMAL (20,2);
		SET iva = 1.21;
		SET monto_final = (SELECT factura.monto FROM factura WHERE factura.id_factura = id) * iva;
        
	RETURN monto_final;
END

$$ DELIMITER ;


DROP FUNCTION IF EXIST `pallets_vacios` 
DELIMITER $$
CREATE 
FUNCTION `pallets_vacios`() 
RETURNS varchar(50)
    READS SQL DATA
BEGIN
	DECLARE pallets VARCHAR (50);
    SET pallets = (SELECT pallet.id_pallet FROM pallet WHERE pallet.cantidad = 0);
	RETURN pallets;
END

$$ DELIMITER ;

-- Scripts de SP
-- DROP PROCEDURE `sp_iva_factura`;
DELIMITER $$
-- Este SP impacta en la tabla de factura y le agrega el IVA a la
-- factura seleccionada. Utiliza la función entregada la semana pasada
CREATE PROCEDURE `sp_iva_factura` (IN id INT)
BEGIN
UPDATE factura
SET monto_total = total(id)
WHERE factura.id_factura = id;

END $$

DELIMITER ;

-- DROP PROCEDURE `sp_ordenamiento`;
DELIMITER $$
-- Se va a ordenar la tabla factura. Se ordenará según lo ingresado en criterio
-- El orden será ascendente o descendente según orden sea TRUE o FALSE
CREATE PROCEDURE `sp_ordenamiento` (IN criterio VARCHAR(20), IN orden BOOLEAN)
BEGIN
IF orden = TRUE THEN
	SET @mayor = 'ASC'; -- Si orden es TRUE, el orden será ascendente
ELSE
	SET @mayor = 'DESC'; -- Si orden es FALSE, el orden será descendente
END IF;

SET @consulta = CONCAT('SELECT * FROM factura ORDER BY',' ',criterio,' ',@mayor);

PREPARE orden FROM @consulta;
EXECUTE orden;
DEALLOCATE PREPARE orden;

END $$

DELIMITER ;

-- DROP PROCEDURE `sp_agregar_productos`;
DELIMITER $$

-- Este SP agregará productos de tabla productos 
-- El campo part, es FK de la tabla partida, con lo cual se debe introducir un campo existente en dicha tabla

CREATE PROCEDURE `sp_agregar_productos` (IN part INT, IN descr VARCHAR(100))
BEGIN
INSERT INTO productos (id_partida , descripcion) VALUES (part, descr);
END $$

DELIMITER ;


-- DROP PROCEDURE `sp_eliminar_productos`;
DELIMITER $$

-- Este SP eliminará productos de la tabla producto según ID ingresado

CREATE PROCEDURE `sp_eliminar_productos` (IN id INT)
BEGIN
DELETE FROM productos WHERE productos.id_producto = id;
END $$

DELIMITER ;


-- Script de triggers

CREATE TABLE log_ventas (
	id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha DATETIME,
    usuario VARCHAR(100)
    
);
-- Trigger AFTER INSERT. Con este  trigger registro cada venta, con fecha, hora y usuario.

DELIMITER $$
CREATE TRIGGER `tr_nueva_venta` 
AFTER INSERT ON ventas 
FOR EACH ROW
INSERT INTO log_ventas (id_pedido, id_cliente, fecha, usuario) VALUES (NEW.id_pedido, NEW.id_cliente, CURRENT_TIMESTAMP(), USER());
$$
DELIMITER ;

-- Este trigger estampa la fecha de creación de una venta en la tabla de ventas
DELIMITER $$
CREATE TRIGGER `tr_fecha_venta`
BEFORE INSERT ON ventas
FOR EACH ROW
BEGIN
	SET NEW.fecha_venta = CURRENT_DATE();
END
$$
DELIMITER ;

CREATE TABLE log_productos (
	id_producto INT,
    fecha DATETIME,
    deleted_by VARCHAR(100)
);
-- Este trigger estampa la fecha de eliminación de un prodcuto de la tabla productos
DELIMITER $$
CREATE TRIGGER `tr_producto`
AFTER DELETE ON productos
FOR EACH ROW
BEGIN
		INSERT INTO log_productos (id_producto, fecha, deleted_by) VALUES (OLD.id_producto, CURRENT_TIMESTAMP(), USER());
END
$$
DELIMITER ;

DELIMITER $$

CREATE TABLE IF NOT EXISTS productos_old (
	id_producto INT,
    id_partida INT UNSIGNED,
    descripcion VARCHAR(100)
    );

-- Este trigger guarda valores antiguos de productos actualizados
CREATE TRIGGER `tr_producto_check`
BEFORE UPDATE ON productos 
FOR EACH ROW
BEGIN
	INSERT INTO productos_old(id_producto, id_partida, descripcion) VALUES (OLD.id_producto, OLD.id_partida, OLD.descripcion);
END
$$
DELIMITER ;



-- Script creación de usuarios
DROP USER 'readonly@localhost';
DROP USER 'read_insert_update@localhost';
CREATE USER 'readonly@localhost' IDENTIFIED BY 'J!grw';
CREATE USER 'read_insert_update@localhost' IDENTIFIED BY 'Z25IA';

 -- Otorgamiento de permisos de solo lectura al usuario readonly
GRANT SELECT ON * TO 'readonly@localhost';
 
-- Otorgamiento de permisos de solo lectura, inserción y modificiación al usuario read_insert_update
GRANT SELECT, INSERT, UPDATE ON * TO 'readonly@localhost';
