FROM docker.mirror.hashicorp.services/alpine:latest
LABEL org.opencontainers.image.source="https://github.com/jbowdre/packer-xorriso-docker"

ENV PACKER_VERSION=1.8.5
ENV PACKER_SHA256SUM=1f17a724e5ccc696010c842e6d2bb2c2749ab18ce7bf06482012d3ddb9edeef2

RUN apk --no-cache upgrade \
  && apk add --no-cache \
  bash \
  curl \
  git \
  openssl \
  wget \
  xorriso

ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_SHA256SUMS ./

RUN sed -i '/.*linux_amd64.zip/!d' packer_${PACKER_VERSION}_SHA256SUMS
RUN sha256sum -cs packer_${PACKER_VERSION}_SHA256SUMS
RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin
RUN rm -f packer_${PACKER_VERSION}_linux_amd64.zip

ENTRYPOINT ["/bin/packer"]
