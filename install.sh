#!/bin/bash

# Root permissions check
if [ "$EUID" -ne 0 ]; then
  echo -e "\033[1;31m[-] Kripya is script ko root user se chalayein (sudo bash).\033[0m"
  exit 1
fi

clear

while true; do
    # Aapka ASCII Art Header
    echo -e "\033[1;36m"
    echo " __  __    ____   __   __  _____    _                __    __  ______"
    echo "|  \/  | |___ \   \ V /  |  __ \  | |         /\     \ \  / / |___  /"
    echo "| |\/| |   __) |   \ V /   | |__) | | |        /  \     \ \/ /      / / "
    echo "| |  | |  |__ <     > <    |  ___/  | |       / /\ \     \  /      / /  "
    echo "| |  | |  ___) |   / . \   | |      | |____  / ____ \    | |      / /__ "
    echo "|_|  |_| |____/   /_/ \_\  |_|      |______|/_/    \_\   |_|     /_____|"
    echo -e "------------------------------------------------------------"
    echo -e " 1. install pufferpanel"
    echo -e " 2. add admin user"
    echo -e " 3. start panel"
    echo -e " 4. install domain on pp"
    echo -e " 0. Exit"
    echo -e "_________________________________________________"
    echo -e "\033[0m"

    read -p "Apna option chunein [1-4]: " choice

    case $choice in
        1)
            echo -e "\n\033[1;32m[+] Pufferpanel installation shuru ho rahi hai...\033[0m"
      sudo apt-get install curl gnupg apt-transport-https

curl -fsSL https://packagecloud.io/pufferpanel/pufferpanel/gpgkey | gpg --dearmor | sudo tee /etc/apt/keyrings/pufferpanel.gpg > /dev/null

echo "X-Repolib-Name: PufferPanel
Types: deb
URIs: https://packagecloud.io/pufferpanel/pufferpanel/any/
Suites: any
Components: main
Signed-By: /etc/apt/keyrings/pufferpanel.gpg" | sudo tee /etc/apt/sources.list.d/pufferpanel.sources > /dev/null

sudo apt update

sudo apt-get install pufferpanel
            echo -e "\n\033[1;32m[+] Pufferpanel successfully install ho gaya hai!\033[0m"
            echo ""
            read -p "Main menu par jaane ke liye [Enter] dabayein..."
            ;;
        2)
            echo -e "\n\033[1;32m[+] Admin User banane ke liye details bharein...\033[0m"
        sudo pufferpanel user add
            echo -e "\n\033[1;32m[+] Admin User successfully ban gaya hai!\033[0m"
            echo ""
            read -p "Main menu par jaane ke liye [Enter] dabayein..."
            ;;
        3)
            echo -e "\n\033[1;32m[+] Pufferpanel service start ki ja rahi hai...\033[0m"
            sudo systemctl enable --now pufferpanel
            echo -e "\n\033[1;32m[+] Panel successfully start ho chuka hai! (Port: 8080)\033[0m"
            echo ""
            read -p "Main menu par jaane ke liye [Enter] dabayein..."
             ;;
        4)
            echo -e "\n\033[1;32m[+] Ye service maintaince me he ye abhi 17/11/26 ko wapas ayegi...\033[0m"
            
            echo -e "\n\033[1;32m[+] Ye service maintaince me he ye abhi 17/11/26 ko wapas ayegi\033[0m"
            echo ""
            read -p "MYe service maintaince me he ye abhi 17/11/26 ko wapas ayegi..."
            ;;
        0)
             read -p "Thanks for using our tool 
              ----------------------------------------------------------------------
                  CopyRight 2026-2027 credit  NetherStudio, M3xplayz,M3tech
              ---------------------------------------------------------------------"
            ;;
        *)
            echo -e "\n\033[1;31m[-] Galat option! Kripya 1 se 4 ke beech chunein.\033[0m"
            sleep 2
            ;;
    esac
    clear
done
