#!/bin/sh

set -e
set -x
alias aptinstall="apt-get install --no-install-recommends --yes"

apt-key add - < /jenkins-ci.org.key
rm /jenkins-ci.org.key

echo 'deb http://pkg.jenkins-ci.org/debian binary/' > /etc/apt/sources.list.d/jenkins-ci.list
apt-get update
aptinstall ca-certificates jenkins git bzr subversion mercurial
rm -rf /var/lib/apt/lists/*

echo '    StrictHostKeyChecking no' >> /etc/ssh/ssh_config
