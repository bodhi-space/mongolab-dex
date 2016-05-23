# Description
This creates an RPM which packages the mongo-lab/dex opensource utility. It also create a symbolic link (/opt/mongolab-dex/bin).  The dex original repo is https://github.com/mongolab/dex.

## Install dependencies
- Python (2.7.10)

## Installation
```
cd ~; git clone https://github.com/bodhi-space/mongolab-dex
~/mongolab-dex/build/make_rpm.sh
sudo rpm -Uvh ~/rpmbuild/RPMS/noarch/mongolab-dex-<version>.amzn1.noarch.rpm
```


## Uninstall
```
sudo rpm -e mongolab-dex-<version>.amzn1.noarch.rpm
```

