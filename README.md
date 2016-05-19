# Install Python tool Dex

https://github.com/mongolab/dex

## Install dependencies
- Python (2.7.10)

## Installation
```
cd ~
git clone git@github.com:dentso/mongolab-dex.git
~/mongolab-dex/build/make_rpm.sh
rpm -Uvh ~/rpmbuild/RPMS/noarch/mongolab-dex-<version>.amzn1.noarch.rpm
```

## Building from source
```
cd ~
git clone git@github.com:dentso/mongolab-dex.git
~/mongolab-dex/build/install.sh
```


## Uninstall
```
sudo service mongolab-dex stop
oldrpm=`rpm -qa | egrep -i mongolab-dex`
[ -n "$oldrpm" ] && sudo rpm -e $oldrpm
```

