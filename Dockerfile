FROM alpine

RUN apk add --update varnish curl bash

WORKDIR /app
COPY start.sh .

RUN chmod +x start.sh

EXPOSE 80

ENTRYPOINT ["/app/start.sh"]