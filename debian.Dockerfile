FROM golang:1.20.1-bullseye as builder

ARG VERSION

ADD https://github.com/ProtonMail/proton-bridge/archive/refs/tags/v${VERSION}.tar.gz /

RUN tar -xzf /v${VERSION}.tar.gz -C /

WORKDIR /proton-bridge-${VERSION}

RUN apt-get update; \
	apt-get install -y --no-install-recommends \
	libsecret-1-dev \
	; \
	rm -rf /var/lib/apt/lists/*

RUN make build-nogui

FROM debian:11.6

ARG VERSION

COPY --from=builder /proton-bridge-${VERSION}/bridge /usr/bin/bridge
COPY --from=builder /proton-bridge-${VERSION}/proton-bridge /usr/bin/protonmail-bridge

RUN apt-get update; \
	apt-get install -y --no-install-recommends \
	libsecret-1-0 \
	gnupg \
	pass \
	socat \
	; \
	rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 1000 proton \
  && useradd --uid 1000 --gid proton --shell /bin/bash --create-home proton

USER proton

WORKDIR /home/proton

COPY init-keystore.sh /home/proton/init-keystore.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
