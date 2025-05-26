DROP DATABASE IF EXISTS `clubfutbol`;
CREATE DATABASE `clubfutbol`;
USE `clubfutbol`;

-- Tabla de sedes del club
CREATE TABLE `Sede` (
    `sede_id` INT NOT NULL AUTO_INCREMENT,
    `nom_sede` VARCHAR(120) NOT NULL,
    `ubicacion` VARCHAR(255),
    `telefono_contacto` VARCHAR(20),
    PRIMARY KEY (`sede_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de categorías deportivas
CREATE TABLE `Categoria` (
    `categoria_id` INT NOT NULL AUTO_INCREMENT,
    `descripcion` VARCHAR(60) NOT NULL,
    PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de jugadores registrados
CREATE TABLE `Jugador` (
    `jugador_id` INT NOT NULL AUTO_INCREMENT,
    `nombre_completo` VARCHAR(120) NOT NULL,
    `nacimiento` DATE,
    `categoria_id` INT,
    PRIMARY KEY (`jugador_id`),
    FOREIGN KEY (`categoria_id`) REFERENCES `Categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Programas de entrenamiento disponibles
CREATE TABLE `Entrenamiento` (
    `programa_id` INT NOT NULL AUTO_INCREMENT,
    `titulo_programa` VARCHAR(100) NOT NULL,
    `detalle` TEXT,
    `sede_id` INT,
    PRIMARY KEY (`programa_id`),
    FOREIGN KEY (`sede_id`) REFERENCES `Sede` (`sede_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sesiones de entrenamiento específicas
CREATE TABLE `Sesion` (
    `sesion_id` INT NOT NULL AUTO_INCREMENT,
    `programa_id` INT,
    `fecha_sesion` DATE,
    `metas` TEXT,
    PRIMARY KEY (`sesion_id`),
    FOREIGN KEY (`programa_id`) REFERENCES `Entrenamiento` (`programa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Jugadores inscritos en programas
CREATE TABLE `InscripcionPrograma` (
    `jugador_id` INT,
    `programa_id` INT,
    PRIMARY KEY (`jugador_id`, `programa_id`),
    FOREIGN KEY (`jugador_id`) REFERENCES `Jugador` (`jugador_id`),
    FOREIGN KEY (`programa_id`) REFERENCES `Entrenamiento` (`programa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Eventos deportivos u organizativos
CREATE TABLE `Evento` (
    `evento_id` INT NOT NULL AUTO_INCREMENT,
    `titulo` VARCHAR(120),
    `fecha_evento` DATE,
    `lugar` VARCHAR(255),
    `estado_actual` VARCHAR(60),
    PRIMARY KEY (`evento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Personal asignado
CREATE TABLE `Staff` (
    `staff_id` INT NOT NULL AUTO_INCREMENT,
    `nombre_staff` VARCHAR(100),
    `funcion` VARCHAR(60),
    PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Relación entre eventos y personal
CREATE TABLE `Evento_Staff` (
    `evento_id` INT,
    `staff_id` INT,
    PRIMARY KEY (`evento_id`, `staff_id`),
    FOREIGN KEY (`evento_id`) REFERENCES `Evento` (`evento_id`),
    FOREIGN KEY (`staff_id`) REFERENCES `Staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Empresas o personas que patrocinan eventos
CREATE TABLE `Sponsor` (
    `sponsor_id` INT NOT NULL AUTO_INCREMENT,
    `nombre_sponsor` VARCHAR(100),
    `contacto_info` VARCHAR(100),
    PRIMARY KEY (`sponsor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Patrocinadores asignados a eventos
CREATE TABLE `Evento_Sponsor` (
    `evento_id` INT,
    `sponsor_id` INT,
    PRIMARY KEY (`evento_id`, `sponsor_id`),
    FOREIGN KEY (`evento_id`) REFERENCES `Evento` (`evento_id`),
    FOREIGN KEY (`sponsor_id`) REFERENCES `Sponsor` (`sponsor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Incidentes ocurridos durante eventos
CREATE TABLE `ReporteIncidente` (
    `incidente_id` INT NOT NULL AUTO_INCREMENT,
    `evento_id` INT,
    `detalle_incidente` TEXT,
    `accion_realizada` TEXT,
    `fecha_reporte` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`incidente_id`),
    FOREIGN KEY (`evento_id`) REFERENCES `Evento` (`evento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Recursos asignados a eventos
CREATE TABLE `Recurso` (
    `recurso_id` INT NOT NULL AUTO_INCREMENT,
    `denominacion` VARCHAR(100),
    `categoria` VARCHAR(60),
    `descripcion_utilidad` TEXT,
    PRIMARY KEY (`recurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Relación entre eventos y recursos
CREATE TABLE `Evento_Recurso` (
    `evento_id` INT,
    `recurso_id` INT,
    PRIMARY KEY (`evento_id`, `recurso_id`),
    FOREIGN KEY (`evento_id`) REFERENCES `Evento` (`evento_id`),
    FOREIGN KEY (`recurso_id`) REFERENCES `Recurso` (`recurso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
