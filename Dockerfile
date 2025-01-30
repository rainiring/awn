FROM scratch

COPY dist/awn_linux_amd64_v1/awn /app/awn

ENTRYPOINT ["/app/awn"]

LABEL org.opencontainers.image.source=https://github.com/rainiring/awn
LABEL org.opencontainers.image.description="AWN"
LABEL org.opencontainers.image.licenses=Apache
