#!/bin/bash

if [ `whoami` != 'root' ]
  then
    echo "You must be root to run this script !"
    exit
fi

apt update
apt upgrade -y
apt install -y apache2 python3-pip libapache2-mod-wsgi-py3 python3-dev
