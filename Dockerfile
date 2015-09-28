FROM ubuntu:14.04
MAINTAINER 'github.com/nateleavitt'

RUN echo 'updating apt-get and installing unzip, curl, wget'
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    unzip \
    curl \
    wget

# Download Nomad
RUN echo 'Fetching Nomad...'

RUN cd /tmp/
RUN wget https://s3.amazonaws.com/hc-public/nomad/0.1.0dev/nomad_linux_amd64 -O nomad --no-check-certificate
RUN echo 'Installing Nomad...'
#unzip nomad.zip
RUN chmod +x nomad
RUN mv nomad /usr/bin/nomad
RUN mkdir /etc/nomad.d
RUN chmod a+w /etc/nomad.d
