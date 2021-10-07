#!/bin/bash


echo "Deteniendo NetworkManager"
service NetworkManager stop
chkconfig NetworkManager off

service firewalld restart
firewall-cmd --zone=dmz --add-interface=eth1 --permanent
firewall-cmd --zone=internal --add-interface=eth2 --permanent

echo "Añadiendo servicios firewall"
firewall-cmd --zone=dmz --add-service=dns --permanent
firewall-cmd --zone=dmz --add-service=ftp --permanent

echo "Añadiendo enmascaramiento"
firewall-cmd --zone=dmz --add-masquerade --permanent
firewall-cmd --zone=internal --add-masquerade --permanent

echo "Redireccionamiento de puertos.."
firewall-cmd --zone=dmz --add-forward-port=port=53:proto=udp:toport=53:toaddr=192.168.100.2 --permanent
firewall-cmd --zone=dmz --add-forward-port=port=222:proto=tcp:toport=222:toaddr=192.168.100.2 --permanent

echo "Reiniciando firewall"
firewall-cmd --reload
service firewalld restart