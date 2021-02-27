#!/bin/bash

HIGHLIGHT='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

if [ `whoami` != 'root' ]
  then
  
    printf "${RED}[!]${NC}${HIGHLIGHT}You must be root to run this script !${NC}"
    exit
fi

# if [ -z "$1" ]
#   then
#     printf "${RED}[!]${NC}No argument supplied, usage : ${HIGHLIGHT}sudo bash setup.sh {website_name}${NC}"
# fi

# Get parameters from paras file as variables
source parameters.sh

printf "${RED}[-]${NC} -- ${HIGHLIGHT}updating system ...${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}apt update${NC}"
apt update

printf "${RED}[-]${NC} -- ${HIGHLIGHT}upgrading system ...${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}apt -y upgrade${NC}"
apt -y upgrade

printf "${RED}[-]${NC} -- ${HIGHLIGHT}installing required apt packages ...${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}apt install -y apache2 python3-pip libapache2-mod-wsgi-py3 python3-dev${NC}"
apt install -y apache2 python3-pip libapache2-mod-wsgi-py3 python3-dev

printf "${RED}[-]${NC} -- ${HIGHLIGHT}installing required pip packages ...${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}pip install -r ${PathToRequirements}${NC}"
pip install -r ${PathToRequirements}

printf "${RED}[-]${NC} -- ${HIGHLIGHT}enabling mod_wsgi for apache ...${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}a2enmod wsgi${NC}"
a2enmod wsgi


printf "${RED}[-]${NC} -- ${HIGHLIGHT}enabling apache service...${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}systemctl enable apache2${NC}"
systemctl enable apache2

printf "${RED}[-]${NC} -- ${HIGHLIGHT}restarting apache service...${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}systemctl restart apache2${NC}"
systemctl restart apache2

printf "${RED}[-]${NC} -- ${HIGHLIGHT}making website directories...${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}mkdir /var/www/${WebsiteName}${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}mkdir /var/www/${WebsiteName}/static${NC}"
mkdir /var/www/${WebsiteName}
mkdir /var/www/${WebsiteName}/static

# Create and copy configuration files
printf "${RED}[-]${NC} -- ${HIGHLIGHT}Creating config files ...${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}source fill_configs.sh${NC}"
source fill_configs.sh

printf "${RED}[-]${NC} -- ${HIGHLIGHT}Enabling ${WebsiteName} apache website${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}sudo a2ensite ${WebsiteName}${NC}"
sudo a2ensite ${WebsiteName}

printf "${RED}[-]${NC} -- ${HIGHLIGHT}Restarting apache ...${NC}"
printf "${RED}[<>]${NC} -- ${HIGHLIGHT}sudo systemctl restart apache2.service${NC}"
sudo systemctl restart apache2.service
