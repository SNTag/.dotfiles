#!/bin/bash
#
#Very useful in getting the ip address of my raspberry pi. In case thats not the
#point, I added the option to pull IPs of all devices on network.

function raspPiFinder {
    if [ "${1}" == "pi" ]; then
        sudo nmap -sP 192.168.1.111/24 | awk '/^Nmap/{ip=$NF}/B8:27:EB/{print ip}'

    else
        sudo nmap -sP 192.168.1.111/24

    fi
}

raspPiFinder $1
