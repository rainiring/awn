FROM golang:1.23 AS build

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod tidy

# copy source and build
# disable cgo can reduce the size of binary file
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build .


# make a bare minimal image
FROM scratch

# source to be scanned should be mounted to /src
WORKDIR /src
COPY --from=build /app/awn /app/awn

ENTRYPOINT ["/app/awn"]

LABEL org.opencontainers.image.source=https://github.com/rainiring/awn
LABEL org.opencontainers.image.description="AWN"
LABEL org.opencontainers.image.licenses=Apache
