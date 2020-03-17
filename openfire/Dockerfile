FROM quantumobject/docker-openfire
MAINTAINER svallero AT to.infn.it

# These are the env variables we expect to be provided at runtime
ENV DB_HOST "localhost"
ENV DB_NAME "lvalert"
ENV DB_USERNAME "lvalert"
ENV DB_PASSWORD "password"
ENV ENCRYPTION_KEY "default"
ENV ADMIN_PASSWORD "adminpassword"

# Write templated openfire config files
# NB users are stored in the DB and cannot be configured at set-up,
# they should be created by hand the first time.
# <TODO>: forse c'e' uno script in giro, vedere
RUN set -ex \
    && mv /etc/openfire/openfire.xml /etc/openfire/openfire.xml.orig 

COPY openfire.template /etc/openfire/openfire.template

# Custom entrypoint
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
