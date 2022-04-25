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
RUN wget http://downloads.sourceforge.net/project/wkhtmltopdf/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
RUN gdebi --n wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]
