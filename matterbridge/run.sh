#!/usr/bin/with-contenv bashio

HOME_ASSISTANT_URL=http://supervisor/core
HOME_ASSISTANT_ACCESS_TOKEN=$SUPERVISOR_TOKEN
HOME_ASSISTANT_CLIENT_CONFIG=$(bashio::config 'home_assistant_client_config')

export HOME_ASSISTANT_URL
export HOME_ASSISTANT_ACCESS_TOKEN
export HOME_ASSISTANT_CLIENT_CONFIG

if [ ! -d /root/.matterbridge/storage ]; then
    mkdir -p /root/.matterbridge/storage/.matterbridge
    echo '{"key":"globalModulesDirectory","value":"/usr/local/lib/node_modules"}' > \
        /root/.matterbridge/storage/.matterbridge/d01917a070027b55bce538a96fa2004f061de6fe1644f402a321c6db8c71b9ba

    matterbridge -add matterbridge-home-assistant
fi

matterbridge -bridge
