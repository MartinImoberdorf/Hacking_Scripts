#!/bin/bash

# Escaneo silenicioso - lento
function escaneoSilencioso(){
nmap -sS -T0 -p- -Pn -n "$1" -oN escaneo_silencioso 
echo
echo -e "\e[1;32mEscaneo completado y genereado el archivo 'escaneo_silencioso' \e[0m"
echo
}

# Escaneo medio
function escaneoMedio(){
nmap -sS -sC -sV -p- -n -Pn --open -vvv --min-rate 5000 "$1" -oN escaneo_medio
echo
echo -e "\e[1;32mEscaneo completado y genereado el archivo 'escaneo_medio' \e[0m"
echo
}

# Escaneo ruidoso - rapido
function escaneoRuidoso(){
nmap -sS -sV -sC -p- -T5 -v -A -PN -d --script-args=unsafe=1 "$1" -oN escaneo_ruidoso
echo
echo -e "\e[1;32mEscaneo completado y genereado el archivo 'escaneo_ruidoso' \e[0m"
echo
}

# Ayuda
function ayuda(){
echo
echo -e "\e[1;37mEl primer parametro debe contener la IP a escanear.\e[0m"
echo
}

# Error
function error(){
echo
echo -e "\e[1;31mOpción incorrecta. Por favor, seleccione una opción válida.\e[0m"
echo
}

echo -e "\e[1;34m
███████╗ ██████╗ █████╗ ███╗   ██╗   ████████╗██╗   ██╗██████╗ ███████╗
██╔════╝██╔════╝██╔══██╗████╗  ██║   ╚══██╔══╝╚██╗ ██╔╝██╔══██╗██╔════╝
███████╗██║     ███████║██╔██╗ ██║█████╗██║    ╚████╔╝ ██████╔╝█████╗  
╚════██║██║     ██╔══██║██║╚██╗██║╚════╝██║     ╚██╔╝  ██╔═══╝ ██╔══╝  
███████║╚██████╗██║  ██║██║ ╚████║      ██║      ██║   ██║     ███████╗
╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝      ╚═╝      ╚═╝   ╚═╝     ╚══════╝
By Imoberdorf Martin
\e[0m"
echo
                                                                 
if [ $# -eq 1 ]
then
while true
do
echo "1) Escaneo silenicioso - lento"
echo "2) Escaneo medio"
echo "3) Escaneo ruidoso - rapido"
echo "4) Salir. "
read -p "Seleccione el tipo de escaneo a realizar: " tipo
echo
case $tipo in
1) escaneoSilencioso;;
2) escaneoMedio;;
3) escaneoRuidoso;;
4) break;;
*) error;;
esac
done
else
echo -e "\e[1;31mNo se dieron los parametros correctos.\e[0m"
ayuda
fi
