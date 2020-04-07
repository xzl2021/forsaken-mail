FROM alpine:latest
MAINTAINER Hongcai Deng <admin@dhchouse.com>,xzl2021 <xzl2021#hotmail.com>

RUN  apk add --no-cache --virtual .build-deps git npm \
  && git clone https://github.com/denghongcai/forsaken-mail.git /forsaken-mail \
  && cd /forsaken-mail \
  && npm install \
  && apk del .build-deps \
  && apk add --no-cache nodejs

EXPOSE 25
EXPOSE 3000
CMD ["node /forsaken-mail/bin/www"]