CREATE DATABASE IF NOT EXISTS p1_bd2;
USE p1_bd2;

CREATE USER IF NOT EXISTS 'profesor'@'%' IDENTIFIED BY 'tu_contraseña';
GRANT SELECT ON *.* TO 'profesor'@'%';
FLUSH PRIVILEGES;

CREATE USER IF NOT EXISTS 'adminfor'@'localhost' IDENTIFIED BY 'tu_contraseña';
GRANT ALL PRIVILEGES ON *.* TO 'adminfor'@'localhost';
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS rendimiento_asignatura;
CREATE TEMPORARY TABLE rendimiento_asignatura (
    curso_academico SMALLINT,
    tipo_estudio VARCHAR(200),
    estudio VARCHAR(200),
    localidad VARCHAR(200),
    centro VARCHAR(200),
    asignatura VARCHAR(200),
    tipo_asignatura VARCHAR(200),
    clase_asignatura VARCHAR(200),
    tasa_exito FLOAT,
    tasa_rendimiento FLOAT,
    tasa_evaluacion FLOAT,
    alumnos_evaluados SMALLINT,
    alumnos_superados SMALLINT,
    alumnos_presentados SMALLINT,
    media_convocadorias_consumidas FLOAT,
    fecha_actualizacion DATE
);

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/rendimiento_asignatura_2021.csv'
INTO TABLE rendimiento_asignatura
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/rendimiento_asignatura_2022.csv'
INTO TABLE rendimiento_asignatura
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

DELETE FROM rendimiento_asignatura WHERE tipo_estudio <> 'Grado';

DROP TABLE IF EXISTS acuerdos_movilidad;
CREATE TEMPORARY TABLE acuerdos_movilidad (
    curso_academico SMALLINT,
    nombre_programa_movilidad VARCHAR(200),
    nombre_area_estudios VARCHAR(200),
    centro VARCHAR(200),
    in_out VARCHAR(3),
    idioma_nivel_movilidad VARCHAR(200),
    pais_universidad_acuerdo VARCHAR(200),
    universidad_acuerdo VARCHAR(200),
    plazas_ofertadas_alumnos SMALLINT,
    plazas_ofertadas_alumnos_out SMALLINT,
    fecha_actualizacion DATE
);

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/acuerdos_movilidad_2021.csv'
INTO TABLE acuerdos_movilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/acuerdos_movilidad_2022.csv'
INTO TABLE acuerdos_movilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

DELETE FROM acuerdos_movilidad WHERE nombre_programa_movilidad NOT IN ('ERASMUS', 'SICUE');
DELETE FROM acuerdos_movilidad WHERE centro = 'no definido';

DROP TABLE IF EXISTS egresados_titulacion;
CREATE TEMPORARY TABLE egresados_titulacion (
    curso_academico SMALLINT,
    localidad VARCHAR(200),
    estudio VARCHAR(200),
    tipo_estudio VARCHAR(200),
    tipo_egreso VARCHAR(200),
    sexo VARCHAR(100),
    alumnos_graduados SMALLINT,
    alumnos_interrumpen_estudios SMALLINT,
    alumnos_interrumpen_estudios_1eraño SMALLINT,
    alumnos_trasladan_otra_univ SMALLINT,
    duracion_media_graduados FLOAT,
    tasa_eficiencia FLOAT,
    fecha_actualizacion DATE
);

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/egresados_titulacion_2021.csv'
INTO TABLE egresados_titulacion
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/egresados_titulacion_2022.csv'
INTO TABLE egresados_titulacion
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

DELETE FROM egresados_titulacion WHERE tipo_egreso <> 'Abandono Voluntario';

DROP TABLE IF EXISTS notas_corte;
CREATE TEMPORARY TABLE notas_corte (
    curso_academico SMALLINT,
    estudio VARCHAR(200),
    localidad VARCHAR(200),
    centro VARCHAR(200),
    prela_convo_nota_def VARCHAR(200),
    nota_corte_julio FLOAT,
    nota_corte_septiembre FLOAT,
    fecha_actualizacion DATE
);

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/notas_corte_2021.csv'
INTO TABLE notas_corte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/notas_corte_2022.csv'
INTO TABLE notas_corte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

DROP TABLE IF EXISTS oferta_ocupacion;
CREATE TEMPORARY TABLE oferta_ocupacion (
    curso_academico INT,
    estudio VARCHAR(200),
    localidad VARCHAR(200),
    centro VARCHAR(200),
    tipo_centro VARCHAR(200),
    tipo_estudio VARCHAR(200),
    plazas_ofertadas SMALLINT,
    plazas_matriculadas SMALLINT,
    plazas_solicitadas SMALLINT,
    indice_ocupacion FLOAT,
    fecha_actualizacion DATE
);

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/oferta_ocupacion_2021.csv'
INTO TABLE oferta_ocupacion
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/oferta_ocupacion_2022.csv'
INTO TABLE oferta_ocupacion
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

DELETE FROM oferta_ocupacion WHERE tipo_estudio <> 'Grado';

DROP TABLE IF EXISTS resultados_titulacion;
CREATE TEMPORARY TABLE resultados_titulacion (
    curso_academico SMALLINT,
    centro VARCHAR(200),
    estudio VARCHAR(200),
    tipo_estudio VARCHAR(200),
    alumnos_matriculados SMALLINT,
    alumnos_nuevo_ingreso SMALLINT,
    plazas_ofertadas SMALLINT,
    alumnos_graduados SMALLINT,
    alumnos_adapta_grado_matri SMALLINT,
    alumnos_adapta_grado_matri_ni SMALLINT,
    alumnos_adapta_grado_titulado SMALLINT,
    alumnos_con_reconocimiento SMALLINT,
    alumnos_movilidad_entrada SMALLINT,
    alumnos_movilidad_salida SMALLINT,
    creditos_matriculados FLOAT,
    creditos_reconocidos FLOAT,
    duracion_media_graduados FLOAT,
    tasa_exito FLOAT,
    tasa_rendimiento FLOAT,
    tasa_eficiencia FLOAT,
    tasa_abandono FLOAT,
    tasa_graduacion FLOAT,
    fecha_actualizacion DATE
);

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/resultados_titulacion_2021.csv'
INTO TABLE resultados_titulacion
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/home/alumno/Documentos/p1_bd2/Practica_1/resultados_titulacion_2022.csv'
INTO TABLE resultados_titulacion
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

--Creación de tablas
DROP TABLE IF EXISTS Localidad;
CREATE TABLE Localidad (
  nombre_localidad VARCHAR(200) PRIMARY KEY
);

DROP TABLE IF EXISTS Centro;
CREATE TABLE Centro (
  nombre_centro VARCHAR(200) PRIMARY KEY,
  nombre_localidad VARCHAR(200),
  FOREIGN KEY (nombre_localidad) REFERENCES Localidad(nombre_localidad)
);

DROP TABLE IF EXISTS Estudio;
CREATE TABLE Estudio(
    nombre_estudio VARCHAR(200),
    PRIMARY KEY (nombre_estudio)
);

DROP TABLE IF EXISTS Area;
CREATE TABLE Area(
    nombre_area_estudios VARCHAR(200), 
    PRIMARY KEY (nombre_area_estudios)
);

DROP TABLE IF EXISTS Idioma;
CREATE TABLE Idioma(
    idioma VARCHAR(100),
    PRIMARY KEY (idioma)
);

DROP TABLE IF EXISTS Oferta_academica;
CREATE TABLE Oferta_academica(
    curso SMALLINT,
    nombre_estudio VARCHAR(200),
    nombre_centro VARCHAR(200),
    indice_ocupacion FLOAT,
    PRIMARY KEY (nombre_estudio, nombre_centro, curso),
    CONSTRAINT fk_Estudio FOREIGN KEY(nombre_estudio) REFERENCES Estudio(nombre_estudio),
    CONSTRAINT fk_Centro FOREIGN KEY(nombre_centro) REFERENCES Centro(nombre_centro)
);

DROP TABLE IF EXISTS Universidad_acuerdo;
CREATE TABLE Universidad_acuerdo(
    nombre_universidad VARCHAR(200),
    PRIMARY KEY (nombre_universidad)
);

DROP TABLE IF EXISTS Oferta_movilidad;
CREATE TABLE Oferta_movilidad(
    curso_movilidad SMALLINT,
    nombre_centro VARCHAR(200),
    nombre_universidad VARCHAR(200),
    nombre_area_estudios VARCHAR(200),
    idioma VARCHAR(200),
    PRIMARY KEY (nombre_centro, nombre_universidad, idioma, nombre_area_estudios, curso_movilidad),
    CONSTRAINT fk_Area FOREIGN KEY(nombre_area_estudios) REFERENCES Area(nombre_area_estudios),
    CONSTRAINT fk_Idioma FOREIGN KEY(idioma) REFERENCES Idioma(idioma),
    CONSTRAINT fk_Centro FOREIGN KEY(nombre_centro) REFERENCES Centro(nombre_centro),
    CONSTRAINT fk_Universidad FOREIGN KEY(nombre_universidad) REFERENCES Universidad_acuerdo(nombre_universidad)
);

DROP TABLE IF EXISTS Pais;
CREATE TABLE Pais(
    nombre_pais VARCHAR(200),
    PRIMARY KEY (nombre_pais)
);

DROP TABLE IF EXISTS UniAcuerdo_Pais;
CREATE TABLE UniAcuerdo_Pais(
    nombre_universidad VARCHAR(200),
    nombre_pais VARCHAR(200),
    PRIMARY KEY (nombre_universidad, nombre_pais),
    CONSTRAINT fk_Pais FOREIGN KEY(nombre_pais) REFERENCES Pais(nombre_pais),
    CONSTRAINT fk_Universidad FOREIGN KEY(nombre_universidad) REFERENCES Universidad_acuerdo(nombre_universidad)
);

DROP TABLE IF EXISTS Asignatura;
CREATE TABLE Asignatura(
    nombre_asignatura VARCHAR(200),
    PRIMARY KEY (nombre_asignatura)
);

DROP TABLE IF EXISTS Imparte;
CREATE TABLE Imparte(
    nombre_asignatura VARCHAR(200),
    nombre_estudio VARCHAR(200),
    nombre_centro VARCHAR(200),
    curso SMALLINT,
    PRIMARY KEY (nombre_asignatura, nombre_estudio, nombre_centro, curso),
    CONSTRAINT fk_Asignatura FOREIGN KEY(nombre_asignatura) REFERENCES Asignatura(nombre_asignatura),
    CONSTRAINT fk_Oferta FOREIGN KEY(nombre_estudio, nombre_centro, curso) REFERENCES Oferta_academica(nombre_estudio, nombre_centro, curso)
);

DROP TABLE IF EXISTS Resultados;
CREATE TABLE Resultados(
    id INT AUTO_INCREMENT,
    nombre_estudio VARCHAR(200),
    nombre_centro VARCHAR(200),
    curso SMALLINT,
    tasa_graduacion FLOAT,
    tasa_abandono FLOAT,
    PRIMARY KEY (id),
    CONSTRAINT fk_Oferta FOREIGN KEY(nombre_estudio, nombre_centro, curso) REFERENCES Oferta_academica(nombre_estudio, nombre_centro, curso)
);

-- Creamos un trigger por tabla

CREATE TRIGGER impide_borrar_asignatura
BEFORE DELETE ON Asignatura
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_localidad
BEFORE DELETE ON Localidad
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_centro
BEFORE DELETE ON Centro
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_estudio
BEFORE DELETE ON Estudio
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_area
BEFORE DELETE ON Area
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_ofertaAcademica
BEFORE DELETE ON oferta_academica
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_idioma
BEFORE DELETE ON Idioma
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_universidad_acuerdo
BEFORE DELETE ON Universidad_acuerdo
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_pais
BEFORE DELETE ON Pais
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

UniAcuerdo_Pais
CREATE TRIGGER impide_borrar_uniAcuerdo_pais
BEFORE DELETE ON UniAcuerdo_Pais
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_pais
BEFORE DELETE ON Pais
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_oferta_movilidad
BEFORE DELETE ON Oferta_movilidad
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_imparte
BEFORE DELETE ON Imparte
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

CREATE TRIGGER impide_borrar_resultados
BEFORE DELETE ON Resultados
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000';
END;

--Introducimos los datos 
-- Pasamos datos a la base de datos de las tablas temporales

INSERT INTO Localidad (nombre_localidad)
    SELECT DISTINCT localidad
    FROM oferta_ocupacion;

INSERT INTO Centro (nombre_centro, nombre_localidad)
    SELECT DISTINCT centro, localidad
    FROM oferta_ocupacion;
    
INSERT INTO Pais (nombre_pais)
    SELECT DISTINCT pais_universidad_acuerdo
    FROM acuerdos_movilidad;

INSERT INTO Idioma (idioma)
    SELECT DISTINCT idioma_nivel_movilidad
    FROM acuerdos_movilidad;

INSERT INTO Universidad_acuerdo (nombre_universidad) 
    SELECT DISTINCT universidad_acuerdo
    FROM acuerdos_movilidad;

INSERT INTO Estudio (nombre_estudio)
    SELECT DISTINCT     
    CASE 
        WHEN LOCATE(':', estudio) > 0 THEN 
            SUBSTRING(SUBSTRING_INDEX(estudio, ':', -2))
        WHEN LOCATE('-', estudio) > 0 THEN 
            SUBSTRING_INDEX(estudio, '-', -1)
        ELSE 
            estudio
    END 
    FROM oferta_ocupacion;

INSERT INTO Estudio (nombre_estudio)
    SELECT DISTINCT     
    CASE 
        WHEN LOCATE(':', estudio) > 0 THEN 
            SUBSTRING(SUBSTRING_INDEX(estudio, ':', -2))
        WHEN LOCATE('-', estudio) > 0 THEN 
            SUBSTRING_INDEX(estudio, '-', -1)
        ELSE 
            estudio
    END 
    FROM resultados_titulacion;

INSERT INTO Oferta_academica (curso, nombre_estudio, nombre_centro, indice_ocupacion)
    SELECT DISTINCT curso_academico,
         CASE 
        WHEN LOCATE(':', estudio) > 0 THEN 
            SUBSTRING(SUBSTRING_INDEX(estudio, ':', -2))
        WHEN LOCATE('-', estudio) > 0 THEN 
            SUBSTRING_INDEX(estudio, '-', -1)
        ELSE 
            estudio
    END , 
     centro, indice_ocupacion
    FROM oferta_ocupacion;

INSERT INTO UniAcuerdo_Pais (nombre_universidad, nombre_pais)
    SELECT DISTINCT universidad_acuerdo, pais_universidad_acuerdo
    FROM acuerdos_movilidad;

INSERT INTO Area (nombre_area_estudios)
    SELECT DISTINCT nombre_area_estudios
    FROM acuerdos_movilidad;

INSERT INTO Asignatura (nombre_asignatura)
    SELECT DISTINCT asignatura
    FROM rendimiento_asignatura;

INSERT INTO Resultados (tasa_graduacion, tasa_abandono, nombre_centro, nombre_estudio, curso)
    SELECT DISTINCT rt.tasa_graduacion, rt.tasa_abandono, rt.centro, oa.nombre_estudio, oa.curso
    FROM Oferta_academica oa, resultados_titulacion rt
    WHERE oa.nombre_centro = rt.centro
    AND oa.curso = rt.curso_academico;
   
INSERT INTO Imparte (nombre_asignatura, nombre_estudio, nombre_centro, curso)
    SELECT DISTINCT asignatura,
         CASE 
        WHEN LOCATE(':', estudio) > 0 THEN 
            SUBSTRING(SUBSTRING_INDEX(estudio, ':', -2))
        WHEN LOCATE('-', estudio) > 0 THEN 
            SUBSTRING_INDEX(estudio, '-', -1)
        ELSE 
            estudio
    END ,
    centro, curso_academico
    FROM rendimiento_asignatura ra, Asignatura A, Oferta_academica oa, Centro C
    WHERE oa.nombre_centro = C.nombre_centro;

INSERT INTO Oferta_movilidad (nombre_area_estudios, nombre_centro, nombre_universidad, idioma, curso_movilidad)
    SELECT DISTINCT A.nombre_area_estudios, C.nombre_centro, U.nombre_universidad, I.idioma, am.curso_academico
    FROM Universidad_acuerdo U, Idioma I, Area A, Centro C, acuerdos_movilidad am
    WHERE U.nombre_universidad = am.universidad_acuerdo 
    AND I.idioma = am.idioma_nivel_movilidad
    AND A.nombre_area_estudios = am.nombre_area_estudios
    AND C.nombre_centro = am.centro;

--Consulta 1
	SELECT nombre_localidad, nombre_estudio, curso
	FROM (
    	SELECT C.nombre_localidad, oa.nombre_estudio, oa.curso,
        	ROW_NUMBER() OVER(PARTITION BY C.nombre_localidad, oa.curso 
        	ORDER BY oa.indice_ocupacion DESC) AS row_num
    		FROM Oferta_academica AS oa
    		INNER JOIN Centro AS C ON oa.nombre_centro = C.nombre_centro
		) AS sub
		WHERE row_num <= 2
		ORDER BY nombre_localidad, curso, row_num;

--Consulta 2
	SELECT estudio
	FROM Resultados
	ORDER BY tasa_abandono DESC
	LIMIT 10;
	
--Vista 
-- Crear la tabla para la vista materializada
CREATE TABLE vista_asignaturas_teruel(
    nombre_asignatura VARCHAR(200),
    tasa_exito FLOAT,
    curso SMALLINT
);

-- Evento para actualizar tabla
DELIMITER $$
	CREATE EVENT actualizar_vista_asignaturas_teruel
	ON SCHEDULE EVERY 1 DAY
	STARTS CURRENT_TIMESTAMP
	DO
	BEGIN
    	-- Eliminar datos antiguos
    	DELETE FROM vista_asignaturas_teruel;
    
    	INSERT INTO vista_asignaturas_teruel
    		SELECT A.nombre_asignatura, A.tasa_exito, I.curso
    		FROM Asignatura A
    		JOIN Imparte I ON A.nombre_asignatura = I.nombre_asignatura
    		JOIN Localidad L ON I.nombre_centro = L.nombre_centro
    		WHERE L.nombre_localidad = 'Teruel'
    		ORDER BY A.tasa_exito DESC
    		LIMIT 10;

    	INSERT INTO vista_asignaturas_teruel
    		SELECT A.nombre_asignatura, A.tasa_exito, I.curso
    		FROM Asignatura A
    		JOIN Imparte I ON A.nombre_asignatura = I.nombre_asignatura
    		JOIN Localidad L ON I.nombre_centro = L.nombre_centro
    		WHERE L.nombre_localidad = 'Teruel'
    		ORDER BY R.tasa_graduacion ASC
    		LIMIT 10;
	END$$
DELIMITER ;

-- Iniciar el evento
ALTER EVENT actualizar_vista_asignaturas_teruel ENABLE;

-- Consultar la vista materializada
SELECT * FROM vista_asignaturas_teruel;