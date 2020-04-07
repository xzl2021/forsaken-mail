FROM alpine:latest
MAINTAINER Hongcai Deng <admin@dhchouse.com>,xzl2021 <xzl2021#hotmail.com>

RUN  apk add --no-cache --virtual .build-deps git npm \
  && git clone https://github.com/xzl2021/forsaken-mail.git /forsaken-mail \
  && apk del .build-deps \
  && apk add --no-cache npm \
  && cd /forsaken-mail \
  && npm install
  
EXPOSE 25
EXPOSE 3000
CMD ["node /forsaken-mail/bin/www"]