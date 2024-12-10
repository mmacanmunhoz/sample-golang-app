FROM golang:1.21.0-bullseye as builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=1 go build -o main .

FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \ 
    ca-certificates \
    sqlite3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 8091

CMD ["./main"]


