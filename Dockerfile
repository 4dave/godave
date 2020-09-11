## build binary
FROM golang:alpine AS builder
## install git for fetching dependencies
RUN apk update && apk add --no-cache git
## set working directory
WORKDIR /tmp/workdir
## copy code in
COPY . .
## Fetch dependencies using go get
RUN go get -d -v
## disable CGO for alpine; Build the binary
RUN CGO_ENABLED=0 go build -a -o /go/bin/main .
## build image from scratch, copy binary, expose port, run binary
FROM scratch
COPY --from=builder /go/bin/main /go/bin/main
EXPOSE 3000
ENTRYPOINT ["/go/bin/main"]
