#!/bin/bash
set -euo pipefail

echo "===================="
echo "  ENVIAR RESPALDO REMOTO  "
echo "===================="

read -p "Ruta local del archivo o directorio a respaldar: " SOURCE_PATH
SOURCE_PATH="${SOURCE_PATH//\\//}"

if [ ! -e "$SOURCE_PATH" ]; then
  echo "Error: La ruta '$SOURCE_PATH' no existe."
  exit 1
fi

read -p "Nombre del respaldo (sin extensión): " BACKUP_NAME
BACKUP_NAME="${BACKUP_NAME:-respaldo_$(date +%Y%m%d_%H%M%S)}"

read -p "Usuario remoto: " REMOTE_USER
read -p "Host remoto: " REMOTE_HOST
read -p "Ruta remota de destino (ej. /home/usuario/backups): " REMOTE_DIR
read -p "Puerto SSH [22]: " SSH_PORT
SSH_PORT="${SSH_PORT:-22}"

TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
ARCHIVE_PATH="/tmp/${BACKUP_NAME}_${TIMESTAMP}.tar.gz"

echo
echo "Creando respaldo..."
tar -czf "$ARCHIVE_PATH" -C "$(dirname "$SOURCE_PATH")" "$(basename "$SOURCE_PATH")"

echo "Conectando a ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"
ssh -p "$SSH_PORT" "${REMOTE_USER}@${REMOTE_HOST}" "mkdir -p '$REMOTE_DIR'"

scp -P "$SSH_PORT" "$ARCHIVE_PATH" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/"

echo
echo "Respaldo enviado correctamente."
echo "Archivo remoto: ${REMOTE_DIR}/$(basename "$ARCHIVE_PATH")"

rm -f "$ARCHIVE_PATH"