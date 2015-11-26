FROM ubuntu:14.04

MAINTAINER Manuel VACELET <manuel.vacelet@enalean.com>

RUN apt-get update -y && \
    apt-get install -y nodejs npm php-pear jing trang git libfontconfig && \
    pear config-set auto_discover 1 && \
    pear install pear.netpirates.net/Autoload && \
    npm install -g less recess bless grunt-cli bower && \
    ln -s /usr/bin/nodejs /usr/bin/node

COPY run.sh /run.sh
COPY run-as-owner.sh /run-as-owner.sh
RUN chmod a+x /run.sh /run-as-owner.sh

ENTRYPOINT ["/run.sh"]
# bower install --config.interactive=false
