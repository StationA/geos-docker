FROM alpine:3.7 as build

# Update and install deps

RUN apk update

RUN apk add --no-cache \
    ca-certificates \
    wget \
    build-base \
    autoconf \
    automake \
    libtool \
    bash

WORKDIR /tmp

ADD install_geos.sh install_geos.sh

RUN ./install_geos.sh

FROM alpine:3.7

COPY --from=build /usr/local/lib /usr/local/lib
COPY --from=build /usr/local/include /usr/local/include
