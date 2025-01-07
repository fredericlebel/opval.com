# Stage 1
FROM alpine:latest AS build

RUN apk add --update hugo

WORKDIR /usr/app

COPY . .

RUN hugo

# Stage 2
FROM nginx:1-alpine

WORKDIR /usr/share/nginx/html

COPY --from=build /usr/app/public .

EXPOSE 80
