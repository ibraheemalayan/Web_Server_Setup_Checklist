#!/bin/bash

source parameters.sh

PythonHome=$PathToApp

sed -i "s|{{{WebsiteName}}}|${WebsiteName}|g" apache_site.conf
sed -i "s|{{{DomainName}}}|${DomainName}|g" apache_site.conf
sed -i "s|{{{LimitRequestBody}}}|${LimitRequestBody}|g" apache_site.conf
sed -i "s|{{{Processes}}}|${Processes}|g" apache_site.conf
sed -i "s|{{{Threads}}}|${Threads}|g" apache_site.conf
sed -i "s|{{{StaticDirPath}}}|${StaticDirPath}|g" apache_site.conf
sed -i "s|{{{RobotsFilePath}}}|${RobotsFilePath}|g" apache_site.conf
sed -i "s|{{{FaviconPath}}}|${FaviconPath}|g" apache_site.conf
sed -i "s|{{{ServiceUser}}}|${ServiceUser}|g" apache_site.conf

default_python_path=`python3 -c "import sys; print(':'.join(sys.path)[1:])"`
PythonPath="${PythonHome}:${default_python_path}"

sed -i "s|{{{PythonHome}}}|${PythonHome}|g" apache_site.conf
sed -i "s|{{{PythonPath}}}|${PythonPath}|g" apache_site.conf

error404handle=""

if [ -z ${Custom404PagePath} ]
  then
    printf "${RED}[**]${NC}No custom 404 page was given, ${HIGHLIGHT}Using Default Apache 404 Page${NC}"
else
    printf "${RED}[**]${NC}Using ${HIGHLIGHT}${Custom404PagePath}${NC} As 404 page"
    error404handle="ErrorDocument 404 ${Custom404PagePath}"
fi

sed -i "s|{{{ErorrHandler}}}|${error404handle}|g" apache_site.conf

cp apache_site.conf /etc/apache2/sites-available/${WebsiteName}.conf

sed -i "s|{{{AppFactoryScriptName}}}|${AppFactoryScriptName}|g" site.wsgi

cp site.wsgi /var/www/${WebsiteName}/${WebsiteName}.wsgi
