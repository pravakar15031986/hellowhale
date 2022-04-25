FROM nginx
# Download and install wkhtmltopdf dependencies.
COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
FROM openjdk:8-jre-alpine
RUN curl https://objects.githubusercontent.com/github-production-release-asset-2e65be/131323182/10e1d800-ab93-11ea-862e-4f209c09ebf0?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220425%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220425T071013Z&X-Amz-Expires=300&X-Amz-Signature=cb27d417b31bb38bd3b411ee97c04032331b1a68d70d9a0df9a790abc44af956&X-Amz-SignedHeaders=host&actor_id=68266118&key_id=0&repo_id=131323182&response-content-disposition=attachment%3B%20filename%3Dwkhtmltox_0.12.6-1.focal_amd64.deb&response-content-type=application%2Foctet-stream


# Install wkhtmltopdf
#RUN apk add --no-cache wkhtmltopdf

ENTRYPOINT ["wkhtmltopdf"]

