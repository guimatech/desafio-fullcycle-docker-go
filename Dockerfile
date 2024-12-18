FROM golang:1.21.4-alpine3.18 AS builder
WORKDIR /app
COPY hello.go hello.go
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-w" -o /app/hello hello.go

FROM scratch
COPY --from=builder /app/hello /hello
CMD ["/hello"]

