#!/bin/bash

echo "===================="
echo "  RESTAURAR RESPALDO DE BD  "
echo "===================="

echo "Lista de respaldos disponibles:"
ls -l /root/respaldos_bd/*.sql
read -p "Ingrese el nombre del archivo de respaldo a restaurar (con extensión .sql): " respaldo

mysql -u root -p < /root/respaldos_bd/$respaldo
echo "Respaldo de BD restaurado exitosamente."