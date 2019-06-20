FROM certbot/dns-cloudflare

WORKDIR /app

RUN apk add bash

COPY entrypoint.sh .

ENTRYPOINT [ "bash", "./entrypoint.sh" ]