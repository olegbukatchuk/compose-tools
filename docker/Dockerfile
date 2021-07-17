FROM centos:7

LABEL maintainer="Oleg Bukatchuk oleg@bukatchuk.com"

ARG VERSION=${VERSION}
ARG CONTAINER=${CONTAINER}

ENV HOME=/usr/local/${CONTAINER}

RUN mkdir /usr/local/${CONTAINER}
RUN yum update -y \
    && yum install gcc curl -y \
    && yum clean all -y



EXPOSE 8080
