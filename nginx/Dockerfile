FROM nginx
MAINTAINER Savvas Nicholas <iamyojimbo@gmail.com>
ADD /nginx.conf /etc/nginx/nginx.conf
ADD /fastcgi_params /etc/nginx/fastcgi_params
ADD /*.site.conf /etc/nginx/conf.d/
EXPOSE 80 443