#!/bin/bash

archive_dir=/opt/mongolab-dex
[ ! -d ${archive_dir} ] && exit 1
package=`cd ${archive_dir};ls -1d dex-*.tgz | head -1 | sed -e "s/\.tgz//g"`
archive=${archive_dir}/${package}.tgz
pip=/usr/bin/pip

setup_archive() {
  [ ! -d /var/tmp ] && exit 1
  [ ! -f $archive ] && exit 1
  $pip show dex --disable-pip-version-check 
  [ $? = 0 ] && exit 1
  cat $archive | gzip -d | (cd /var/tmp; tar xvf -)
  return 0
}

install_dex() {
  [ ! -d /var/tmp/${package} ] && exit 1
  cd /var/tmp/${package}
  $pip install dex --disable-pip-version-check --target=${archive_dir}/bin
  [ $? != 0 ] && exit 1
  rm -rf /var/tmp/${package}
  return 0
}

echo "Running pre-install script"
setup_archive
install_dex

exit 0

