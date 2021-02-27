#!/bin/bash

source parameters.sh

sed -i "s/{{{WebsiteName}}}/${WebsiteName}/g" apache_site.conf
sed -i "s/{{{DomainName}}}/${DomainName}/g" apache_site.conf
sed -i "s/{{{LimitRequestBody}}}/${LimitRequestBody}/g" apache_site.conf
sed -i "s/{{{Processes}}}/${Processes}/g" apache_site.conf
sed -i "s/{{{Threads}}}/${Threads}/g" apache_site.conf
sed -i "s/{{{StaticDirPath}}}/${StaticDirPath}/g" apache_site.conf
sed -i "s/{{{RobotsFilePath}}}/${RobotsFilePath}/g" apache_site.conf
sed -i "s/{{{FaviconPath}}}/${FaviconPath}/g" apache_site.conf
sed -i "s/{{{ServiceUser}}}/${ServiceUser}/g" apache_site.conf

cp apache_site.conf /etc/apache2/sites-available/${WebsiteName}.conf

sed -i "s/{{{PathToApp}}}/${PathToApp}/g" site.wsgi
sed -i "s/{{{AppFactoryScriptName}}}/${AppFactoryScriptName}/g" site.wsgi

cp site.wsgi /var/www/${WebsiteName}/${WebsiteName}.wsgi
