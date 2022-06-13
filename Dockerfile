FROM nginx
# Download and install wkhtmltopdf dependencies.
COPY wrapper.sh /
RUN chown -R nginx:nginx  /usr/share/nginx/html
RUN chmod -R 777 /usr/share/nginx/html/assets

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
