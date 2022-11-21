#!/bin/bash
# Author: Ariel Jacob (aka N3wRe4lity)
# Version: 1.1
# Bash script for search and looting exploits of the target open services.
# This script automates version scanning with nmap and searching with searchsploit for active services detected.

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
cyanColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n${redColour}[!] Exiting...\n${endColour}"
	tput cnorm; exit 1
}
# The -e for special characters.

# Banner
printf "${redColour}%s\n${endColour}" "

    	 _       _______ ________________        _______ _       _______________________________  
    	( \     (  ___  |  ___  )__   __/\     /(  ____ | \     (  ___  )__   __|__   __(  ____ \ 
    	| (     | (   ) | (   ) |  ) (  ( \   / ) (    )| (     | (   ) |  ) (     ) (  | (    \/ 
    	| |     | |   | | |   | |  | |   \ (_) /| (____)| |     | |   | |  | |     | |  | (_____  
    	| |     | |   | | |   | |  | |    ) _ ( |  _____) |     | |   | |  | |     | |  (_____  ) 
    	| |     | |   | | |   | |  | |   / ( ) \| (     | |     | |   | |  | |     | |        ) | 
    	| (____/\ (___) | (___) |  | |  ( /   \ ) )     | (____/\ (___) |__) (___  | |  /\____) | 
 	(_______(_______|_______)  )_(  |/     \|/      (_______(_______)_______/  )_(  \_______) 
                                                                                                  
"

echo -e "\t      (i) By Ariel Jacob (aka. N3wRe4lity)"
echo -e "\t(i) Bash script for search and looting exploits of the target open services."
echo -e "\t(i) This script automates version scanning with nmap and searching with searchsploit for"
echo -e "\t    active services detected.\n"

## Global Variables
declare -a SERVICES_ARRAY
VERSION="1.1"

##  Global line separator
function line() {
	for i in $(seq 110); do echo -ne "${redColour}="; done; echo -e "${endColour}"
#Create a line of 80 dashes in red. -n is for no line breaks, and -e is for parsing special characters
}

# version function
function version(){
	echo -e "\t${redColour}LootXploits${endColour}${blueColour} - version ${VERSION}${endColour}"
        echo -e "\n\t${greenColour}Thanks for use LootXploit!!${endColour}"
}

## Help Panel options
function  helpPanel() {
        echo  -e "\n${blueColour}[!] Use: ./lootXploits  ${endColour}"
        line
	echo -e "\n\t${grayColour}[-h]${endColour}${yellowColour} Show this help panel${endColour}"
	echo -e "\n\t${grayColour}[-v]${endColour}${yellowColour} Show version${endColour}"
        echo -e "\n\t${grayColour}[-g]${endColour}${yellowColour} Pass IP or domain as argument; performs search for exploits for general version of services.${endColour}"
        echo -e "\n\t${grayColour}[-e]${endColour}${yellowColour} Pass IP or domain as argument; performs search for exploits for especific version of services. \n\tWarning: if you don't get a result, try -g only ${endColour}"
        exit 0
}

## Goodbye function
function thanksGoodbye(){
	echo -e "\n\t${yellowColour}LootXploits${endColour} - version 1.1"
        echo -e "\t${greenColour}Thanks for use LootXploit!!${endColour}"
}

## Print Results Functions.

# Print searchsploit results.
# Loop for- The "!" indicates that the indices ([0],[1]...) of the array matrix are accessed and not the elements.
function printExploits() {
        echo -e "\t${purpleColour}[loot]${endColour} Searching exploits for services..."
        sleep 2
        echo -e "\t${purpleColour}[loot]${endColour} Sorting exploit loot...\n"
	sleep 1
	line
        echo -e "\t${purpleColour}[loot] ${endColour}${blueColour}EXPLOITS founds:${endColour}"
        line
        echo -e "\n"
	for row in ${!SERVICES_ARRAY[@]}; do
                echo -e "\t${purpleColour}[*]${endColour} Exploits for: ${yellowColour}${SERVICES_ARRAY[$row]}${EndColour}"
		line
                exploitFound=$(bash searchsploit ${SERVICES_ARRAY[$row]})  # Add filters variables in later versions
                echo "$exploitFound"
                line
                echo -e "\n"
        done
        echo -e "\n\t${purpleColour}[loot]${endColour} The adventure is over at " $(date)
        echo -e "\t${yellowColour}[tresure]${endColour} Great tresure!!"
        #thanksGoodbye
}

# Declaration of array SERVICES_ARRAY (the nmap output) and printing services.
function printServices() {
        echo -e "\t${greenColour}[lucky]${endColour} Sorting the exposed services..."
        echo -e "\n"
        line
        echo -e "\t${greenColour}[lucky]${endColour}${blueColour} Exposed Services:${endColour}"
	line
        printf "%s\n" "${SERVICES_ARRAY[@]}"    # Print elements (row) of matrix.
        line
        echo -e "\n"
	printExploits
}

##  Functions nmap commands to detect services. Call print functions.

function generalLoot() {
	echo -e "\t${yellowColour}[info]${endColour} The adventure for looting exploits begin..."
	sleep 1
	echo -e "\t${yellowColour}[info]${endColour} Detecting exposed services..."
	mapfile -t SERVICES_ARRAY < <(nmap -sS -n -sV -v ${VAR_TARGET} | grep -E "^[1-65535]" | awk '{print $3" "$4}' | grep -v -E "tcpwrapped|unknown")
	# Mapfile creates an Array with the output of the nmap command. Only services and general arguments are extracted, eg: ftp vftpd.
	printServices
}

function especificLoot() {
	echo -e "\t${yellowColour}[info]${endColour} The adventure for looting exploits begin..."
        sleep 1
        echo -e "\t${yellowColour}[info]${endColour} Detecting exposed services..."
	sleep 1
	echo -e "\t${yellowColour}[info]${endColour} Detecting specific versions..."
	mapfile -t SERVICES_ARRAY < <(nmap -sS -n -sV -v ${VAR_TARGET} | grep -E "^[1-65535]" | awk '{print $3" "$4" "$5" "$6}' | grep -v -E "tcpwrapped|unknown")
	# Mapfile creates an Array with the output of the nmap command. Only the most specific services and arguments are extracted, eg: ftp vftpd 3.2.1 etc.
	printServices
}

## read and process flags:
parameter_counter=0

while getopts ":g:e: vh" opt
do
    case $opt in
        v ) version
	    exit 0 ;;
        h ) helpPanel ;;  # Show help panel.
	g ) VAR_TARGET=$OPTARG
	    let parameter_counter+=1
	    echo -e "\n\t${greenColour}[info] Target defined for scan the services in their general versions.${endColour}"
	    generalLoot # service-general search function.
	    thanksGoodbye;;
        e ) VAR_TARGET=$OPTARG
	    let parameter_counter+=1
	    echo -e "\n\t${cyanColour}[info] Target defined for scan the services in their especific versions.${endColour}"
	    especificLoot   # service-specific search function
	    thanksGoodbye ;;
        \? ) echo -e "\n\t${redColour}[!] Invalid option -$OPTARG.\n${endColour}"
	    helpPanel
            exit 1 ;;
        : ) echo -e "\n\t${cyanColour}[!] -$OPTARG option require an argument.\n${endColour}"
            helpPanel
	    exit 1 ;;
    esac
done
shift $((OPTIND-1))

## Show help if an unwanted character is entered
if [ -n "$1" ]; then
	echo -e "\n\t${yellowColour}[!] Invalid option or character.\n${endColour}"
	helpPanel
fi

if [ $parameter_counter -eq 0 ]; then
	version
	helpPanel
fi
