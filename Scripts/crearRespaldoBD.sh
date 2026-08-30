#!/bin/bash

fecha=$(date +%Y-%m-%d_%H-%M-%S)

echo "===================="
echo "  CREAR RESPALDO De BD  "
echo "===================="

mysqldump -u root -p --databases cartas --routines --triggers --events > $fecha-cartas_bd_backup.sql
mv $fecha-cartas_bd_backup.sql /root/respaldos_bd/
echo "Respaldo de BD creado exitosamente."
