-- MySQL Dump Adaptado para sistema_kardex_mod
-- Versión de servidor: 8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Base de datos alternativa para Kardex
DROP DATABASE IF EXISTS kardex_db;
CREATE DATABASE kardex_db;
USE kardex_db;

-- Tabla de Clasificaciones
DROP TABLE IF EXISTS `clasificacion`;
CREATE TABLE `clasificacion` (
    `clasificacion_id` INT AUTO_INCREMENT PRIMARY KEY,
    `etiqueta` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de Familias de productos
DROP TABLE IF EXISTS `familia_producto`;
CREATE TABLE `familia_producto` (
    `familia_id` INT AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Catálogo de artículos
DROP TABLE IF EXISTS `articulo`;
CREATE TABLE `articulo` (
    `articulo_id` INT AUTO_INCREMENT PRIMARY KEY,
    `nombre_articulo` VARCHAR(100) NOT NULL,
    `detalle` TEXT,
    `familia_id` INT NOT NULL,
    FOREIGN KEY (`familia_id`) REFERENCES `familia_producto`(`familia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Relación N:M entre artículos y clasificaciones
DROP TABLE IF EXISTS `articulo_clasificacion`;
CREATE TABLE `articulo_clasificacion` (
    `articulo_id` INT NOT NULL,
    `clasificacion_id` INT NOT NULL,
    PRIMARY KEY (`articulo_id`, `clasificacion_id`),
    FOREIGN KEY (`articulo_id`) REFERENCES `articulo`(`articulo_id`),
    FOREIGN KEY (`clasificacion_id`) REFERENCES `clasificacion`(`clasificacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Registro de entidades (clientes y proveedores)
DROP TABLE IF EXISTS `entidad`;
CREATE TABLE `entidad` (
    `entidad_id` INT AUTO_INCREMENT PRIMARY KEY,
    `nombre_entidad` VARCHAR(100) NOT NULL,
    `rol` ENUM('cliente', 'proveedor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Registro maestro de transacciones
DROP TABLE IF EXISTS `transaccion`;
CREATE TABLE `transaccion` (
    `transaccion_id` INT AUTO_INCREMENT PRIMARY KEY,
    `fecha_mov` DATETIME NOT NULL,
    `accion` ENUM('entrada', 'salida') NOT NULL,
    `descripcion_motivo` VARCHAR(255),
    `entidad_id` INT,
    FOREIGN KEY (`entidad_id`) REFERENCES `entidad`(`entidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Detalles individuales de cada transacción
DROP TABLE IF EXISTS `detalle_transaccion`;
CREATE TABLE `detalle_transaccion` (
    `detalle_id` INT AUTO_INCREMENT PRIMARY KEY,
    `transaccion_id` INT NOT NULL,
    `articulo_id` INT NOT NULL,
    `cantidad_mov` DECIMAL(10,2) NOT NULL,
    `precio_unitario` DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (`transaccion_id`) REFERENCES `transaccion`(`transaccion_id`),
    FOREIGN KEY (`articulo_id`) REFERENCES `articulo`(`articulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
