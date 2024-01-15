FROM golang:alpine AS builder
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /build
COPY ./main.go .

RUN go build -o serverHTTP ./main.go

WORKDIR /dist
RUN cp /build/serverHTTP .


FROM scratch
COPY --from=builder /dist/serverHTTP /
EXPOSE 8080
ENTRYPOINT ["/serverHTTP"]