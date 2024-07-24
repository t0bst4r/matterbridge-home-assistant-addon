#!/usr/bin/with-contenv bashio

CONFIG_INCLUDE_DOMAINS=$(bashio::config 'include_domains' | jq --raw-input --compact-output --slurp 'split("\n")')
CONFIG_EXCLUDE_DOMAINS=$(bashio::config 'exclude_domains' | jq --raw-input --compact-output --slurp 'split("\n")')

CONFIG_INCLUDE_PATTERNS=$(bashio::config 'include_patterns' | jq --raw-input --compact-output --slurp 'split("\n")')
CONFIG_EXCLUDE_PATTERNS=$(bashio::config 'exclude_patterns' | jq --raw-input --compact-output --slurp 'split("\n")')

CONFIG_INCLUDE_LABELS=$(bashio::config 'include_labels' | jq --raw-input --compact-output --slurp 'split("\n")')
CONFIG_EXCLUDE_LABELS=$(bashio::config 'exclude_labels' | jq --raw-input --compact-output --slurp 'split("\n")')

CONFIG_INCLUDE_PLATFORMS=$(bashio::config 'include_platforms' | jq --raw-input --compact-output --slurp 'split("\n")')
CONFIG_EXCLUDE_PLATFORMS=$(bashio::config 'exclude_platforms' | jq --raw-input --compact-output --slurp 'split("\n")')
LOG_LEVEL=$(bashio::config 'log_level')

MATCHER=$(jq --null-input --compact-output \
  --argjson includeDomains "$CONFIG_INCLUDE_DOMAINS" \
  --argjson excludeDomains "$CONFIG_EXCLUDE_DOMAINS" \
  --argjson includePatterns "$CONFIG_INCLUDE_PATTERNS" \
  --argjson excludePatterns "$CONFIG_EXCLUDE_PATTERNS" \
  --argjson includeLabels "$CONFIG_INCLUDE_LABELS" \
  --argjson excludeLabels "$CONFIG_EXCLUDE_LABELS" \
  --argjson includePlatforms "$CONFIG_INCLUDE_PLATFORMS" \
  --argjson excludePlatforms "$CONFIG_EXCLUDE_PLATFORMS" \
  '{ "includeDomains": $includeDomains, "excludeDomains": $excludeDomains, "includePatterns": $includePatterns, "excludePatterns": $excludePatterns, "includeLabels": $includeLabels, "excludeLabels": $excludeLabels, "includePlatforms": $includePlatforms, "excludePlatforms": $excludePlatforms }'
)

HOME_ASSISTANT_CONFIG=$(jq --null-input --compact-output \
  --argjson matcher "$MATCHER" \
  --arg accessToken "$SUPERVISOR_TOKEN" \
  '{ "url": "http://supervisor/core", "accessToken": $accessToken, "matcher": $matcher }'
)

MHA_CONFIG=$(jq --null-input --compact-output \
  --argjson homeAssistant "$HOME_ASSISTANT_CONFIG" \
  '{ "homeAssistant": $homeAssistant }'
)

echo "#############################"
echo "CURRENT CONFIGURATION:"
echo "$MHA_CONFIG" | jq
echo "#############################"

export LOG_LEVEL
export MHA_CONFIG

# Workaround to fix https://github.com/t0bst4r/matterbridge-home-assistant/issues/115
if grep -q /app/node_modules/matterbridge-home-assistant ~/.matterbridge/storage/.matterbridge/*; then
  sed -i 's/\/app\/node_modules\/matterbridge-home-assistant/\/usr\/local\/lib\/node_modules\/matterbridge-home-assistant/g' ~/.matterbridge/storage/.matterbridge/*
fi

matterbridge -add matterbridge-home-assistant

MATTERBRIDGE_OPTIONS=("-bridge" "-docker")
if [ "$LOG_LEVEL" = "debug" ]; then
  MATTERBRIDGE_OPTIONS+=("-debug")
fi

matterbridge "${MATTERBRIDGE_OPTIONS[@]}"
