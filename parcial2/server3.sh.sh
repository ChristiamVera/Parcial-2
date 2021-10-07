#!/bin/bash


echo "Instalando paquetes"
sudo yum install vim -y 
sudo yum install bind-utils bind-libs bind-* -y


chmod 755 /var/named/static.com.fwd
chmod 755 /var/named/static.com.rev

service restart named
