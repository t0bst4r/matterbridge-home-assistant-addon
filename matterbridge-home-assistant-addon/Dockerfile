ARG BUILD_FROM
FROM $BUILD_FROM

COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

CMD /docker-entrypoint.sh
