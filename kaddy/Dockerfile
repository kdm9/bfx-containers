FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/lindenlab/caddy-s3-proxy@850db193cb7f48546439d236f2a6de7bd7436e2e \
    --with github.com/caddyserver/cache-handler
    #--with github.com/caddyserver/transform-encoder \

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN chmod +x /usr/bin/caddy
