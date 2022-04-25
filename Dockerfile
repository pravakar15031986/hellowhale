FROM nginx
# Download and install wkhtmltopdf dependencies.
COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
FROM openjdk:8-jre-alpine

# Install wkhtmltopdf
RUN apk add --no-cache wkhtmltopdf

ENTRYPOINT ["wkhtmltopdf"]

