FROM httpd:2.4.46

# Install the tools we need
RUN apt update \
 && apt install -y build-essential wget autoconf \
 && rm -rf /var/lib/apt/lists/* \
 && wget ftp://ftp.gnu.org/gnu/cgicc/cgicc-3.2.19.tar.gz \
 && tar xzf cgicc-3.2.19.tar.gz

# Build Cgicc
WORKDIR /usr/local/apache2/cgicc-3.2.19
RUN ./configure --prefix=/usr && make && make install
WORKDIR /usr/local/apache2

# Copy in the files we need
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./index.html /usr/local/apache2/htdocs/
COPY ./src/ /usr/local/apache2/src/

# Compile the CGI programs
RUN g++ -o cgi-bin/cplusplus.cgi src/cplusplus.cpp \
 && g++ -o cgi-bin/envvar.cgi src/envvar.cpp \
 && g++ -o cgi-bin/cpp_get.cgi src/cpp_get.cpp -lcgicc \
 && g++ -o cgi-bin/cpp_checkbox.cgi src/cpp_checkbox.cpp -lcgicc \
 && g++ -o cgi-bin/cpp_radiobutton.cgi src/cpp_radiobutton.cpp -lcgicc \
 && g++ -o cgi-bin/cpp_textarea.cgi src/cpp_textarea.cpp -lcgicc \
 && g++ -o cgi-bin/cpp_dropdown.cgi src/cpp_dropdown.cpp -lcgicc \
 && g++ -o cgi-bin/setcookies.cgi src/setcookies.cpp -lcgicc \
 && g++ -o cgi-bin/getcookies.cgi src/getcookies.cpp -lcgicc \
 && g++ -o cgi-bin/cpp_uploadfile.cgi src/cpp_uploadfile.cpp -lcgicc
