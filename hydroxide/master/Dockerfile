FROM golang:1.18.5-alpine3.16 as builder

RUN apk --update upgrade \
	&& apk --no-cache --no-progress add make gcc musl-dev \
	&& rm -rf /var/cache/apk/*

ADD master.zip /

RUN unzip /master.zip -d /

WORKDIR /hydroxide-master

RUN GO111MODULE=on go build ./cmd/hydroxide

FROM alpine:3.16.1 as base

RUN apk --update upgrade \
	&& apk --no-cache --no-progress add ca-certificates \
	&& rm -rf /var/cache/apk/*

EXPOSE 1025

COPY --from=builder /hydroxide-master/hydroxide /usr/bin/hydroxide

ENTRYPOINT ["/usr/bin/hydroxide"]
