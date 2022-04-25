FROM centos:7
# Install dependencies
RUN yum update -y
RUN yum install -y \
        curl \
        fontconfig \
        freetype \
        openssl \
        xorg-x11-fonts-75dpi \
        xorg-x11-fonts-Type1 \
        libX11 \
        libXext \
        libXrender \
        libjpeg \
        libpng \
        libfontconfig \
        libxtst6 \
        xz-utils
RUN yum install -y wget
# TEMPORARY FIX! SEE: https://github.com/wkhtmltopdf/wkhtmltopdf/issues/3001
#RUN apt-get install -y libssl1.0.0=1.0.2g-1ubuntu4.8
#RUN apt-get install -y libssl-dev=1.0.2g-1ubuntu4.8

# Download, extract and move binary in place
#RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.centos7.x86_64.rpm
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.6-1/wkhtmltox-0.12.6-1_linux-generic-amd64.tar.xz
RUN rpm -Uvh wkhtmltox-0.12.6-1_linux-generic-amd64.tar.xz
RUN tar -xvf wkhtmltox-0.12.6-1_linux-generic-amd64.tar.xz
RUN mv wkhtmltox/bin/* /usr/local/bin/
#RUN rpm -ivh wkhtmltox-0.12.6-1.centos7.x86_64.rpm
#RUN tar -xf wkhtmltopdf.tar.xz
#RUN mv wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf
#RUN chmod +x /usr/local/bin/wkhtmltopdf
#RUN tar -xf wkhtmltopdf.tar.xz
#RUN mv wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf

ENTRYPOINT ["wkhtmltopdf"]
#FROM openjdk:8-jre-alpine
#RUN curl https://objects.githubusercontent.com/github-production-release-asset-2e65be/131323182/10e1d800-ab93-11ea-862e-4f209c09ebf0?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220425%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220425T071013Z&X-Amz-Expires=300&X-Amz-Signature=cb27d417b31bb38bd3b411ee97c04032331b1a68d70d9a0df9a790abc44af956&X-Amz-SignedHeaders=host&actor_id=68266118&key_id=0&repo_id=131323182&response-content-disposition=attachment%3B%20filename%3Dwkhtmltox_0.12.6-1.focal_amd64.deb&response-content-type=application%2Foctet-stream


# Install wkhtmltopdf
#RUN apk add --no-cache wkhtmltopdf

#ENTRYPOINT ["wkhtmltopdf"]

FROM nginx
# Download and install wkhtmltopdf dependencies.
COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
