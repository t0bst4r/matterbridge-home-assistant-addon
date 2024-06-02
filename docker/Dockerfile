FROM node:18-alpine

EXPOSE 8283
EXPOSE 8284

ENV HOME_ASSISTANT_URL=""
ENV HOME_ASSISTANT_ACCESS_TOKEN=""
ENV HOME_ASSISTANT_CLIENT_CONFIG="{}"

ENV MATTERBRIDGE_VERSION "1.2.19"
ENV MATTERBRIDGE_HOME_ASSISTANT_VERSION "0.0.4"

RUN npm install --no-audit -g \
    matterbridge@${MATTERBRIDGE_VERSION} \
    matterbridge-home-assistant@${MATTERBRIDGE_HOME_ASSISTANT_VERSION}

RUN mkdir -p /root/.matterbridge/storage/.matterbridge
RUN echo '{"key":"globalModulesDirectory","value":"/usr/local/lib/node_modules"}' > /root/.matterbridge/storage/.matterbridge/d01917a070027b55bce538a96fa2004f061de6fe1644f402a321c6db8c71b9ba

RUN matterbridge -add matterbridge-home-assistant

CMD matterbridge -bridge
