#!/bin/bash

[ `whoami` = "root" ] && exit 1
package=/home/evermilus/rpmbuild/RPMS/noarch/mongolab-dex-1.0.0-1.amzn1.noarch.rpm
rm $package
./make_rpm.sh
sudo rpm -Uvh $package

exit 0
