#!/usr/bin/env bash

# PingIP v1.0 (GNU/Linux x86_64).
# Copyright (C) 2021 egrullon <Amix>.
# License GPLv3+: GNU GPL version 3 or later <https://www.gnu.org/licenses/gpl-3.0.html>.
# This program comes with ABSOLUTELY NO WARRANTY.
# This is free software and you are free to change and redistribute it.

# Author: egrullon <Amix>
# Date: 2021-04-06
# egrullon@cystrong.com
# www.cystrong.com
# Description: A simple ping sweep tool to detect up devices.

: '

 ███████████   ███                      █████ ███████████ 
░░███░░░░░███ ░░░                      ░░███ ░░███░░░░░███
 ░███    ░███ ████  ████████    ███████ ░███  ░███    ░███
 ░██████████ ░░███ ░░███░░███  ███░░███ ░███  ░██████████ 
 ░███░░░░░░   ░███  ░███ ░███ ░███ ░███ ░███  ░███░░░░░░  
 ░███         ░███  ░███ ░███ ░███ ░███ ░███  ░███        
 █████        █████ ████ █████░░███████ █████ █████       
░░░░░        ░░░░░ ░░░░ ░░░░░  ░░░░░███░░░░░ ░░░░░        
                               ███ ░███                   
                              ░░██████                    
                               ░░░░░░                    v1.0

'

set -o errexit

# ANSI Colors

re="\e[0;91m"
wh="\e[0;97m"

if [[ "$1" == "" ]]; then
	echo -e "\n${re}[${wh}*${re}] You need to put an IP Address!! ${reset}"
	echo -e "${re}[${wh}*${re}] Usage: ./pingip.sh 192.168.0\n  ${reset}"

else
	for ip in $( seq 1 254 ); do
		timeout 1 bash -c "ping -c 1 $1.$ip 2> /dev/null" | grep -i "64 bytes" | cut -d " " -f4 | tr -d ":" &
	done; wait

fi
