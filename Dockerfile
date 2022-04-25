FROM nginx
# Download and install wkhtmltopdf dependencies.
COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]

FROM ubuntu:20.04
MAINTAINER Pravakar
RUN apt-get update
RUN apt-get install wget -Y
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb
RUN sudo apt install ./wkhtmltox_0.12.6-1.focal_amd64.deb

