FROM nginx
# Download and install wkhtmltopdf dependencies.
COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]

FROM ubuntu:14.04
MAINTAINER Pravakar
RUN apt-get install libfontconfig \
    zlib1g \
    libfreetype6 \
    libxrender1 \
    libxext6 \
    libx11-6

# TEMPORARY FIX! SEE: https://github.com/wkhtmltopdf/wkhtmltopdf/issues/3001
RUN apt-get install libssl1.0.0=1.0.2g-1ubuntu4.8
RUN apt-get install libssl-dev=1.0.2g-1ubuntu4.8

# Download, extract and move binary in place
RUN curl -L -o wkhtmltopdf.tar.xz https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar -xf wkhtmltopdf.tar.xz
RUN mv wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf
RUN chmod +x /usr/local/bin/wkhtmltopdf


# Show the extended help
CMD ["-h"]
