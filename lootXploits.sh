#!/bin/bash

# Author: Ariel Jacob (aka N3wRe4lity)
# Version: 1.0
# Bash script for search and looting exploits of the target open services.
# This script automates version scanning with nmap and searching with searchsploit for active services detected.
# Currently working on options menus and flags.


#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n${redColour}[!] Exiting...\n${endColour}"
	tput cnorm; exit 1
}
# El -e hace que atienda a caracteres especiales.

# Banner
printf "%s\n" "

 _       _______ ________________        _______ _       _______________________________  
( \     (  ___  |  ___  )__   __/\     /(  ____ | \     (  ___  )__   __|__   __(  ____ \ 
| (     | (   ) | (   ) |  ) (  ( \   / ) (    )| (     | (   ) |  ) (     ) (  | (    \/ 
| |     | |   | | |   | |  | |   \ (_) /| (____)| |     | |   | |  | |     | |  | (_____  
| |     | |   | | |   | |  | |    ) _ ( |  _____) |     | |   | |  | |     | |  (_____  ) 
| |     | |   | | |   | |  | |   / ( ) \| (     | |     | |   | |  | |     | |        ) | 
| (____/\ (___) | (___) |  | |  ( /   \ ) )     | (____/\ (___) |__) (___  | |  /\____) | 
(_______(_______|_______)  )_(  |/     \|/      (_______(_______)_______/  )_(  \_______) 
                                                                                          

"
echo "   (i) LootXploits v 1.0 - By Ariel Jacob (aka. N3wRe4lity) "
echo "   (*) Bash script for search and looting exploits of the target open services."
echo "   (*) This script automates version scanning with nmap and searching with searchsploit for active services detected."
echo "   (!) Currently working on options menus and flags."
echo
echo "   (->) Use: ./lootXploits.sh [IP] "

# Variables Globales
target=$1


## Mapfile crea un Array con la salida del comando nmap. Sólo se extraen los servicios.
mapfile -t nmapOutput < <(nmap -sS -n -sV -v ${target} | grep -E "^[1-65535]" | awk '{print $3" "$4" "$5}' | grep -v -E "tcpwrapped|unknown")
declare -a nmapOutput

echo -e "\n\n"
echo "+==================================+"
echo -e "${blueColour}[*] Servicios expuestos:${endColour}"
echo "+==================================+"
printf "%s\n" "${nmapOutput[@]}"    # Imprime los elementos (row) de la matriz
echo "+==================================+"
echo -e "\n\n"
echo "+==================================+"
echo -e "${blueColour}[*] EXPLOITS founds:${endColour}"
echo "+==================================+"
echo -e "\n\n"

## Bucle for- El "!" indica que se accede a los índices ([0],[1]...)de la matriz del array y no a los elementos.
for row in ${!nmapOutput[@]}; do
        echo "Exploits for: ${nmapOutput[$row]}"
        echo "----------------------------------"
        exploitFound=$(bash searchsploit ${nmapOutput[$row]})
        echo "$exploitFound"
        echo "----------------------------------"
        echo -e "\n\n"
done

