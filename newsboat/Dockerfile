# From https://github.com/froulet/docker-newsboat/
FROM alpine:3.10
RUN apk update && \
	apk add newsboat && \
	apk add w3m && \
	rm -rf /var/cache/apk/*
ENTRYPOINT ["newsboat"]
