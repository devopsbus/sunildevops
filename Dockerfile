FROM centos:latest
MAINTAINER rajak.ehs@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install java
RUN yum install -y httpd \
    zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page251/greatseo.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip greatseo.zip
RUN cp -rvf greatseo/* .
RUN rm -rf greatseo.zip greatseo 
CMD ["/usr/sbin/httpd",  "-D",  "FOREGROUND"]
EXPOSE 80
