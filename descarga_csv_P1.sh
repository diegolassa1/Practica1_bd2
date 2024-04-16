#!/bin/bash

# Descarga de ficheros
# Resultados por titulacion (2021 y 2022)
wget  https://zaguan.unizar.es/record/118234/files/CSV.csv -O resultados_titulacion_2021.csv
wget  https://zaguan.unizar.es/record/127129/files/CSV.csv -O resultados_titulacion_2022.csv

# Oferta y ocupación de plazas (2021 y 2022)
wget https://zaguan.unizar.es/record/108270/files/CSV.csv -O oferta_ocupacion_2021.csv 
wget https://zaguan.unizar.es/record/121572/files/CSV.csv -O oferta_ocupacion_2022.csv

# Notas de corte definitivas del cupo general a estudios de grado. (2021 y 2022)
wget https://zaguan.unizar.es/record/109322/files/CSV.csv -O notas_corte_2021.csv 
wget https://zaguan.unizar.es/record/121571/files/CSV.csv -O notas_corte_2022.csv 

# Acuerdos de movilidad de estudiantes ERASMUS y SICUE.(2021 y 2022)
wget https://zaguan.unizar.es/record/107373/files/CSV.csv -O acuerdos_movilidad_2021.csv
wget https://zaguan.unizar.es/record/118238/files/CSV.csv -O acuerdos_movilidad_2022.csv

#Alumnos egresados por titulación. Este fichero presenta datosagregados por sexo y tipo de egreso, sólo queremos obtenerlos alumnos que abandonan voluntariamente el estudio cada año.
wget https://zaguan.unizar.es/record/118236/files/CSV.csv -O egresados_titulacion_2021.csv
wget https://zaguan.unizar.es/record/127131/files/CSV.csv -O egresados_titulacion_2022.csv

#Rendimiento por asignatura y titulación. Deseamos disponer de los datos de los grados impartidos en Teruel.
wget https://zaguan.unizar.es/record/118235/files/CSV.csv -O rendimiento_asignatura_2021.csv
wget https://zaguan.unizar.es/record/127130/files/CSV.csv -O rendimiento_asignatura_2022.csv

