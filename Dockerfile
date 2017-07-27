FROM fedora:latest

RUN groupadd -r ca && useradd -r -g ca ca
RUN mkdir -p /ca/out
RUN yum install openssl -y

WORKDIR /ca
RUN echo 01 > serial

COPY openssl.cnf .
ENV OPENSSL_CONF openssl.cnf

COPY createcert.sh .
RUN chmod 755 ./createcert.sh

RUN openssl genrsa -out ca.key 2048
RUN openssl req -new -subj '/CN=Test CA/C=US' -x509 -days 365 -key ca.key -out ca.crt

RUN echo 'extendedKeyUsage = clientAuth,serverAuth' > extfile.cnf

