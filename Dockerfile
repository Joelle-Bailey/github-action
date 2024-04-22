FROM golang:1.15-alpine AS build
WORKDIR /src/
COPY go.mod .
RUN go mod download
COPY main.go .
ADD microservice ./microservice
RUN CGO_ENABLED=0 go build -o /bin/helloserver
FROM alpine
COPY --from=build /bin/helloserver /bin/helloserver

# Set permissions for the executable
RUN chmod +x /bin/helloserver

ENTRYPOINT ["/bin/helloserver"]
