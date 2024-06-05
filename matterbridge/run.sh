#!/usr/bin/with-contenv bashio

HOME_ASSISTANT_URL=http://supervisor/core
HOME_ASSISTANT_ACCESS_TOKEN=$SUPERVISOR_TOKEN
HOME_ASSISTANT_CLIENT_CONFIG=$(bashio::config 'home_assistant_client_config')

export HOME_ASSISTANT_URL
export HOME_ASSISTANT_ACCESS_TOKEN
export HOME_ASSISTANT_CLIENT_CONFIG

# Add config on first run
if [ ! -d /root/.matterbridge/storage ]; then
    matterbridge -add matterbridge-home-assistant
fi

matterbridge -bridge
