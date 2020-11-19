FROM ubuntu

MAINTAINER "Alexander Paucar Wong" "apwong2@yahoo.com"

#Prep
#RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list
RUN apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y nano wget net-tools apt-utils
RUN apt-get -y install nginx
#Copy nginx configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /var/www/backend.pe
COPY proxy.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/www/backend.pe/index.html
COPY alexander.conf /etc/nginx/sites-available/alexander.conf
RUN ln -s /etc/nginx/sites-available/alexander.conf /etc/nginx/sites-enabled/alexander.conf
CMD service nginx start
EXPOSE 3200
