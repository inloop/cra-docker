FROM alpine

RUN apk add --no-cache alpine-sdk && \
    cd /tmp && curl -s -LO https://github.com/jpmens/jo/releases/download/v1.1/jo-1.1.tar.gz && \
    tar xzf jo-1.1.tar.gz && \
    cd jo-1.1 && \
    ./configure && \
    make check && \
    make install

FROM nginx:alpine

COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /usr/local/bin/start-app
COPY --from=0 /usr/local/bin/jo /usr/local/bin/jo

RUN chmod +x /usr/local/bin/start-app && \
    chmod +x /usr/local/bin/jo && \
    mkdir /app

WORKDIR /app

ENTRYPOINT [ "sh", "/usr/local/bin/start-app" ]