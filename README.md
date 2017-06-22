# Documentation on how to bootstrap my work environment

Switched from an Ubuntu Desktop to Windows Desktop & Centos7 Guest in VMWare

- mount sources on Windows 10 Pro via NFS
- use vscode & visual studio + xamarin on Windows
- leverage linux tool chains

## 1) Checkout repo

```bash

mkdir -p code/github
cd code/github
sudo dhclient -v 
sudo yum -y install git-core 
git clone https://github.com/tobig77/centos7-setup.git 

``` 

## 2) Bootstrap base config to run ansible playbook

```bash

cd centos7-setup
sudo bash -xe ./bootstrap.sh

```
## 3) Run ansible playbook

```bash
sudo echo test && ansible-playbook setup.yml
```

## 4) NFS Client on Windows Host

* Requires at least Windows 10 Pro
* Enable NFS Client for Windows as per http://blog.cuongnv.com/2009/11/windows-7-client-for-nfs-and-user-name.html
* Adjust AnonUID and AnonGID via Regedit as per article
