#!/bin/bash

# Script para PostgreSQL. Diego Lassa Ibañez 718573

# Ejecutar script de descarga de ficheros CSV
./descarga_csv_P1.sh

# Creacion de BD y usuario
psql -U postgres -d postgres -f crearUsuarioPostgresql.sql
