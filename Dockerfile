# Build
FROM golang:1.17.6-alpine as builder

RUN apk add --no-cache git curl build-base
ENV APP_SRC /usr/src/ethexporter/
COPY . $APP_SRC
WORKDIR $APP_SRC

COPY addresses.txt /tmp/addresses.txt
RUN go mod tidy  && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o /tmp/ethexporter .


# RUN
FROM alpine:3.15
WORKDIR /app

COPY --from=builder /tmp/ethexporter /app/
COPY --from=builder /tmp/addresses.txt /app/addresses.txt

EXPOSE 9015

CMD [ "/app/ethexporter"]
