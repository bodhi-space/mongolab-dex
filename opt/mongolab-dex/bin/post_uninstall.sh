#!/bin/bash

archive_dir=/opt/mongolab-dex
[ ! -d ${archive_dir} ] && exit 1
pip=/usr/bin/pip
yes=/usr/bin/yes

remove_dex() {
  $pip show dex
  [ $? != 0 ] && exit 1
  $yes | $pip uninstall dex --disable-pip-version-check --target={archive_dir}/bin
  [ $? != 0 ] && exit 1
  return 0
}

echo "Running pre-install script"
remove_dex

exit 0
