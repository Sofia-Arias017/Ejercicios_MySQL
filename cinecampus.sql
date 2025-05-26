-- Dump alternativo para CampusCine

DROP DATABASE IF EXISTS campuscine;
CREATE DATABASE campuscine;
USE campuscine;

-- Tabla de naciones
CREATE TABLE naciones (
    nacion_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_nacion VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de categorias
CREATE TABLE categorias (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion_categoria VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de soportes
CREATE TABLE soportes (
    soporte_id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_soporte VARCHAR(100) NOT NULL UNIQUE -- Ej: Blu-ray, 35mm, Streaming, Digital
);

-- Tabla principal de films
CREATE TABLE films (
    film_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_original VARCHAR(255) NOT NULL,
    duracion_minutos INT NOT NULL,
    resumen TEXT,
    estreno_anio YEAR,
    nacion_id INT,
    categoria_id INT,
    FOREIGN KEY (nacion_id) REFERENCES naciones(nacion_id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

-- Relación N:M entre films y soportes
CREATE TABLE film_soporte (
    film_id INT,
    soporte_id INT,
    PRIMARY KEY (film_id, soporte_id),
    FOREIGN KEY (film_id) REFERENCES films(film_id),
    FOREIGN KEY (soporte_id) REFERENCES soportes(soporte_id)
);

-- Tabla de artistas
CREATE TABLE artistas (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artista VARCHAR(255) NOT NULL,
    nacimiento DATE
);

-- Relación N:M entre films y artistas con tipo de rol
CREATE TABLE film_artista (
    film_id INT,
    artista_id INT,
    rol_en_pelicula VARCHAR(50), -- Ej: Principal, Secundario, Cameo
    PRIMARY KEY (film_id, artista_id),
    FOREIGN KEY (film_id) REFERENCES films(film_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);
