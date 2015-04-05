#!/bin/sh

set -e
set -x

apt-key add - < /jenkins-ci.org.key
rm /jenkins-ci.org.key

echo 'deb http://pkg.jenkins-ci.org/debian binary/' > /etc/apt/sources.list.d/jenkins-ci.list
apt-get update
apt-get install --no-install-recommends -y openssh-client ca-certificates jenkins
apt-get install --no-install-recommends -y git bzr subversion mercurial curl
rm -rf /var/lib/apt/lists/*

echo '    StrictHostKeyChecking no' >> /etc/ssh/ssh_config
