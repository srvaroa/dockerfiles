# From https://github.com/froulet/docker-newsboat/
FROM alpine:latest
RUN sed -i -e 's/v[[:digit:]]\.[[:digit:]]/edge/g' /etc/apk/repositories
RUN apk update && \
	apk add newsboat && \
	apk add w3m && \
	rm -rf /var/cache/apk/*
ENTRYPOINT ["newsboat"]
