#!/bin/bash

echo "===================="
echo "  LISTAR RESPALDOS DISPONIBLES  "
echo "===================="

echo "Respaldos de BD disponibles:"
ls -l /root/respaldos_bd/*.sql

echo "Respaldos de logs disponibles:"
ls -l /root/respaldos_logs/*.tar.gz