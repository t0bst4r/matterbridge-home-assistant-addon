#!/usr/bin/with-contenv bashio

HOME_ASSISTANT_URL=http://supervisor/core
HOME_ASSISTANT_ACCESS_TOKEN=$SUPERVISOR_TOKEN

CONFIG_INCLUDE_DOMAINS=$(bashio::config 'include_domains' | jq --raw-input --compact-output --slurp 'split("\n")')
CONFIG_INCLUDE_PATTERNS=$(bashio::config 'include_patterns' | jq --raw-input --compact-output --slurp 'split("\n")')
CONFIG_EXCLUDE_DOMAINS=$(bashio::config 'exclude_domains' | jq --raw-input --compact-output --slurp 'split("\n")')
CONFIG_EXCLUDE_PATTERNS=$(bashio::config 'exclude_patterns' | jq --raw-input --compact-output --slurp 'split("\n")')

HOME_ASSISTANT_CLIENT_CONFIG=$(jq --null-input --compact-output \
  --argjson includeDomains "$CONFIG_INCLUDE_DOMAINS" \
  --argjson includePatterns "$CONFIG_INCLUDE_PATTERNS" \
  --argjson excludeDomains "$CONFIG_EXCLUDE_DOMAINS" \
  --argjson excludePatterns "$CONFIG_EXCLUDE_PATTERNS" \
  '{ "includeDomains": $includeDomains, "includePatterns": $includePatterns, "excludeDomains": $excludeDomains, "excludePatterns": $excludePatterns }'
)

echo "#############################"
echo "CURRENT CLIENT CONFIGURATION:"
echo "$HOME_ASSISTANT_CLIENT_CONFIG" | jq
echo "#############################"

export HOME_ASSISTANT_URL
export HOME_ASSISTANT_ACCESS_TOKEN
export HOME_ASSISTANT_CLIENT_CONFIG

matterbridge -add matterbridge-home-assistant
matterbridge -bridge -docker
