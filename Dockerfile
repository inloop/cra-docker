FROM nginx:alpine

RUN mkdir /app
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app
