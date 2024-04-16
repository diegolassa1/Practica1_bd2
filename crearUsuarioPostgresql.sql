DROP DATABASE IF EXISTS p1_bd2;
CREATE DATABASE p1_bd2;

DO $$ BEGIN
  IF EXISTS(SELECT FROM pg_catalog.pg_roles WHERE rolname = 'profesor') THEN
    DROP ROLE profesor;
  END IF;
END $$;

CREATE USER profesor WITH PASSWORD 'tu_contraseña';
GRANT SELECT ON ALL TABLES IN SCHEMA public TO profesor;

DO $$ BEGIN
  IF EXISTS(SELECT FROM pg_catalog.pg_roles WHERE rolname = 'adminfor') THEN
    DROP ROLE adminfor;
  END IF;
END $$;

CREATE USER adminfor WITH PASSWORD 'tu_contraseña' LOGIN CONNECTION LIMIT 1;

DROP TABLE IF EXISTS rendimiento_asignatura;

CREATE TEMPORARY TABLE rendimiento_asignatura (
  curso_academico SMALLINT
  , tipo_estudio VARCHAR(200)
  , estudio VARCHAR(200)
  , localidad VARCHAR(200)
  , centro VARCHAR(200)
  , asignatura VARCHAR(200)
  , tipo_asignatura VARCHAR(200)
  , clase_asignatura VARCHAR(200)
  , tasa_exito FLOAT
  , tasa_rendimiento FLOAT
  , tasa_evaluacion FLOAT
  , alumnos_evaluados SMALLINT
  , alumnos_superados SMALLINT
  , alumnos_presentados SMALLINT
  , media_convocadorias_consumidas FLOAT
  , fecha_actualizacion DATE
);

COPY rendimiento_asignatura
FROM '/home/alumno/Documentos/p1_bd2/Practica_1/rendimiento_asignatura_2021.csv'
DELIMITER ';'
CSV HEADER;

COPY rendimiento_asignatura
FROM '/home/alumno/Documentos/p1_bd2/Practica_1/rendimiento_asignatura_2022.csv'
DELIMITER ';'
CSV HEADER;

DELETE FROM rendimiento_asignatura WHERE tipo_estudio <> 'Grado';

DROP TABLE IF EXISTS acuerdos_movilidad;

CREATE TEMPORARY TABLE acuerdos_movilidad (
	curso_academico SMALLINT
	, nombre_programa_movilidad VARCHAR(200)
	, nombre_area_estudios VARCHAR(200)
    , centro VARCHAR(200)
    , in_out VARCHAR(3)
    , idioma_nivel_movilidad VARCHAR(200)
    , pais_universidad_acuerdo VARCHAR(200)
    , universidad_acuerdo VARCHAR(200)
	, plazas_ofertadas_alumnos SMALLINT
	, plazas_ofertadas_alumnos_out SMALLINT
	, fecha_actualizacion DATE
);

COPY acuerdos_movilidad
FROM '/home/alumno/Documentos/p1_bd2/Practica_1/acuerdos_movilidad_2021.csv' 
DELIMITER ';'
CSV HEADER;

COPY acuerdos_movilidad
FROM '/home/alumno/Documentos/p1_bd2/Practica_1/acuerdos_movilidad_2022.csv'
DELIMITER ';'
CSV HEADER;

DELETE FROM acuerdos_movilidad WHERE nombre_programa_movilidad <> 'ERASMUS' AND nombre_programa_movilidad <> 'SICUE';

DROP TABLE IF EXISTS egresados_titulacion;

CREATE TEMPORARY TABLE egresados_titulacion (
	curso_academico SMALLINT
	, localidad VARCHAR(200)
    , estudio VARCHAR(200)
    , tipo_estudio VARCHAR(200)
    , tipo_egreso VARCHAR(200)
    , sexo VARCHAR(100)
    , alumnos_graduados SMALLINT
    , alumnos_interrumpen_estudios SMALLINT
    , alumnos_interrumpen_estudios_1eraño SMALLINT
    , alumnos_trasladan_otra_univ SMALLINT
    , duracion_media_graduados FLOAT
    , tasa_eficiencia FLOAT
	, fecha_actualizacion DATE
);

COPY egresados_titulacion
FROM '/home/alumno/Documentos/p1_bd2/Practica_1/egresados_titulacion_2021.csv' 
DELIMITER ';'
CSV HEADER;

COPY egresados_titulacion
FROM '/home/alumno/Documentos/p1_bd2/Practica_1/egresados_titulacion_2022.csv'
DELIMITER ';'
CSV HEADER;

DELETE FROM egresados_titulacion WHERE tipo_egreso <> 'Abandono Voluntario';

DROP TABLE IF EXISTS notas_corte;

CREATE TEMPORARY TABLE notas_corte (
	curso_academico SMALLINT
	, estudio VARCHAR(200)
	, localidad VARCHAR(200)
    , centro VARCHAR(200)
    , prela_convo_nota_def VARCHAR(200)
    , nota_corte_julio FLOAT
    , nota_corte_septiembre FLOAT
	, fecha_actualizacion DATE
);

COPY notas_corte
FROM '/home/alumno/Documentos/p1_bd2/Practica_1/notas_corte_2021.csv'
DELIMITER ';'
CSV HEADER;

COPY notas_corte
FROM '/home/alumno/Documentos/p1_bd2/Practica_1/notas_corte_2022.csv'
DELIMITER ';'
CSV HEADER;

DROP TABLE IF EXISTS oferta_ocupacion;

CREATE TEMPORARY TABLE oferta_ocupacion (
	curso_academico INT
	, estudio VARCHAR(200)
	, localidad VARCHAR(200)
	, centro VARCHAR(200)
    , tipo_centro VARCHAR(200)
    , tipo_estudio VARCHAR(200)
    , plazas_ofertadas SMALLINT
    , plazas_matriculadas SMALLINT
    , plazas_solicitadas SMALLINT
    , indice_ocupacion FLOAT
	, fecha_actualizacion DATE
);

COPY oferta_ocupacion
FROM '/home/alumno/Documentos/p1_bd2/Practica_1/oferta_ocupacion_2021.csv'
DELIMITER ';'
CSV HEADER;

COPY oferta_ocupacion
FROM '/home/alumno/Documentos/p1_bd2/Practica_1/oferta_ocupacion_2022.csv'
DELIMITER ';'
CSV HEADER;

DELETE FROM oferta_ocupacion WHERE tipo_estudio <> 'Grado';

DROP TABLE IF EXISTS resultados_titulacion;

CREATE TEMPORARY TABLE resultados_titulacion (
	curso_academico SMALLINT
	, centro VARCHAR(200)
	, estudio VARCHAR(200)
	, tipo_estudio VARCHAR(200)
	, alumnos_matriculados SMALLINT
	, alumnos_nuevo_ingreso SMALLINT
	, plazas_ofertadas SMALLINT
	, alumnos_graduados SMALLINT
	, alumnos_adapta_grado_matri SMALLINT
	, alumnos_adapta_grado_matri_ni SMALLINT
	, alumnos_adapta_grado_titulado	SMALLINT
	, alumnos_con_reconocimiento SMALLINT
	, alumnos_movilidad_entrada SMALLINT
	, alumnos_movilidad_salida SMALLINT
	, creditos_matriculados FLOAT
	, creditos_reconocidos FLOAT
	, duracion_media_graduados FLOAT
	, tasa_exito FLOAT
	, tasa_rendimiento FLOAT
	, tasa_eficiencia FLOAT
	, tasa_abandono FLOAT
	, tasa_graduacion FLOAT
	, fecha_actualizacion DATE
);

COPY resultados_titulacion FROM '/home/alumno/Documentos/p1_bd2/Practica_1/resultados_titulacion_2021.csv' DELIMITER ';' CSV HEADER QUOTE '|';

COPY resultados_titulacion FROM '/home/alumno/Documentos/p1_bd2/Practica_1/resultados_titulacion_2022.csv' DELIMITER ';' CSV HEADER QUOTE '|';

DELETE FROM resultados_titulacion WHERE tipo_estudio <> 'Grado';

--Creación de tablas
DROP TABLE IF EXISTS Localidad CASCADE;
CREATE TABLE Localidad (
  nombre_localidad VARCHAR(200) PRIMARY KEY
);

DROP TABLE IF EXISTS Centro CASCADE;
CREATE TABLE Centro (
  nombre_centro VARCHAR(200) PRIMARY KEY,
  nombre_localidad VARCHAR(200),
  FOREIGN KEY (nombre_localidad) REFERENCES Localidad(nombre_localidad)
);

DROP TABLE IF EXISTS Estudio CASCADE;
CREATE TABLE Estudio(
    nombre_estudio VARCHAR(200),
    PRIMARY KEY (nombre_estudio)
);

DROP TABLE IF EXISTS Area CASCADE;
CREATE TABLE Area(
    nombre_area_estudios VARCHAR(200), 
    PRIMARY KEY (nombre_area_estudios)
);

DROP TABLE IF EXISTS Idioma CASCADE;
CREATE TABLE Idioma(
    idioma VARCHAR(100),
    PRIMARY KEY (idioma)
);

DROP TABLE IF EXISTS Oferta_academica CASCADE;
CREATE TABLE Oferta_academica(
    curso SMALLINT,
    nombre_estudio VARCHAR(200),
    nombre_centro VARCHAR(200),
    indice_ocupacion FLOAT,
    PRIMARY KEY (nombre_estudio, nombre_centro, curso),
    CONSTRAINT fk_Estudio FOREIGN KEY(nombre_estudio) REFERENCES Estudio(nombre_estudio),
    CONSTRAINT fk_Centro FOREIGN KEY(nombre_centro) REFERENCES Centro(nombre_centro)
);

DROP TABLE IF EXISTS Universidad_acuerdo CASCADE;
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

DROP TABLE IF EXISTS Pais CASCADE;
CREATE TABLE Pais(
    nombre_pais VARCHAR(200),
    nombre_universidad VARCHAR(200),
    PRIMARY KEY (nombre_pais),
    CONSTRAINT fk_Universidad FOREIGN KEY(nombre_universidad) REFERENCES Universidad_acuerdo(nombre_universidad)
);

DROP TABLE IF EXISTS UniAcuerdo_Pais;
CREATE TABLE UniAcuerdo_Pais(
    nombre_universidad VARCHAR(200),
    nombre_pais VARCHAR(200),
    PRIMARY KEY (nombre_universidad, nombre_pais),
    CONSTRAINT fk_Pais FOREIGN KEY(nombre_pais) REFERENCES Pais(nombre_pais),
    CONSTRAINT fk_Universidad FOREIGN KEY(nombre_universidad) REFERENCES Universidad_acuerdo(nombre_universidad)
);

DROP TABLE IF EXISTS Asignatura CASCADE;
CREATE TABLE Asignatura(
    nombre_asignatura VARCHAR(200),
    tasa_exito_ FLOAT,
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
    id SERIAL,
    nombre_estudio VARCHAR(200),
    nombre_centro VARCHAR(200),
    curso SMALLINT,
    tasa_graduacion FLOAT,
    tasa_abandono FLOAT,
    PRIMARY KEY (nombre_estudio, nombre_centro, id, curso),
    CONSTRAINT fk_Oferta FOREIGN KEY(nombre_estudio, nombre_centro, curso) REFERENCES Oferta_academica(nombre_estudio, nombre_centro, curso)
);

--Pasamos datos a la base de dato de las tablas temporales

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
        	WHEN POSITION(':' IN estudio) > 0 THEN 
            	SUBSTRING(estudio FROM POSITION(':' IN estudio) + 2)
        	WHEN POSITION('-' IN estudio) > 0 THEN 
            	SUBSTRING(estudio FROM POSITION('-' IN estudio) + 1)
        	ELSE 
            estudio
    	END 
        FROM oferta_ocupacion;
        
    INSERT INTO Estudio (nombre_estudio)
    	SELECT DISTINCT
    	CASE 
        	WHEN POSITION(':' IN estudio) > 0 THEN 
            	SUBSTRING(estudio FROM POSITION(':' IN estudio) + 2)
        	WHEN POSITION('-' IN estudio) > 0 THEN 
            	SUBSTRING(estudio FROM POSITION('-' IN estudio) + 1)
        	ELSE 
            estudio
    	END 
    	FROM resultados_titulacion;

    INSERT INTO Oferta_academica (curso, nombre_estudio, nombre_centro, indice_ocupacion)
        SELECT DISTINCT curso_academico, 
            CASE 
        	WHEN POSITION(':' IN estudio) > 0 THEN 
            	SUBSTRING(estudio FROM POSITION(':' IN estudio) + 2)
        	WHEN POSITION('-' IN estudio) > 0 THEN 
            	SUBSTRING(estudio FROM POSITION('-' IN estudio) + 1)
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

    INSERT INTO Asignatura (nombre_asignatura, tasa_exito)
        SELECT DISTINCT asignatura, tasa_exito
        FROM rendimiento_asignatura;

    INSERT INTO Resultados (tasa_graduacion, tasa_abandono, nombre_centro, nombre_estudio, curso)
        SELECT DISTINCT rt.tasa_graduacion, rt.tasa_abandono, rt.centro, oa.nombre_estudio, oa.curso
        FROM Oferta_academica oa, resultados_titulacion rt
        WHERE oa.nombre_centro = rt.centro
        AND oa.curso = rt.curso_academico;
       
    INSERT INTO Imparte (nombre_asignatura, nombre_estudio, nombre_centro, curso)
        SELECT DISTINCT asignatura,             
        CASE 
        	WHEN POSITION(':' IN estudio) > 0 THEN 
            	SUBSTRING(estudio FROM POSITION(':' IN estudio) + 2)
        	WHEN POSITION('-' IN estudio) > 0 THEN 
            	SUBSTRING(estudio FROM POSITION('-' IN estudio) + 1)
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

-- Creacion de trigger

	CREATE TABLE tabla_borrado_actualizacion (
    	id SERIAL PRIMARY KEY,
    	operacion TEXT,
    	tabla_afectada TEXT,
    	usuario TEXT,
    	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    	clave_primaria INT
	);

	CREATE OR REPLACE FUNCTION guardar_datos()
	RETURNS TRIGGER AS $$
	BEGIN
	    -- Guardar información en la tabla auxiliar para operaciones de borrado
	    IF TG_OP = 'DELETE' THEN
		INSERT INTO tabla_borrado_actualizacion (operacion, tabla_afectada, usuario, clave_primaria)
		VALUES ('BORRADO', TG_TABLE_NAME, current_user, current_timestamp, OLD.id);
	    END IF;

	    -- Guardar información en la tabla auxiliar para operaciones de actualización
	    IF TG_OP = 'UPDATE' THEN
		INSERT INTO tabla_borrado_actualizacion (operacion, tabla_afectada, usuario, clave_primaria)
		VALUES ('ACTUALIZACION', TG_TABLE_NAME, current_user, current_timestamp, NEW.id);
	    END IF;

	    RETURN NULL;
	END;
	$$
	LANGUAGE plpgsql;

-- Declaramos el trigger para todas tablas

DO $$
DECLARE
    tabla RECORD;
BEGIN
    FOR tabla IN SELECT table_name FROM information_schema.tables WHERE table_type = 'BASE TABLE' LOOP
        EXECUTE format('CREATE TRIGGER trigger_update_delete_%s
                        AFTER DELETE OR UPDATE ON %s
                        FOR EACH ROW
                        EXECUTE FUNCTION guardar_datos()', tabla.table_name, tabla.table_name);
    END LOOP;
END $$;

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
	
	SELECT nombre_centro, nombre_universidad, total_alumnos
	FROM (
    	SELECT nombre_centro, nombre_universidad, total_alumnos,
        ROW_NUMBER() OVER(PARTITION BY nombre_universidad ORDER BY total_alumnos DESC) AS row_num
    	FROM (
       	SELECT A.nombre_centro, M.nombre_universidad, COUNT(*) AS total_alumnos
       	FROM Oferta_movilidad M
        	INNER JOIN Oferta_academica A ON M.nombre_centro = A.nombre_centro
        	WHERE A.curso = '2022'
        	GROUP BY A.nombre_centro, M.nombre_universidad
    		) AS subconsulta
		) AS datos_historicos
	WHERE row_num = 1;

--VIsta

CREATE MATERIALIZED VIEW vista_asignaturas_teruel AS
(
    SELECT A.nombre_asignatura, A.tasa_exito, I.curso
    FROM Asignatura AS A
    JOIN Imparte AS I ON A.nombre_asignatura = I.nombre_asignatura
    JOIN Localidad AS L ON I.nombre_centro = L.nombre_centro
    WHERE L.nombre_localidad = 'Teruel'
    ORDER BY A.tasa_exito DESC
    LIMIT 10
)
UNION ALL
(
    SELECT A.nombre_asignatura, A.tasa_exito, I.curso
    FROM Asignatura AS A
    JOIN Imparte AS I ON A.nombre_asignatura = I.nombre_asignatura
    JOIN Localidad AS L ON I.nombre_centro = L.nombre_centro
    WHERE L.nombre_localidad = 'Teruel'
    ORDER BY R.tasa_graduacion ASC
    LIMIT 10
);