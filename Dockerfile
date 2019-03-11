FROM phpearth/php:7.3-nginx

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
    ADMINER_VER=4.7.1

RUN apk add --no-cache php7.3-pdo_mysql php7.3-pdo_pgsql php7.3-pdo_sqlite php7.3-mongodb \
    && mkdir -p /var/www/app \
    && curl -o /var/www/app/index.php -OL https://github.com/vrana/adminer/releases/download/v$ADMINER_VER/adminer-$ADMINER_VER.php \
    && chown -R 82 /var/www/app \
    && cp /etc/php/7.3/php.ini-production /etc/php/7.3/php.ini \
    && echo "memory_limit = 512M" >> /etc/php/7.3/php.ini \
    && echo "upload_max_filesize = 1000M" >> /etc/php/7.3/php.ini \
    && echo "post_max_size = 1200M" >> /etc/php/7.3/php.ini \
    && echo "max_execution_time = 600" >> /etc/php/7.3/php.ini

COPY etc /etc

EXPOSE 80
