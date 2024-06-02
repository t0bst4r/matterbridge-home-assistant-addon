ARG BUILD_FROM=ghcr.io/hassio-addons/base-nodejs:0.2.2
ARG BUILD_VERSION
ARG MATTERBRIDGE_VERSION
FROM $BUILD_FROM

EXPOSE 8283
EXPOSE 8284

RUN npm install -g \
    matterbridge@${MATTERBRIDGE_VERSION} \
    matterbridge-home-assistant@${BUILD_VERSION}

RUN mkdir -p /root/.matterbridge/storage/.matterbridge
RUN echo '{"key":"globalModulesDirectory","value":"/usr/local/lib/node_modules"}' > /root/.matterbridge/storage/.matterbridge/d01917a070027b55bce538a96fa2004f061de6fe1644f402a321c6db8c71b9ba

RUN matterbridge -add matterbridge-home-assistant

COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

CMD /docker-entrypoint.sh
