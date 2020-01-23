FROM hyperized/scratch:latest as trigger
# Used to trigger Docker hubs auto build, which it wont do on the official images

FROM alpine as builder

WORKDIR /build
RUN apk -U add wget gnupg
RUN wget -O phive.phar https://phar.io/releases/phive.phar
RUN wget -O phive.phar.asc https://phar.io/releases/phive.phar.asc
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys 0x9D8A98B29B2D5D79
RUN gpg --verify phive.phar.asc phive.phar
RUN chmod +x phive.phar

FROM php:7.4-cli-alpine

LABEL maintainer="Gerben Geijteman <gerben@hyperized.net>"
LABEL description="A basic alpine phive image"

RUN apk -U add ncurses gnupg

COPY --from=builder /build/phive.phar /usr/local/bin/phive
