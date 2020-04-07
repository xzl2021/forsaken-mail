FROM node:current-slim
MAINTAINER Hongcai Deng <admin@dhchouse.com>,xzl2021 <xzl2021#hotmail.com>

RUN apt-get update \
  && apt-get -y install git \
  && git clone https://github.com/denghongcai/forsaken-mail.git /forsaken-mail \
  && apt-get purge git \
  && apt-get autoremove \
  && apt-get clean all \
  && cd /forsaken-mail \
  && npm install

EXPOSE 25
EXPOSE 3000
CMD ["npm start"]
