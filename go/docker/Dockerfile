
FROM golang:1.17 as go

ENV CGO_ENABLED=0
ADD ./serve.go /app/serve.go
WORKDIR /app
RUN go build serve.go

FROM alpine:3.14

COPY --from=go /app/serve /app/serve
CMD ["/app/serve"]
