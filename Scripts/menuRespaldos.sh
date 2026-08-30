#!/bin/bash

opc=10
fecha=$(date +%Y-%m-%d)

function menu() {
    clear
    echo "===================="
    echo "  GESTIÓN DE RESPALDOS  "
    echo "===================="
    echo "1. Crear Respaldo de BD"
    echo "2. Crear Respaldo de Logs del Sistema"
    echo "3. Restaurar Respaldo de BD"
    echo "4. Restaurar Respaldo de Logs del Sistema"
    echo "5. Eliminar Respaldo"
    echo "6. Listar Respaldos"
    echo "7. Configurar Respaldo Automático"
    echo "8. Enviar Respaldo a Ubicación Remota"
    echo "0. Salir"
    echo "===================="
}

while [ $opc -ne 0 ]; do
    menu
    read -p "Ingrese una opción: " opc

    case $opc in
        1)
            ./crearRespaldoBD.sh
            ;;
        2)
            ./crearRespaldoLogs.sh
            ;;
        3)
            ./restaurarRespaldoBD.sh
            ;;
        4)
            ./restaurarRespaldoLogs.sh
            ;;
        5)
            ./eliminarRespaldo.sh
            ;;
        6)
            ./listarRespaldos.sh
            ;;
        7)
            ./configurarRespaldoAutomatico.sh
            ;;
        8)
            ./enviarRespaldoRemoto.sh
            ;;
        0)
            echo "Saliendo del menú..."
            ;;
        *)
            echo "Opción inválida. Intente nuevamente."
            ;;
    esac

    read -p "Presione Enter para continuar..."
done