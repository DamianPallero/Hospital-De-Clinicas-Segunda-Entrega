#!/bin/bash

opc=10
date=$(date +"%Y-%m-%d")

function menuUsuarios(){
    clear
    echo "=============================================="
    echo "             Gestión de Usuarios              "
    echo "=============================================="
    echo "1 - Crear Usuario"
    echo "2 - Borrar Usuario"
    echo "3 - Listar Usuarios"
    echo "4 - Buscar Usuario"
    echo "5 - Cambiar Contraseña de Usuario"
    echo "6 - Bloquear Usuario"
    echo "7 - Desbloquear Usuario"
    echo "8 - Volver al Menú Principal"
    echo "=============================================="
    echo "Seleccione una opción: "
}

while [ $opc -ne 8 ]; do
    menuUsuarios
    read opc
    case $opc in
        1) source crearUsuario.sh;;
        2) source borrarUsuario.sh;;
        3) source listarUsuarios.sh;;
        4) source buscarUsuario.sh;;
        5) source cambiarContrasena.sh;;
        6) source bloquearUsuario.sh;;
        7) source desbloquearUsuario.sh;;
        8) echo "Volviendo al Menú Principal...";;
        *) echo "Opción inválida. Intente nuevamente.";;
    esac
done