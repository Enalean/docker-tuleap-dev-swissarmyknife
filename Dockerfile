FROM ubuntu:14.04

MAINTAINER Manuel VACELET <manuel.vacelet@enalean.com>

RUN apt-get update -y && \
    apt-get install -y curl php5-cli nodejs npm jing trang git libfontconfig && \
    npm install -g less recess bless grunt-cli bower && \
    ln -s /usr/bin/nodejs /usr/bin/node

RUN curl -o /usr/local/bin/phpab -fsSL "http://phpab.net/phpab-1.16.1.phar" && \
    chmod +x /usr/local/bin/phpab

RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 && \
    curl -o /usr/local/bin/gosu -fsSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)" && \
    curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture).asc" && \
    gpg --verify /usr/local/bin/gosu.asc && \
    rm /usr/local/bin/gosu.asc && \
    chmod +x /usr/local/bin/gosu

COPY run.sh /run.sh
COPY run-as-owner.sh /run-as-owner.sh
RUN chmod a+x /run.sh /run-as-owner.sh

ENTRYPOINT ["/run.sh"]
