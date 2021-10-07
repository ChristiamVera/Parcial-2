#!/bin/bash

echo "Instalando paquetes"
sudo yum install vim -y 
sudo yum install bind-utils bind-libs bind-* -y

echo "Creando usuario"
useradd vera1
passwd vera1:vera1
mkdir -p /var/sftp/static
chown root:root /var/sftp/
chmod 755 /var/sftp/
chown vera1:vera1 /var/sftp/static/

service restart named
systemctl restart sshd


