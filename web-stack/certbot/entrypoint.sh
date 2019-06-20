#!/bin/bash

cloudflare_creds_path="./cloudflare-creds.ini"
printf "" > $cloudflare_creds_path

echo "dns_cloudflare_email = $CLOUDFLARE_EMAIL" >> cloudflare_creds_path
echo "dns_cloudflare_api_key = $CLOUDFLARE_API_KEY" >> cloudflare_creds_path

IFS=',' read -r -a domains <<< "$CERTBOT_DOMAINS"
for d in "${domains[@]}"; do
    domain_args+=(-d "$d");
done

certbot certonly --non-interactive --agree-tos --email "$CERTBOT_EMAIL" --dns-cloudflare --dns-cloudflare-credentials cloudflare_creds_path "${domain_args[@]}"