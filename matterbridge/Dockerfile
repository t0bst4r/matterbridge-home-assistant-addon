ARG BUILD_FROM=ghcr.io/hassio-addons/base-nodejs:0.2.2
# hadolint ignore=DL3006
FROM $BUILD_FROM

# webinterface
EXPOSE 8283
# websocket for the webinterface
EXPOSE 8284

RUN mkdir /app
WORKDIR /app

RUN ln -s /config /root/.matterbridge

COPY package.json package.json
RUN npm install

COPY run.sh run.sh
RUN chmod a+x run.sh

CMD [ "/app/run.sh" ]
