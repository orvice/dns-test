FROM golang as builder

RUN mkdir /app

COPY . .

RUN go build -o /app/dns-test main.go

FROM debian:buster-slim

COPY --from=builder /app/dns-test /app/dns-test