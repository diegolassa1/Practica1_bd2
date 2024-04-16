#!/bin/bash

# Script para MySQL. Diego Lassa Ibañez 718573

# Ejecutar script de descarga de ficheros CSV
./descarga_csv_P1.sh

mysql -u root -p < crearUsuariomysql.sql