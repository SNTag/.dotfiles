#!/bin/bash

function raspPiFinder {
    if [ "${1}" == "pi" ]; then
        sudo nmap -sP 192.168.1.111/24 | awk '/^Nmap/{ip=$NF}/B8:27:EB/{print ip}'

    else
        sudo nmap -sP 192.168.1.111/24

    fi
}

raspPiFinder $1
