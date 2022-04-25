FROM nginx
# Download and install wkhtmltopdf dependencies.
COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]

FROM ubuntu:14.04
MAINTAINER Pravakar

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Download and install wkhtmltopdf
RUN apt-get install -y build-essential xorg libssl-dev libxrender-dev wget gdebi
#RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb
#RUN gdebi --n wkhtmltox-0.12.6-1_linux-trusty-amd64.deb
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb
RUN sudo apt install ./wkhtmltox_0.12.6-1.bionic_amd64.deb
ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]
