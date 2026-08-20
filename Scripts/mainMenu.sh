#!/bin/bash

opc=10
fecha=$(date +"%Y-%m-%d")

function menu(){
    echo "=============================================="
    echo "             Menú Principal                   "
    echo "=============================================="
    echo "1 - Gestión de Usuarios"
    echo "2 - Gestión de Grupos"
    echo "3 - Gestión de Respaldos"
    echo "4 - Gestión de Redes"
    echo "5 - Gestión de Bases de Datos"
    echo "6 - Gestión de Firewall"
    echo "7 - Gestión de Logs del Sistema"
    echo "8 - Gestión de Docker"
    echo "9 - Salir"
    echo "=============================================="
    echo "Seleccione una opción: "
}

while [ $opc -ne 9 ]; do
    menu
    read opc
    case $opc in
        1) source menuUsuarios.sh;;
        2) echo "Gestión de Grupos";;
        3) echo "Gestión de Respaldos";;
        4) echo "Gestión de Redes";;
        5) echo "Gestión de Bases de Datos";;
        6) source menuFirewall.sh;;
        7) echo "Gestión de Logs del Sistema";;
        8) echo "Gestión de Docker";;
        9) echo "Saliendo...";;
        *) echo "Opción inválida. Intente nuevamente.";;
    esac
done