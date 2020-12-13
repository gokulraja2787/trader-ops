FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

#install java
RUN  apt-get update; \
    apt-get upgrade -y; \
    apt-get install openjdk-11-jdk git xz-utils -y

#Setup maven
#RUN wget -o /tmp/apache-maven-3.6.3-bin.tar.gz http://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
ADD http://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz /tmp/apache-maven-3.6.3-bin.tar.gz
RUN tar -zxf /tmp/apache-maven-3.6.3-bin.tar.gz -C /opt/; \
    mv /opt/apache-maven-3.6.3 /opt/maven; \
    rm /tmp/apache-maven-3.6.3-bin.tar.gz

#Setup nodejs
ADD https://nodejs.org/dist/v14.15.1/node-v14.15.1-linux-x64.tar.xz /tmp/node-v14.15.1-linux-x64.tar.xz
RUN tar -xf /tmp/node-v14.15.1-linux-x64.tar.xz -C /opt/; \
    mv /opt/node-v14.15.1-linux-x64 /opt/nodejs; \
    rm /tmp/node-v14.15.1-linux-x64.tar.xz

#Setup env environment
ENV JAVA_HOME=/usr
ENV MVN_HOME=/opt/maven
ENV PATH=$PATH:$JAVA_HOME/bin:$MVN_HOME/bin
ENV PATH=$PATH:/opt/nodejs/bin

#Setup jenkins
ADD http://mirrors.jenkins.io/war-stable/latest/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV jenkins_home=/jenkins

#Remove xz-utils which is not required
RUN apt-get remove xz-utils -y;

#Entrypoint and expose
ENTRYPOINT [ "java", "-jar", "/opt/jenkins.war" ]
EXPOSE 8080

CMD [""]