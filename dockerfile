# Multi-stage build for smaller image
FROM golang:1.20-alpine AS builder

WORKDIR /app
COPY . .

# Build the application
RUN go build -o wisecow main.go

# Final stage
FROM alpine:latest

RUN apk --no-cache add ca-certificates openssl

WORKDIR /root/

# Copy the binary from builder
COPY --from=builder /app/wisecow .
COPY --from=builder /app/static ./static

# Create SSL certificates directory
RUN mkdir -p /etc/ssl/wisecow

EXPOSE 8080

CMD ["./wisecow"]
