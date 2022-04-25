FROM nginx
# Download and install wkhtmltopdf dependencies.
RUN apt-get install -y \
	build-essential \
	xorg \
	libssl-dev \
	libxrender-dev \
	wget \
	gdebi \
	&& apt-get clean

# Download the wkhtmltopdf package.
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb

# Install the wkhtmltopdf package.
RUN gdebi --n wkhtmltox_0.12.6-1.bionic_amd64.deb
COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
