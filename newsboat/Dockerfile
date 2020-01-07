# From https://github.com/froulet/docker-newsboat/
FROM alpine:3.10

RUN sed -i -e 's/v[[:digit:]]\.[[:digit:]]/edge/g' /etc/apk/repositories

RUN apk update && \
	apk add newsboat && \
	apk add w3m && \
	rm -rf /var/cache/apk/*

ADD send-to-pocket.sh /usr/bin/send-to-pocket.sh

ENTRYPOINT ["newsboat"]
