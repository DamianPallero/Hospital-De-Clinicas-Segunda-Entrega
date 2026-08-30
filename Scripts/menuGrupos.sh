#!/bin/bash

opc=10
year=$(date +%Y-%m-%d)

function menu() {
    clear
    echo "===================="
    echo "    MENU GESTIÓN DE GRUPOS  "
    echo "===================="
    echo "1. Agregar Grupo"
    echo "2. Borrar Grupo"
    echo "3. Listar Grupos"
    echo "4. Buscar Grupo"
    echo "0. Salir"
    echo "===================="
}

while [ $opc -ne 0 ]; do
    menu
    read -p "Ingrese una opción: " opc

    case $opc in
        1)
            ./agregarGrupo.sh
            ;;
        2)
            ./borrarGrupo.sh
            ;;
        3)
            ./listarGrupos.sh
            ;;
        4)
            ./buscarGrupo.sh
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