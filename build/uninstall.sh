#!/bin/bash

[ `whoami` = "root" ] && exit 1
cd ~
sudo rpm -e rundeck-connie-1.0.2-1.amzn1.noarch
sudo rm -rf /opt/rundeck-connie
sudo rm -rf /usr/local/lib/python2.7/site-packages/CherryPy-5.4.0-py2.7.egg
sudo rm -rf /var/run/rundeck-connie
sudo rm -rf /tmp/Cherry*
sudo userdel -r connie
sudo rm -rf /home/connie
exit 0
