FROM ubuntu

MAINTAINER Martin GOYOT <martin.goyot@enalean.com>

RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y php-pear

RUN pear config-set auto_discover 1
RUN pear install pear.netpirates.net/Autoload

RUN npm install less -g
RUN npm install recess -g
RUN npm install bless -g

RUN ln -s /usr/bin/nodejs /usr/bin/node

ADD run.sh /run.sh
RUN chmod u+x /run.sh

ENTRYPOINT ["/run.sh"]
