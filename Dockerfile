FROM jenkins/slave:alpine

ARG BUILD_DATE
ARG VCS_REF
ARG SCHEMA_VERSION

LABEL maintainer="Paul Sladek" \
  org.label-schema.name="Jenkins alpine jnlp slave" \
  org.label-schema.description="Jenkins alpine jnlp slave" \
  org.label-schema.usage="/README.md" \
  org.label-schema.url="github" \
  org.label-schema.vcs-url="github" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.schema-version=$SCHEMA_VERSION

USER root

RUN apk add --update unzip=6.0-r4 \
  wget=1.20.1-r0 \
  curl=7.64.0-r1 \
  git=2.20.1-r0 \
  jq=1.6-r0 \
  zip=3.0-r7 \
  rsync=3.1.3-r1 \
  make=4.2.1-r2 \
  ca-certificates=20190108-r0 \
  docker=18.09.1-r0

# JavaScript
RUN apk add nodejs=10.14.2-r0 \
  npm=10.14.2-r0 \
  yarn=1.12.3-r0

# PHP
RUN apk add php7=7.2.14-r0 \
  composer=1.8.0-r1

# Python
RUN apk add python=2.7.15-r3 \
  python-dev=2.7.15-r3 \
  py-pip=18.1-r0 \
  build-base=0.5-r1 \
  && pip install virtualenv \
  && pip install awscli

# Java
RUN apk add gradle=4.10.3-r0 \
  maven=3.6.0-r0 \
  junit=4.12-r0

# Database
Run apk add mysql=10.3.13-r0 \
  mysql-client=10.3.13-r0 \
  redis=4.0.12-r0 \
  mongodb=4.0.5-r0

RUN rm -rf /var/cache/apk/*

USER jenkins

COPY jenkins-slave /usr/local/bin/jenkins-slave

ENTRYPOINT ["jenkins-slave"]