#!/bin/bash

sed -i "s/{{{WebsiteName}}}/${WebsiteName}/" apache_site.conf
sed -i "s/{{{DomainName}}}/${DomainName}/" apache_site.conf
sed -i "s/{{{LimitRequestBody}}}/${LimitRequestBody}/" apache_site.conf
sed -i "s/{{{Processes}}}/${Processes}/" apache_site.conf
sed -i "s/{{{Threads}}}/${Threads}/" apache_site.conf
sed -i "s/{{{StaticDirPath}}}/${StaticDirPath}/" apache_site.conf
sed -i "s/{{{RobotsFilePath}}}/${RobotsFilePath}/" apache_site.conf
sed -i "s/{{{FaviconPath}}}/${FaviconPath}/" apache_site.conf
sed -i "s/{{{ServiceUser}}}/${ServiceUser}/" apache_site.conf

cp apache_site.conf /etc/apache2/sites-available/${WebsiteName}.conf

sed -i "s/{{{PathToApp}}}/${PathToApp}/" site.wsgi
sed -i "s/{{{AppFactoryScriptName}}}/${AppFactoryScriptName}/" site.wsgi

cp site.wsgi /var/www/${WebsiteName}/${WebsiteName}.wsgi
