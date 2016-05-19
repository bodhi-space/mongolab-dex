%define _pkgroot /opt/mongolab-dex

Name:           mongolab-dex
Version:        1.0.0
Release:        1%{?dist}
Group:          System
License:        GPLv2
URL:            ihttps://github.com/mongolab/dex
Source0:        %{name}-%{version}.tar.gz
BuildArch:      noarch
Requires:       /usr/bin/easy_install
Summary:        Installs dex utility for MongoDB


%description
%{summary}

%prep

%build

%install
mkdir -p %{buildroot}
tar -C %{buildroot} --strip-components=1 -xvf %{S:0}
pushd %{buildroot}
rm -rf .git %{name}.spec LICENSE .gitignore *.md build
popd

%post
/opt/mongolab-dex/bin/post_install.sh

%preun
/opt/mongolab-dex/bin/post_uninstall.sh

%files
%attr(644, root, root) 
%{_pkgroot}/opt/mongolab-dex/*.tgz
%attr(755, root, root) 
%{_pkgroot}/opt/mongolab-dex/bin/*.sh

%changelog
* Thu May 19 2016 - Esaie Vermilus <esaie.vermilus@hotschedules.com> - 1.0.0-1
- Initial RPM release.

