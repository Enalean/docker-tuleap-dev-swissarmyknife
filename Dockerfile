FROM ubuntu

MAINTAINER Martin GOYOT <martin.goyot@enalean.com>

RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm

RUN npm install less -g
RUN npm install recess -g

RUN ln -s /usr/bin/nodejs /usr/bin/node

ADD run.sh /run.sh
RUN chmod u+x /run.sh

ENTRYPOINT /bin/bash /run.sh