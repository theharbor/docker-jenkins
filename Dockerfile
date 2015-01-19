FROM harbor/base
MAINTAINER Nick Groenen

ENV JENKINS_HOME /var/lib/jenkins
ENV JENKINS_WAR /usr/share/jenkins/jenkins.war
ENV JENKINS_PORT 8080

COPY jenkins-ci.org.key /jenkins-ci.org.key
COPY conf/supervisor/jenkins.conf /etc/supervisor/conf.d/jenkins.conf
COPY bin/build.sh /build.sh
RUN /build.sh && rm /build.sh

EXPOSE 8080
