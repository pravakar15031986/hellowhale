FROM nginx
RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.xenial_amd64.deb -P /var/www
RUN dpkg --configure -a
RUN apt-get install -y xvfb libfontconfig fontconfig libpng16-16 libxrender1 xfonts-75dpi build-essential xorg
RUN dpkg -i /var/www/wkhtmltox_0.12.5-1.xenial_amd64.deb
RUN apt-get update
COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
