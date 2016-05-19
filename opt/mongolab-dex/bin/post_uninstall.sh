#!/bin/bash

stop_service() {
  /sbin/service rundeck-connie stop
  /sbin/chkconfig --del rundeck-connie
  return 0
}

remove_user() {
  /usr/bin/getent passwd connie && /usr/sbin/userdel -r connie
  /usr/bin/getent group connie && /usr/sbin/groupdel connie
  return 0
}

cleanup() {
  rm -rf /opt/rundeck-connie
  rm -rf /home/connie
  return 0
}

echo "Running post-uninstall script"
stop_service
remove_user
#cleanup
 
exit 0
