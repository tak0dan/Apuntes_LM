#!/usr/bin/env bash
# Since I work on NixOS - this is the right way for me :)

########################################
# VARIABLES
########################################

aula=""
inicio=""
fin=""
modo=""

########################################
# INPUT
########################################

read -p "Dígame el número de aula: " aula
read -p "Deme el número de PC inicial: " inicio
read -p "Deme el número de PC final: " fin
read -p "Modo (ping / test): " modo

echo
echo "Probando conectar con el aula $aula, PC'S desde el $inicio hasta el $fin"
echo

########################################
# CASE SWITCH
########################################

case "$modo" in

    ping)

        for pc in $(seq "$inicio" "$fin")
        do
            ip="10.2.$aula.$pc"

            ping -c 1 -W 1 "$ip" > /dev/null 2>&1

            ####################################
            # IF CONDITION
            ####################################

            if [ $? -eq 0 ]
            then
                echo "El ordenador $ip está en la red"
            else
                echo "El ordenador $ip NO  se encuentra operativo"
            fi

        done
        ;;

    test)

        for pc in $(seq "$inicio" "$fin")
        do
            echo "Probando PC número $pc"
        done
        ;;

    *)

        echo "Modo no válido"
        ;;

esac

########################################
# END
########################################

echo
echo "Script terminado"
