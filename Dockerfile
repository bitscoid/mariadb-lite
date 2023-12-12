FROM alpine:3.18

LABEL Maintainer="Nurul Imam <bits.co.id>" \
    Description="MariaDB of Alpine Linux."

LABEL org.opencontainers.image.vendor="Nurul Imam" \
    org.opencontainers.image.url="https://github.com/bitscoid/mariadb-lite" \
    org.opencontainers.image.source="https://github.com/bitscoid/mariadb-lite" \
    org.opencontainers.image.title="MariaDB Lite" \
    org.opencontainers.image.description="MariaDB of Alpine Linux." \
    org.opencontainers.image.version="1.0" \
    org.opencontainers.image.documentation="https://github.com/bitscoid/mariadb-lite"

# MySQL Credentials
ENV MYSQL_USER=user_bits
ENV MYSQL_PASS=user_password
ENV MYSQL_NAME=dbname_bits

# Install MariaDB
RUN apk -U upgrade && \
    apk add --no-cache --update mariadb mariadb-client && \
    rm -rf /var/cache/apk/*

# Config MariaDB
COPY ./mariadb/my.cnf /etc/my.cnf
RUN rm -rf /etc/my.cnf.d/

# Init MariaDB
COPY ./init.sh /usr/local/bin/init.sh
COPY ./run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/*.sh

# Add VOLUME
VOLUME /var/lib/mysql
EXPOSE 3306

CMD ["sh", "/usr/local/bin/run.sh"]

# Configure a healthcheck
HEALTHCHECK --timeout=10s CMD mariadb-admin --silent --wait=30 ping