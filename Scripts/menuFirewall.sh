#!/bin/bash

opc=10
fecha=$(date +"%Y-%m-%d")

function menu(){
	clear
	echo "=============================================="
	echo "			 GESTIÓN DE FIREWALLD               "
	echo "=============================================="
	echo "1 - Ver estado del firewall"
	echo "2 - Permitir HTTP/HTTPS"
	echo "3 - Bloquear IP"
	echo "4 - Política de seguridad"
	echo "5 - Solicitudes de ping"
	echo "6 - Servicios permitidos"
	echo "7 - Bloquear MAC"
	echo "8 - Agregar servicios"
	echo "0 - Salir"
	echo "=============================================="
}

while [ $opc -ne 0 ]; do
	menu
	read -p "Ingrese una opción: " opc
	case $opc in
		1) ./verEstadoFirewall.sh ;;
		2) ./permitirHTTP.sh ;;
		3) ./bloquearIP.sh ;;
		4) ./politicaSeguridad.sh ;;
		5) ./solicitudesPing.sh ;;
		6) ./serviciosPermitidos.sh ;;
		7) ./bloquearMAC.sh ;;
		8) ./agregarServicios.sh ;;
		0) echo "Saliendo del menú..." ;;
		*) echo "Opción inválida. Intente nuevamente." ;;
	esac
	read -p "Presione Enter para continuar..."
done