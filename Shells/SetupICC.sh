#!/bin/bash
# set an infinite loop
while :
do
	PathICC="$PathICC/"
	PatICCLog="$PathICC/log/Engine"
	unset readEnterKey
	clear	
    # display menu
	echo "---------------------------------------- - -------------------------------------"
	echo " Menu Control Center                     -  Tareas Adminisrtación              -"
	echo "---------------------------------------- - -------------------------------------"
	echo " 1. Detener Control Center               -   X. Reboot Servidor                -"
	echo " 2. Iniciar Control Center               -   Y. Apagar Servidor                -"
	echo " 3. Configuracion Control Center         -   W. Logs Sterling                  -"
	echo "                                         -   Z. Salir del Menu                 -"
	echo "---------------------------------------- - -------------------------------------"
	# get input from the user 
	read -p "Enter your choicen [1-100] " choicen
	
	# get input from the user 
	case $choicen in
			     
  	1)
			echo ---------- Detener Control Center ----------------------------
			cd $PathICC/bin/
      		./stopEngine.sh -np
			sleep 5
			tail -f $PatICCLog*
			echo --------- Fin del Script -------------------------
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
			
	2)
			echo ---------- Subir Control Center ----------------------------
			cd $PathICC/bin/
      		./runEngine.sh
      		sleep 5
			tail -f $PatICCLog*
			echo --------- Fin del Script -------------------------
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
   
 	3)
			echo ---------- Configuracion Control Center ----------------------------
			cd $PathICC/bin/
      		./config.sh
			
			echo --------- Fin del Script -------------------------
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
			
	X) 
			echo --- Reiniciar Servidor
			sudo reboot
			echo --------- Fin del Script -------------------------
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		
	Y) # Apagar Servidor   
			echo --- Apagar Servidor
			sudo shutdown now
			echo --------- Fin del Script -------------------------
			read -p "Press [Enter] key to continue..." readEnterKey
			;;

		
			
	Z)
			echo "Gracias!"
			exit 0
			;;
	*)
			echo "Error: Invalid option..."	
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		esac
	done
