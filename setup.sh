#!/bin/bash

HIGHLIGHT='\033[0;33m'
NC='\033[0m' # No Color

if [ `whoami` != 'root' ]
  then
  
    printf "${HIGHLIGHT}You must be root to run this script !${NC}"
    exit
fi

if [ -z "$1" ]
  then
    printf "No argument supplied, usage : ${HIGHLIGHT}sudo bash setup.sh {website_name}${NC}"
fi

website_name=$1

apt update
apt upgrade -y

apt install -y apache2 python3-pip libapache2-mod-wsgi-py3 python3-dev

a2enmod wsgi

systemctl enable apache2
systemctl restart apache2

mkdir /var/www/$website_name
