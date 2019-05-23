FROM ubuntu:bionic

RUN apt-get -qq update && \
    apt-get -y install pbuilder aptitude 

RUN  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4052245BD4284CDD && \
     echo "deb https://repo.iovisor.org/apt/bionic bionic main" | \
     tee /etc/apt/sources.list.d/iovisor.list

RUN apt-get update && \
    apt-get install -y bcc-tools libbcc-examples git golang

RUN mkdir /root/ebpf-exporter && cd /root/ebpf-exporter && \
    GOPATH=$(pwd) go get -v github.com/cloudflare/ebpf_exporter/... && \
    cp /root/ebpf-exporter/bin/ebpf_exporter /usr/local/bin

WORKDIR /root

COPY ./entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
