#!/bin/bash

fecha=$(date +%Y-%m-%d_%H-%M-%S)

echo "===================="
echo "  CREAR RESPALDO DE LOGS  "
echo "===================="

tar -czvf $fecha-logs_sistema_backup.tar.gz /var/log
mv $fecha-logs_sistema_backup.tar.gz /root/respaldos_logs/
echo "Respaldo de logs del sistema creado exitosamente."