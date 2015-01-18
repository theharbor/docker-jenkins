#!/bin/sh

set -e
set -x
export DEBIAN_FRONTEND=noninteractive
alias aptinstall="apt-get install --no-install-recommends --yes"

apt-key add - < /jenkins-ci.org.key
rm /jenkins-ci.org.key

echo 'deb http://pkg.jenkins-ci.org/debian binary/' > /etc/apt/sources.list.d/jenkins-ci.list
apt-get update

aptinstall jenkins
rm -rf /var/lib/apt/lists/*
