FROM caddy:2-builder-alpine AS build

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/lindenlab/caddy-s3-proxy \
    --with github.com/lolPants/caddy-requestid \
    --with github.com/pteich/caddy-tlsconsul \
    --with github.com/silinternational/certmagic-storage-dynamodb/v2

FROM alpine

COPY --from=build /usr/bin/caddy /usr/bin/caddy
RUN chmod +x /usr/bin/caddy

EXPOSE 80 443 2019

WORKDIR /data
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]