FROM golang:1.16

ENV GO111MODULE=off

ADD . /go/src/github.com/akshar/ethexporter
RUN cd /go/src/github.com/akshar/ethexporter && go get
RUN go install github.com/akshar/ethexporter

ENV GETH <geth-host>
ENV PORT 9015

RUN mkdir /app
WORKDIR /app
ADD addresses.txt /app

EXPOSE 9015

ENTRYPOINT /go/bin/ethexporter
