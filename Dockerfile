
FROM nginx:latest

COPY index.html /usr/nginx/html

RUN usermod -a -G docker jenkins

USER jenkins

EXPOSE 80/tcp
