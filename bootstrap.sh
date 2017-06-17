#!/bin/bash

abort_on_error() {
    echo -e "$@" 1>&2
    exit 1
}

[ "$whoami" != "root" ] || abort_on_error "You have to be root"

yum -y install \
    epel-release nano git-core
    
