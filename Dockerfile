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

WORKDIR /tmp/
RUN wget https://s3.amazonaws.com/hc-public/nomad/0.1.0dev/nomad_linux_amd64 -O nomad --no-check-certificate
RUN echo 'Installing Nomad...'
#unzip nomad.zip
RUN chmod +x nomad
RUN mv nomad /usr/bin/nomad
RUN mkdir /etc/nomad.d
RUN chmod a+w /etc/nomad.d

RUN wget https://github.com/nateleavitt/nomad-docker/raw/master/server1.hcl --no-check-certificate
RUN mkdir server1

#For server service discovery
EXPOSE 4647

CMD ["nomad", "agent", "-config", "server1.hcl"]
