FROM library/centos:latest
MAINTAINER Justin Garrison <justinleegarrison@gmail.com>

RUN yum -y update && \
  yum install -y openssl openssl-devel nss-devel \
  gmp-devel krb5-devel git @development

WORKDIR /root

RUN git clone https://github.com/magnumripper/JohnTheRipper.git

WORKDIR JohnTheRipper/src

RUN ./configure && make clean && make -s

WORKDIR /root/JohnTheRipper/run

ENTRYPOINT ["./john"]
