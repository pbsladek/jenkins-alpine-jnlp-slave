Jenkins Agent Apline Docker Image with Tools
===

[![Docker Stars](https://img.shields.io/docker/stars/pwbsladek/jenkins-alpine-jnlp-slave.svg)](https://hub.docker.com/r/pwbsladek/jenkins-alpine-jnlp-slave)
[![Docker Pulls](https://img.shields.io/docker/pulls/pwbsladek/jenkins-alpine-jnlp-slave.svg)](https://hub.docker.com/r/pwbsladek/jenkins-alpine-jnlp-slave)
[![Docker Automated build](https://img.shields.io/docker/automated/pwbsladek/jenkins-alpine-jnlp-slave.svg)](https://hub.docker.com/r/pwbsladek/jenkins-alpine-jnlp-slave)

This is a base image for Docker, which includes OpenJDK 8 and the Jenkins agent executable (slave.jar).
This executable is an instance of the [Jenkins Remoting library](https://github.com/jenkinsci/remoting).

## Usage

This image may instead be used to launch an agent using the **Launch method** of **Launch agent via execution of command on the master**. Try for example

```sh
docker run -i --rm --name agent --init pwbsladek/jenkins-alpine-jnlp-slave java -jar /usr/share/jenkins/slave.jar
```

after setting **Remote root directory** to `/home/jenkins/agent`.

### Agent Work Directories

Starting from [Remoting 3.8](https://github.com/jenkinsci/remoting/blob/master/CHANGELOG.md#38) there is a support of Work directories, 
which provides logging by default and change the JAR Caching behavior.

Call example:

```sh
docker run -i --rm --name agent1 --init -v agent1-workdir:/home/jenkins/agent pwbsladek/jenkins-alpine-jnlp-slave java -jar /usr/share/jenkins/slave.jar -workDir /home/jenkins/agent
```
