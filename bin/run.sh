#!/bin/bash

usage() {
	echo "Usage:" 2>&1
	echo "" 2>&1
	echo "shell              -- Start an interactive shell" 2>&1
	echo "jenkins            -- Start jenkins" 2>&1
}

case $1 in
	"shell")
		exec /bin/bash
		;;
	"jenkins")
		exec runas jenkins java -jar $JENKINS_WAR --webroot=/var/cache/jenkins/war --httpPort=$JENKINS_PORT -Djava.awt.headless=true
		;;
	*)
		usage
		exit 1
		;;
esac
