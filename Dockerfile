FROM bitnami/minideb:jessie
MAINTAINER Ipman1971

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="openjdk8" \
      org.label-schema.description="Base image for Open JDK 8" \
      org.label-schema.vcs-url="https://github.com/ipman1971/docker-base-images/openjdk8" \
      org.label-schema.vendor="Ipman1971" \
      org.label-schema.version="1.0.0" \
      com.ipman1971.image-contents='{"contents": [{"name": "OpenJDK", "version": "1.8"}]}'

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openjdk-8-jdk-headless

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

CMD ["/bin/bash"]
