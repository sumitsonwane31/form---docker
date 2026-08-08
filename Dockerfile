FROM alpine:3.20 AS builder

WORKDIR /app
COPY index.html .

FROM nginx:alpine

COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

EXPOSE 80