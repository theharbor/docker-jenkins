# Jenkins won't start with java8 right now. :/
#FROM zoni/ubuntu:java8-runtime
FROM zoni/ubuntu:latest
MAINTAINER Nick Groenen

ENV JENKINS_HOME /var/lib/jenkins
ENV JENKINS_WAR /usr/share/jenkins/jenkins.war
ENV JENKINS_PORT 8080

COPY jenkins-ci.org.key /jenkins-ci.org.key
COPY bin/build.sh /build.sh
RUN /build.sh && rm /build.sh

ADD bin/run.sh /
ENTRYPOINT ["/run.sh", "jenkins"]

EXPOSE 8080
