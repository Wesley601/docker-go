FROM golang:1.21.4-bookworm AS builder

WORKDIR /app

COPY . .

RUN go build -ldflags="-s -w" main.go

FROM scratch

COPY --from=builder /app/main /app/main

ENTRYPOINT ["/app/main"]
