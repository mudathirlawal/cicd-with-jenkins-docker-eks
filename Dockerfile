
FROM nginx:latest

WORKDIR /nginx

COPY . /nginx

RUN usermod -a -G docker jenkins

USER jenkins

EXPOSE 80/tcp
