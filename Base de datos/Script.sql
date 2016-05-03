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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rol` */

/*Table structure for table `sitio` */

DROP TABLE IF EXISTS `sitio`;

CREATE TABLE `sitio` (
  `id_Sitio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `latitud` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  `informacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_Sitio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sitio` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
