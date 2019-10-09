#!/bin/bash
set -ex

if [ -f /etc/os-release ];
then
  source /etc/os-release
else
  exit 0
fi

if [ "$ID" == "rhel" ] || [ "$ID" == "centos" ];
then
   sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-${VERSION:0:1}.noarch.rpm
fi
