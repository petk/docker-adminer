FROM alpine:3.18

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/petk/docker-adminer.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="Peter Kokot" \
      org.label-schema.name="docker-adminer" \
      org.label-schema.description="Adminer with Docker" \
      org.label-schema.url="https://github.com/petk/docker-adminer"

ENV \
    # Adminer version
    ADMINER_VER=4.8.1

RUN apk add --no-cache \
    curl \
    ca-certificates \
    runit \
    nginx \
    php82 \
    php82-session \
    php82-fpm \
    php82-pdo \
    php82-pdo_mysql \
    php82-pdo_pgsql \
    php82-pdo_sqlite \
    php82-mongodb \
    && mkdir -p /var/www/app \
    && curl -o /var/www/app/index.php -OL https://github.com/vrana/adminer/releases/download/v$ADMINER_VER/adminer-$ADMINER_VER.php \
    && chown -R 82 /var/www/app \
    && echo "memory_limit = 512M" >> /etc/php82/php.ini \
    && echo "upload_max_filesize = 1000M" >> /etc/php82/php.ini \
    && echo "post_max_size = 1200M" >> /etc/php82/php.ini \
    && echo "max_execution_time = 600" >> /etc/php82/php.ini \
    && ln -s /usr/sbin/php-fpm82 /usr/sbin/php-fpm \
    # Forward request and error logs to Docker log collector.
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY files /

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["/sbin/runit-wrapper"]
