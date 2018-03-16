FROM alpine:3.7
LABEL maintainer Mattias Giese <mattiasgiese@posteo.net>
EXPOSE 389
VOLUME /data
VOLUME /config
CMD ["/entrypoint"]

RUN apk add --no-cache openldap openldap-overlay-all openldap-clients

COPY entrypoint /
RUN chmod 0755 /entrypoint \
	&& rm -r /var/lib/openldap/openldap-data/ \
	&& mkdir /initdb.d \
	&& chown ldap:ldap /config /data \
	&& ln -s /data /var/lib/openldap/openldap-data
