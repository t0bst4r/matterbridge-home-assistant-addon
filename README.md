# Matterbridge Home Assistant Addon

This AddOn for home assistant populates all entities of the home assistant instance as an Matterbridge.

# Installation

## Home Assistant AddOn

**THIS IS NOT FINISHED AND NOT YET TESTET.**

## Docker

Simply run
```bash
docker run -d \
  --network host \
  -v /users/t0bst4r/materbridge:/root \
  -e HOME_ASSISTANT_URL="http://192.168.178.23:8123"
  -e HOME_ASSISTANT_ACCESS_TOKEN="ey....dq"
  -e HOME_ASSISTANT_CLIENT_CONFIG="{}"
  --name matterbridge
  ghcr.io/t0bst4r/matterbridge-home-assistant-addon:0.0.4
```

## Configuration
This image needs to be configured using the following environment variables:

- **HOME_ASSISTANT_URL**: the url of your home assistant installation (e.g. `http://192.168.178.23:8123`)
- **HOME_ASSISTANT_ACCESS_TOKEN**: a long-lived access token created for home assistant
- **HOME_ASSISTANT_CLIENT_CONFIG**: JSON-string of the include/exclude configuration (see [the documentation](https://github.com/t0bst4r/matterbridge-home-assistant?tab=readme-ov-file#configuration))

