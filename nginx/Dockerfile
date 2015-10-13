FROM nginx
MAINTAINER Savvas Nicholas <iamyojimbo@gmail.com>
ADD /nginx.conf /etc/nginx/nginx.conf
ADD /fastcgi_params /etc/nginx/fastcgi_params
ADD /mime.types /etc/nginx/mime.types
ADD /h5bp /etc/nginx/h5bp

RUN mkdir /etc/nginx/logs
RUN touch /etc/nginx/logs/static.log

RUN mkdir /tmp/nginx

RUN rm -f /etc/nginx/conf.d/*
ADD /*.site.conf /etc/nginx/conf.d/
EXPOSE 80 443