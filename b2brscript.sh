#!/bin/bash

#VM info
hostnamectl
echo "Here you can see the OS and the hostname"
sleep 5
groups
echo "Groups the current user is in"
sleep 5
lsblk
echo "The partitions and that they are encrypted"
sleep 5

#Creating user and group then adding user to group
sudo adduser user42
echo "Added user 'user42'"
sleep 2
sudo groupadd evaluation
echo "Created group 'evaluation'"
sleep 2
sudo usermod -aG evaluation user42
echo "Added 'user42' to group 'evaluation'"
sudo usermod -aG sudo user42
echo "Added 'user42' to sudo group"
sleep 2
grep "user42" /etc/group
echo "'user42' is part of these groups"
sleep 5
sudo deluser user42
sudo delgroup evaluation

#Ufw status and allowed ports
sudo service ufw status
sudo ufw status
sleep 5
sudo ufw allow 8080
sudo ufw status
echo "Port 8080 has been added"
sleep 5
yes |sudo ufw delete 4
yes |sudo ufw delete 2
sudo ufw status
echo "Port 8080 has been removed"
sleep 10

#Ssh status
sudo service ssh status
sleep 5

#Sudo info
sudo grep "Defaults" /etc/sudoers
echo "Here you can see my sudoers file"
sleep 5
sudo cat /var/log/sudo/sudo.log
echo "Here you can see the sudo history being logged"
sleep 5

#Change hostname of VM
sudo hostnamectl set-hostname user42
echo "Set hostname to user42, changes will be set after rebooting"
sleep 5

#Open cron
sudo crontab -e
sleep 3

#Reboot
echo "Rebooting in 5"
sleep 1
echo "Rebooting in 4"
sleep 1
echo "Rebooting in 3"
sleep 1
echo "Rebooting in 2"
sleep 1
echo "Rebooting in 1"
sudo reboot
