FROM debian:buster

#install nginx and openssl
RUN apt-get -y update && apt-get -y install nginx
RUN apt-get -y install openssl

#creating the ssl folder and the self-signed key in it
RUN mkdir /etc/nginx/ssl
RUN openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509  -subj "/CN=hdurand.42.fr" -keyout /etc/nginx/ssl/ssl.key -out /etc/nginx/ssl/ssl.crt
RUN openssl dhparam -dsaparam -out /etc/nginx/ssl/dhparam4096.pem 4096

#replacing default nginx conf by mine
RUN rm /etc/nginx/nginx.conf
COPY tools/nginx.conf /etc/nginx/nginx.conf

#replacing default nginx site by mine
RUN rm /etc/nginx/sites-enabled/default
COPY tools/base.conf /etc/nginx/sites-available/base.conf
COPY tools/base.conf /etc/nginx/sites-enabled/base.conf

EXPOSE 443