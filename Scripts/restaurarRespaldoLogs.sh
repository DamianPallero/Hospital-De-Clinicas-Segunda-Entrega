#!/bin/bash

echo "===================="
echo "  RESTAURAR RESPALDO DE LOGS "
echo "===================="

echo "Lista de respaldos disponibles:"
ls -l /root/respaldos_logs/*.tar.gz
read -p "Ingrese el nombre del archivo de respaldo a restaurar (con extensión .tar.gz): " respaldo

tar -xzvf /root/respaldos_logs/$respaldo -C /root/logs_restaurados/
echo "Respaldo de logs del sistema restaurado exitosamente."