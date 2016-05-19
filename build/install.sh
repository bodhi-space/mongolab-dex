#!/bin/bash

[ `whoami` = "root" ] && exit 1
package=/home/evermilus/rpmbuild/RPMS/noarch/rundeck-connie-1.0.2-1.amzn1.noarch.rpm
rm $package
./make_rpm.sh
sudo rpm -Uvh $package

exit 0
