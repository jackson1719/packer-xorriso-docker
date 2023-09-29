FROM ubuntu:latest
LABEL org.opencontainers.image.source="https://github.com/jbowdre/packer-xorriso-docker"

ENV PACKER_VERSION=1.9.4
ENV PACKER_SHA256SUM=6cd5269c4245aa8c99e551d1b862460d63fe711c58bec618fade25f8492e80d9

RUN apt-get update \
  && apt-get install \
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
