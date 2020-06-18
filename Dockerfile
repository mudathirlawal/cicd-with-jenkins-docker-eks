
FROM nginx:latest

WORKDIR /nginx

COPY . /nginx

EXPOSE 80/tcp
