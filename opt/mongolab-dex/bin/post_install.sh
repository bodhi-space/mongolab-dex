#!/bin/bash

archive_dir=/opt/rundeck-connie/python
if [ ! -d ${archive_dir} ]; then
  echo "ERROR: rundeck-connie folder is missing."
  exit 1
fi
package=`cd ${archive_dir};ls -1d CherryPy-*.tar.gz | sed -e "s/\.tar\.gz//g"`
archive=${archive_dir}/${package}.tar.gz
python=/usr/bin/python
echo "ARCHIVE: $archive"


setup_archive() {
  if [ ! -x $python ]; then
    echo "ERROR: file not gounf: $python"
    exit 1
  fi
  if [ ! -d /tmp ]; then
    echo "ERROR: missing directory /tmp"
    exit 1
  fi
  if [ ! -f $archive ]; then
    echo "ERROR: archive not found: $archive"
    exit 1
  fi
  cat $archive | gzip -d | (cd /tmp; tar xvf -)
  return 0
}

add_user() {
  /usr/bin/getent group connie >/dev/null 2>&1
  if [ $? != 0 ]; then
    /usr/sbin/groupadd -r connie
  fi
  /usr/bin/getent passwd connie >/dev/null 2>&1
  if [ $? != 0 ]; then 
    /usr/sbin/useradd -r -d /home/connie -g connie -s /bin/bash connie
  fi
  chown -R connie:connie /opt/rundeck-connie/var/{run,log}
  return 0
}

add_service() {
  chown connie:connie /opt/rundeck-connie/var/*/*
  chmod 644 /opt/rundeck-connie/var/*/*
  /sbin/chkconfig --add rundeck-connie
  /sbin/service rundeck-connie start > /dev/null 2>&1
  service rundeck-connie start
  service rundeck-connie status
  return 0
}

install_cherrypy() {
  install_log=/opt/rundeck-connie/var/log/cherrypy-install.log
  su - connie -c "/opt/rundeck-connie/python/install.sh | /usr/bin/tee ${install_log}"
  return 0
}

echo "Running pre-install script"
setup_archive
add_user
install_cherrypy
add_service

exit 0

