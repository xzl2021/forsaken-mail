FROM alpine:latest
MAINTAINER Hongcai Deng <admin@dhchouse.com>,xzl2021 <xzl2021#hotmail.com>

RUN  apk add --no-cache --virtual .build-deps git npm \
  && git clone https://github.com/xzl2021/forsaken-mail.git /forsaken-mail \
  && cd /forsaken-mail \
  && npm install >/dev/null 2>&1 \
  && apk del .build-deps \
  && apk add --no-cache nodejs \
  && cp /forsaken-mail/forsaken-mail.sh /usr/local/bin/forsaken-mail \
  && chmod +x /usr/local/bin/forsaken-mail
  
EXPOSE 25
EXPOSE 3000
CMD ["forsaken-mail"]