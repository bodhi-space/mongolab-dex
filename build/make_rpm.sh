#!/bin/bash

[ `whoami` = "root" ] && exit 1
rpmspec=~/rundeck-connie/rundeck-connie.spec
version=`egrep -i 'version:' $rpmspec | cut -d: -f2 | sed -e "s/ //g"`
progname=rundeck-connie
branch=infra111
gituser=dentso
gitrepo="git@github.com:dentso/${progname}.git"

cd; rm -rf ~/rpmbuild
#git clone $gitrepo
mkdir -p ~/rpmbuild/{BUILDROOT,BUILD,SOURCES,SRPMS,RPMS,SPECS}

cd ~/rpmbuild/SOURCES
curl -L https://api.github.com/repos/dentso/${progname}/tarball > ${progname}-${version}.tar.gz
cat ${progname}-${version}.tar.gz | gzip -d | tar xvf -
cp dentso*${progname}*/*.spec ~/rpmbuild/SPECS
rpmbuild -bb -v ~/rpmbuild/SPECS/${progname}*.spec

exit 0
