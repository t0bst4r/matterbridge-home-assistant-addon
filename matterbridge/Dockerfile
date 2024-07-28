ARG BUILD_FROM=ghcr.io/hassio-addons/base-nodejs:0.2.3
# hadolint ignore=DL3006
FROM $BUILD_FROM

ARG MATTERBRIDGE_HOME_ASSISTANT_VERSION

# webinterface
EXPOSE 8283
# Matter
EXPOSE 5540

RUN mkdir /app
WORKDIR /app

RUN \
    ln -s /config /root/.matterbridge && \
    MATTERBRIDGE_VERSION=$(npm view matterbridge-home-assistant@$MATTERBRIDGE_HOME_ASSISTANT_VERSION peerDependencies.matterbridge) && \
    npm install -g matterbridge@$MATTERBRIDGE_VERSION matterbridge-home-assistant@$MATTERBRIDGE_HOME_ASSISTANT_VERSION

COPY run.sh run.sh
RUN chmod a+x run.sh

CMD [ "/app/run.sh" ]
