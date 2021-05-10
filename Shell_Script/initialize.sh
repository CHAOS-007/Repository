#!/bin/bash

main(){

    aptSource = '/etc/apt/sources.list'
    shellName = 'Bash'
    v2rayInstall = 'no'
    v2rayConfig = '/usr/local/etc/v2ray/config.json'
    ddnsInstall = 'no'

    printf '%s\n' 'This is the initializating process for your Linux system (Debian based).'
    printf '%s\n' 
    printf '%s\n' "${BLUE}First, I'd like to know your preferences."

    read -p "1) Which shell do you use ? [ ${BLUE}Bash (default) ${Normal}| Zsh ] : " shellName
    read -p "3) Do you want to install v2ray service and enable it ? [ yes | ${BLUE}no (default) ${Normal}] : " v2rayInstall
    read -p "2) Where is your v2ray config file location [ ${BLUE}File location (empty if default) ${Normal}] : " v2rayConfig
    read -p "3) Do you want to install DDNS-Go service and enable it ? [ yes | ${BLUE}no (default) ${Normal}] : " ddnsInstall

    printf '%s\n' "Great! Now, here are something you need to know before."
    printf '%s\n'
    printf '%s\n' "    1) The origional apt sources will be replaced by mirrors from USTC."
    printf '%s\n' "    2) TBC"


    # Replace apt sources. Update applications.
    sudo sed 's/ports.ubuntu.com/mirrors.ustc.edu.cn/g' $aptSource
    sudo apt update && sudo apt -y upgrade && sudo apt autoremove


    # Beautification process of shell.
    if [[$shellName = 'Bash' || $shellName = 'bash']] ; then
        bash 
        ./bash.sh
    elif  [[$shellName = 'Zsh' || $shellName = 'zsh']] ; then
        ./zsh.sh
    else
        printf '%s\n' "Your choice of shell is invalid, process skipped."
    fi


    # Installation & configuration process of v2ray.
    ./v2ray.sh
}

main