FROM httpd:2.4.46
RUN apt update && apt install -y build-essential
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./src/ /usr/local/apache2/src/
RUN g++ -o cgi-bin/cplusplus.cgi src/cplusplus.cpp
