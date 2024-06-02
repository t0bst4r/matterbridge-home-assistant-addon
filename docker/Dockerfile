FROM --platform=linux/amd64 node:20-alpine as installer

ENV MATTERBRIDGE_VERSION "1.2.19"
ENV MATTERBRIDGE_HOME_ASSISTANT_VERSION "0.0.4"

RUN npm install -g matterbridge@${MATTERBRIDGE_VERSION}
RUN npm install -g matterbridge-home-assistant@${MATTERBRIDGE_HOME_ASSISTANT_VERSION}

RUN mkdir -p /root/.matterbridge/storage/.matterbridge
RUN echo '{"key":"globalModulesDirectory","value":"/usr/local/lib/node_modules"}' > /root/.matterbridge/storage/.matterbridge/d01917a070027b55bce538a96fa2004f061de6fe1644f402a321c6db8c71b9ba

RUN matterbridge -add matterbridge-home-assistant

FROM node:20-alpine

ENV HOME_ASSISTANT_URL=""
ENV HOME_ASSISTANT_ACCESS_TOKEN=""
ENV HOME_ASSISTANT_CLIENT_CONFIG="{}"

EXPOSE 8283
EXPOSE 8284

COPY --from=installer /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=installer /root/.matterbridge /root/.matterbridge

CMD matterbridge -bridge
