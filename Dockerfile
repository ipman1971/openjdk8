FROM bitnami/minideb:jessie
MAINTAINER Ipman1971

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="openjdk8" \
      org.label-schema.description="Base image for Open JDK 8" \
      org.label-schema.vcs-url="https://github.com/ipman1971/docker-base-images/openjdk8" \
      org.label-schema.vendor="Ipman1971" \
      org.label-schema.version="1.0.0" \
      com.ipman1971.image-contents='{"contents": [{"name": "OpenJDK 8", "version": "8u111"}]}'

RUN apt-get update && apt-get install -y --no-install-recommends \
      		  bzip2 \
      		  unzip \
      		  xz-utils \
      	    && rm -rf /var/lib/apt/lists/*

RUN echo 'deb http://deb.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list

ENV LANG C.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre
ENV JAVA_VERSION 8u111
ENV JAVA_DEBIAN_VERSION 8u121-b13-1~bpo8+1
ENV CA_CERTIFICATES_JAVA_VERSION 20161107~bpo8+1

RUN set -x &&\
    apt-get update &&\
    apt-get install -y openjdk-8-jre-headless="$JAVA_DEBIAN_VERSION" \
      		  ca-certificates-java="$CA_CERTIFICATES_JAVA_VERSION" &&\
      	    rm -rf /var/lib/apt/lists/*

RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

CMD ["/bin/bash"]
