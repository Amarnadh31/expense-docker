FROM nginx
RUN rm -rf /usr/share/nginx/html/*
COPY codes /usr/share/nginx/html
RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d
COPY nginx.conf /etc/nginx/nginx.conf