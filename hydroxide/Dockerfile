FROM golang:1.18.3-alpine3.16 as builder

ARG ver

RUN apk --update upgrade \
	&& apk --no-cache --no-progress add make gcc musl-dev \
	&& rm -rf /var/cache/apk/*

ADD v${ver}.tar.gz /

WORKDIR /hydroxide-${ver}

RUN GO111MODULE=on go build ./cmd/hydroxide

FROM alpine:3.16.0 as base

ARG ver

RUN apk --update upgrade \
	&& apk --no-cache --no-progress add ca-certificates \
	&& rm -rf /var/cache/apk/*

EXPOSE 1025

COPY --from=builder /hydroxide-${ver}/hydroxide /usr/bin/hydroxide

ENTRYPOINT ["/usr/bin/hydroxide"]
