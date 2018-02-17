FROM alpine:3.7

RUN apk add --update openldap openldap-back-mdb && \
    rm -rf /var/cache/apk/*

ENV ORGANISATION_NAME "Example Ltd"
ENV SUFFIX "dc=example,dc=com"
ENV ROOT_USER "admin"
ENV ROOT_PW "password"
ENV USER_UID "pgarrett"
ENV USER_GIVEN_NAME "Phill"
ENV USER_SURNAME "Garrett"
ENV USER_EMAIL "pgarrett@example.com"
ENV LOG_LEVEL "stats"

COPY scripts/* /etc/openldap/

EXPOSE 389 636

VOLUME ["/ldif", "/var/lib/openldap/openldap-data"]

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
