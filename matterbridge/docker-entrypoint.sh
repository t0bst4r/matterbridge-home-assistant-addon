#!/usr/bin/with-contenv bashio

HOME_ASSISTANT_URL=$(bashio::config 'home_assistant_url')
HOME_ASSISTANT_ACCESS_TOKEN=$(bashio::config 'home_assistant_access_token')
HOME_ASSISTANT_CLIENT_CONFIG=$(bashio::config 'home_assistant_client_config')

export HOME_ASSISTANT_URL
export HOME_ASSISTANT_ACCESS_TOKEN
export HOME_ASSISTANT_CLIENT_CONFIG

matterbridge -bridge
