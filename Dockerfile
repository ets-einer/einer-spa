FROM nginx

MAINTAINER Daniel Henrique <henriqueevaldo@outlook.com>

# Do not start daemon for nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Overwrite default config
COPY nginx-site.conf /etc/nginx/conf.d/default.conf
COPY expires.conf /etc/nginx/conf.d/expires.conf

# Set a path to config file to be written, can be changed at runtime
ENV CONFIG_FILE_PATH /usr/share/nginx/html

RUN mkdir /app

RUN echo "<code>Add your index.html to /app: COPY index.html /app/index.html</code>" > /app/index.html

# Copy our start script
COPY start-container.sh /usr/local/bin/start-container

ENTRYPOINT ["start-container"]

CMD ["nginx"]
