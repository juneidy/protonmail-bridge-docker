FROM alpine:3.20.3 as builder

ARG VERSION

ADD https://github.com/ProtonMail/proton-bridge/archive/refs/tags/v${VERSION}.tar.gz /

RUN tar -xzf /v${VERSION}.tar.gz

WORKDIR /proton-bridge-${VERSION}

RUN apk --update upgrade \
	&& apk --no-cache --no-progress add \
		bash \
		go \
		libsecret-dev \
		make \
		pkgconfig \
	&& rm -rf /var/cache/apk/*

RUN go get github.com/ProtonMail/gluon@dev

RUN make build-nogui

FROM alpine:3.20.3

ARG VERSION

COPY --from=builder /proton-bridge-${VERSION}/bridge /usr/bin/bridge

RUN apk --update upgrade \
	&& apk --no-cache --no-progress add \
		dbus-x11 \
		gnupg \
		libsecret \
		pass \
		socat \
	&& rm -rf /var/cache/apk/*

RUN addgroup -g 1000 proton \
	&& adduser -u 1000 -D -G proton proton

USER proton

WORKDIR /home/proton

COPY init-keystore.sh /home/proton/init-keystore.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
