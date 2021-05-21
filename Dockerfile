FROM httpd:2.4.46
RUN apt update && apt install -y build-essential
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./cplusplus.cpp /usr/local/apache2/
RUN g++ -o cgi-bin/cplusplus.cgi cplusplus.cpp
