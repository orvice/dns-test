FROM golang as builder

RUN mkdir /app

COPY . .

RUN go build -o /app/dns-test main.go

FROM debian:buster-slim
#FROM debian:buster

COPY --from=builder /app/dns-test /app/dns-test

COPY resolv.conf /etc/resolv.conf