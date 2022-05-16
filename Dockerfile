FROM nginx

COPY wrapper.sh /
RUN chown -R nginx:nginx  /usr/share/nginx/html
RUN chmod -R +x /usr/share/nginx/html/assets

COPY html /usr/share/nginx/html

CMD ["./wrapper.sh"]
