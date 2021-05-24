# Retro web development with C++ and CGI

Builds a container that runs C++ [CGI](https://en.wikipedia.org/wiki/Common_Gateway_Interface) programs using Apache.

To build and run locally:

```shell
docker build -t cpp-cgi .
docker run -p 8080:8080 cpp-cgi
```

C++ code samples from [here](https://www.tutorialspoint.com/cplusplus/cpp_web_programming.htm).
