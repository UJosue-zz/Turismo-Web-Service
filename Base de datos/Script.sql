/*
SQLyog Trial v12.2.1 (64 bit)
MySQL - 10.1.13-MariaDB : Database - db_turismo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_turismo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_turismo`;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `categoria` */

insert  into `categoria`(`id_Categoria`,`nombre`,`nota`) values 
(1,'Restaurante','Venta de comida'),
(2,'Cafe','Venta de café'),
(3,'Reserva natural','Áreas boscosas protegidas'),
(4,'Deportivo','Área para hacer deporte');

/*Table structure for table `comentario` */

DROP TABLE IF EXISTS `comentario`;

CREATE TABLE `comentario` (
  `id_Comentario` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `valoracion` int(11) DEFAULT NULL,
  `id_Sitio` int(11) DEFAULT NULL,
  `id_Usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Comentario`),
  KEY `FK_Comentario_Sitio` (`id_Sitio`),
  KEY `FK_Comentario_Usuario` (`id_Usuario`),
  CONSTRAINT `FK_Comentario_Sitio` FOREIGN KEY (`id_Sitio`) REFERENCES `sitio` (`id_Sitio`),
  CONSTRAINT `FK_Comentario_Usuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comentario` */

/*Table structure for table `foto` */

DROP TABLE IF EXISTS `foto`;

CREATE TABLE `foto` (
  `id_Foto` int(11) NOT NULL AUTO_INCREMENT,
  `foto` longblob,
  `tipo_Foto` varchar(255) DEFAULT NULL,
  `id_Sitio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Foto`),
  KEY `FK_Foto_Sitio` (`id_Sitio`),
  CONSTRAINT `FK_Foto_Sitio` FOREIGN KEY (`id_Sitio`) REFERENCES `sitio` (`id_Sitio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `foto` */

/*Table structure for table `historial` */

DROP TABLE IF EXISTS `historial`;

CREATE TABLE `historial` (
  `id_Historial` int(11) NOT NULL AUTO_INCREMENT,
  `id_Usuario` int(11) DEFAULT NULL,
  `id_Sitio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Historial`),
  KEY `FK_Historial_Usuario` (`id_Usuario`),
  KEY `FK_Historial_Sitio` (`id_Sitio`),
  CONSTRAINT `FK_Historial_Sitio` FOREIGN KEY (`id_Sitio`) REFERENCES `sitio` (`id_Sitio`),
  CONSTRAINT `FK_Historial_Usuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `historial` */

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `rol` */

insert  into `rol`(`id_Rol`,`nombre`,`nota`) values 
(1,'Administrador','Acceso completo'),
(2,'Cliente','Acceso a vistas y comentarios'),
(3,'PruebaEditar','');

/*Table structure for table `sitio` */

DROP TABLE IF EXISTS `sitio`;

CREATE TABLE `sitio` (
  `id_Sitio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `latitud` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  `informacion` varchar(255) DEFAULT NULL,
  `id_Categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Sitio`),
  KEY `FK_Sitio_Categoria` (`id_Categoria`),
  CONSTRAINT `FK_Sitio_Categoria` FOREIGN KEY (`id_Categoria`) REFERENCES `categoria` (`id_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `sitio` */

insert  into `sitio`(`id_Sitio`,`nombre`,`latitud`,`longitud`,`informacion`,`id_Categoria`) values 
(1,'Tikal','192.31','124.0','Corazón del mundo Maya',3),
(2,'Estadio nacional','12.3','312.3','Estadio nacional de guatemala',4);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `nacionalidad` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `id_Rol` int(11) DEFAULT NULL,
  `id_Sitio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Usuario`),
  KEY `FK_Usuario_Rol` (`id_Rol`),
  KEY `FK_Usuario_Sitio` (`id_Sitio`),
  CONSTRAINT `FK_Usuario_Rol` FOREIGN KEY (`id_Rol`) REFERENCES `rol` (`id_Rol`),
  CONSTRAINT `FK_Usuario_Sitio` FOREIGN KEY (`id_Sitio`) REFERENCES `sitio` (`id_Sitio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`id_Usuario`,`nombre`,`nacionalidad`,`correo`,`nick`,`contrasena`,`id_Rol`,`id_Sitio`) values 
(1,'Admin','Guatemalteco','admin@sitio.com','admin','123',1,1),
(5,'Cliente','Islandés','c@clientes.com','cliente','123',2,NULL),
(6,'prueba','noruego','p@p.com','prueba','123',1,NULL),
(7,'josue','guatemalteco','josue@josue','josue','123',2,NULL);

/* Procedure structure for procedure `buscar_Sitio_Categoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_Sitio_Categoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_Sitio_Categoria`(IN _categoria INT)
BEGIN
	SELECT Sitio.`id_Sitio`, Sitio.`nombre` FROM Sitio where Sitio.`id_Categoria` = _categoria;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_Sitio_Cercano` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_Sitio_Cercano` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_Sitio_Cercano`()
BEGIN
	SELECT Sitio.`id_Sitio`, Categoria.`nombre`,  Sitio.`latitud`, Sitio.`longitud`, Sitio.`nombre` 
		FROM Sitio INNER JOIN Categoria ON Sitio.`id_Categoria` = Categoria.`id_Categoria`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_Sitio_Nombre` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_Sitio_Nombre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_Sitio_Nombre`(IN _nombre VARCHAR(255))
BEGIN
	SET @consulta = CONCAT("SELECT sitio.`id_Sitio`, sitio.`nombre` FROM Sitio WHERE sitio.`nombre` LIKE '%",_nombre,"%' ORDER BY Sitio.`nombre` ASC");
	PREPARE ejecutar from @consulta;
	EXECUTE ejecutar;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `crear_Rol` */

/*!50003 DROP PROCEDURE IF EXISTS  `crear_Rol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_Rol`(IN _nombre VARCHAR(255), IN _nota VARCHAR(255))
BEGIN
	INSERT INTO rol (nombre, nota) VALUES (_nombre, _nota);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `crear_Sitio` */

/*!50003 DROP PROCEDURE IF EXISTS  `crear_Sitio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_Sitio`(IN _nombre VARCHAR(255), IN _latitud double, in _longitud double, in _informacion varchar(255), in _categoria int)
BEGIN
	INSERT INTO Sitio (nombre, latitud, longitud, informacion, id_Categoria) VALUES (_nombre, _latitud, _longitud, _informacion, _categoria);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editar_Rol` */

/*!50003 DROP PROCEDURE IF EXISTS  `editar_Rol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_Rol`(IN _nombre Varchar(255), IN _nota Varchar(255), IN _id INT)
BEGIN
	UPDATE Rol SET Rol.`nombre` = _nombre, Rol.`nota` = _nota WHERE Rol.`id_Rol` = _id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editar_Sitio` */

/*!50003 DROP PROCEDURE IF EXISTS  `editar_Sitio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_Sitio`(in _nombre varchar(255), in _latitud double, in _longitud double, in _informacion varchar(255), in _categoria int, in _sitio int)
BEGIN
	UPDATE Sitio SET Sitio.`nombre` = _nombre, Sitio.`latitud` = _latitud, Sitio.`longitud` = _longitud, Sitio.`informacion` = _informacion, Sitio.`id_Categoria` = _categoria
	 WHERE Sitio.`id_Sitio` = _sitio;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `eliminar_Rol` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminar_Rol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Rol`(IN _rol INT)
BEGIN
	DELETE FROM Rol WHERE Rol.`id_Rol` = _rol;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `eliminar_Sitio` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminar_Sitio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_Sitio`(in _sitio int)
BEGIN
	DELETE FROM Sitio WHERE sitio.`id_Sitio` = _sitio;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listar_Rol` */

/*!50003 DROP PROCEDURE IF EXISTS  `listar_Rol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_Rol`()
BEGIN
	SELECT * FROM Rol;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Login` */

/*!50003 DROP PROCEDURE IF EXISTS  `Login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Login`(IN _nick VARCHAR(255), IN _contrasena VARCHAR(255))
BEGIN
	SELECT * FROM Usuario WHERE Usuario.`nick` = _nick and Usuario.`contrasena` = _contrasena;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Registro` */

/*!50003 DROP PROCEDURE IF EXISTS  `Registro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Registro`(IN _nombre Varchar(255), IN _nacionalidad VARCHAR(255), IN _correo VARCHAR(255), IN _nick VARCHAR(255), IN _contrasena VARCHAR(255), IN _Rol INT)
BEGIN
	INSERT INTO usuario (nombre, nacionalidad, correo, nick, contrasena, id_Rol) VALUES (_nombre, _nacionalidad, _correo, _nick, _contrasena, _Rol);
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
