#!/bin/bash

RUNNING="true"
MENU_OPTION="0"
UPDATING="false"
while [ "$RUNNING" = "true" ]; do
  WHIPTAIL=$(whiptail --title "Dev-Init" --menu "Choose an option" 15 60 4 \
    "1" "Development Tools List" \
    "2" "Productivity Tools List" \
    "3" "Update and Upgrade OS" \
    "4" "Exit" 3>&1 1>&2 2>&3)
  if [ "$WHIPTAIL" = "1" ]; then
    MENU_OPTION="1"
  elif [ "$WHIPTAIL" = "2" ]; then
    MENU_OPTION="2"
  elif [ "$WHIPTAIL" = "3" ]; then
    MENU_OPTION="3"
  elif [ "$WHIPTAIL" = "4" ]; then
    MENU_OPTION="4"
  fi

  if [ "$MENU_OPTION" = "1" ]; then
    WHIPTAIL=$(whiptail --title "Dev-Init" --menu "Choose an option" 15 60 4 \
      "1" "Install VsCode" \
      "2" "Install Git" \
      "3" "Install Postman" \
      "4" "Install nodejs (via apt)" \
      "5" "Install nodejs (via snap)" \
      "6" "Install npm" \
      "7" "Install yarn" \
      "8" "Install Docker" \
      "9" "Install Docker Compose" \
      "10" "Install Dbeaver" \
      "11" "Install PgAdmin" \
      "12" "Install MySQL Workbench" \
      "13" "Install MongoDB Compass" \
      "14" "Install Insonmia" \
      "15" "Install Postman" \
      "16" "Exit" 3>&1 1>&2 2>&3)
    if [ "$WHIPTAIL" = "1" ]; then
      sudo snap install --classic code
    elif [ "$WHIPTAIL" = "2" ]; then
      sudo apt install git
    elif [ "$WHIPTAIL" = "3" ]; then
      sudo snap install postman
    elif [ "$WHIPTAIL" = "4" ]; then
      sudo apt install nodejs
    elif [ "$WHIPTAIL" = "5" ]; then
      sudo snap install node --classic --channel=12
    elif [ "$WHIPTAIL" = "6" ]; then
      sudo apt install npm
    elif [ "$WHIPTAIL" = "7" ]; then
      sudo npm install --global yarn
    elif [ "$WHIPTAIL" = "8" ]; then
      sudo apt install docker 
    elif [ "$WHIPTAIL" = "9" ]; then
      sudo apt install docker-compose
    elif [ "$WHIPTAIL" = "10" ]; then
      sudo snap install dbeaver-ce
    elif [ "$WHIPTAIL" = "11" ]; then
      sudo snap install pgadmin4
    elif [ "$WHIPTAIL" = "12" ]; then
      sudo snap install mysql-workbench-community
    elif [ "$WHIPTAIL" = "13" ]; then
      sudo snap install compass
    elif [ "$WHIPTAIL" = "14" ]; then
      sudo snap install insomnia
    elif [ "$WHIPTAIL" = "15" ]; then
      sudo snap install postman
    elif [ "$WHIPTAIL" = "16" ]; then
      MENU_OPTION="0"
    fi
  elif [ "$MENU_OPTION" = "2" ]; then
    WHIPTAIL=$(whiptail --title "Dev-Init" --menu "Choose an option" 15 60 4 \
      "1" "Install Spotify" \
      "2" "Install Slack" \
      "3" "Install Discord" \
      "4" "Install Zoom" \
      "5" "Exit" 3>&1 1>&2 2>&3)
    if [ "$WHIPTAIL" = "1" ]; then
      sudo snap install spotify
    elif [ "$WHIPTAIL" = "2" ]; then
      sudo snap install slack --classic
    elif [ "$WHIPTAIL" = "3" ]; then
      sudo snap install discord
    elif [ "$WHIPTAIL" = "4" ]; then
      sudo snap install zoom-client
    elif [ "$WHIPTAIL" = "5" ]; then
      MENU_OPTION="0"
    fi
  elif [ "$MENU_OPTION" = "3" ]; then
    whiptail --title "Dev-Init" --msgbox "Updating and Upgrading OS" 8 78
    UPDATING="true"
    while [ "$UPDATING" = "true" ]; do
      sudo apt update -y
      sudo apt upgrade -y
      sudo apt autoremove -y
      sudo apt autoclean -y
      sudo apt clean -y
      sudo snap refresh 
      if [ "$?" = "0" ]; then
        whiptail --title "Dev-Init" --msgbox "Update and Upgrade Successful" 8 78
        UPDATING="false"
      else
        whiptail --title "Dev-Init" --msgbox "Update and Upgrade Failed" 8 78
        UPDATING="false"
      fi
    done

    MENU_OPTION="0"

  elif [ "$MENU_OPTION" = "4" ]; then
    whiptail --title "Dev-Init" --menu "Exit" 10 60
    RUNNING="false"
  fi
done
