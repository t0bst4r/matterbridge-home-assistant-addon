ARG BUILD_FROM=ghcr.io/hassio-addons/base-nodejs:0.2.2
FROM $BUILD_FROM

ARG MATTERBRIDGE_VERSION=1.2.19
ARG MATTERBRIDGE_HOME_ASSISTANT_VERSION=0.0.5

EXPOSE 8283
EXPOSE 8284

RUN npm install -g \
    matterbridge@${MATTERBRIDGE_VERSION} \
    matterbridge-home-assistant@${BUILD_VERSION}

RUN ln -s /config /root/.matterbridge

COPY run.sh /
RUN chmod a+x /run.sh

CMD /run.sh
