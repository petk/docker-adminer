FROM phpearth/php:7.1-nginx

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
    ADMINER_VER=4.3.1

RUN apk add --no-cache php7.1-pdo_mysql php7.1-pdo_pgsql php7.1-pdo_sqlite \
    && mkdir -p /var/www/app \
    && curl -o /var/www/app/index.php -OL https://github.com/vrana/adminer/releases/download/v4.3.1/adminer-$ADMINER_VER.php \
    && chown -R 82 /var/www/app

COPY etc /etc
