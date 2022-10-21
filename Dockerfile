FROM nginx
COPY ./html/ /usr/share/nginx/html/.
COPY .docker/* .

COPY nginx.conf /etc/nginx/

RUN ./entrypoint.sh