# DEPRECATION WARNING

This addon should not be used anymore!
It will be replaced with [home-assistant-matter-hub](https://github.com/t0bst4r/home-assistant-matter-hub).

The project is currently in alpha state, but can already be used if you can live with a risk of smaller bugs.

> [!WARNING]
> DO NOT INSTALL THIS ADDON.
> NO FURTHER UPDATES WILL BE MADE HERE.


# Matterbridge Home Assistant Addon

This Home Assistant Add-On populates entities of the home assistant instance as a Matter-bridge.

You can find the changelog [here](https://github.com/t0bst4r/matterbridge-home-assistant/releases).

---

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/t0bst4r)

---

## Public Announcement - Feature Freeze

As the development of this project is conducted in my spare time alongside work and family commitments, my availability
to implement new features or address bugs is limited. Additionally, I must make architectural and strategic decisions
for this project, which sometimes necessitate significant refactoring efforts.

In light of this, I am officially announcing a "feature freeze" as I prepare for a major update to the application.
During this period, no new features will be implemented, and only critical bugs — those that render the application
non-functional — will be addressed until the ongoing refactoring is complete. **This process is expected to take
approximately 1 to 2 months.**

Key changes included in this update will be as follows:

- The application will no longer be based on `matterbridge`; a new user interface will be developed, replacing the
  existing one.
- The application will be renamed from `matterbridge-home-assistant` to `home-assistant-matter-hub` and relocated to a
  new GitHub repository (which is not yet publicly accessible).
- Users will need to uninstall their current instance of `matterbridge-home-assistant` and install the new
  `home-assistant-matter-hub` (which will be made available soon). This transition will also require re-pairing with
  your Matter controllers.

All updates on this will be posted in the
corresponding [discussion in GitHub](https://github.com/t0bst4r/matterbridge-home-assistant/discussions/271). Make sure
to subscribe to this announcement thread.

Thank you for your understanding and continued support.

---

# Supported Entity Domains
See the main project for a [list of supported entities](https://github.com/t0bst4r/matterbridge-home-assistant?tab=readme-ov-file#supported-entities).

# Installation

Open Home Assistant and navigate to the addon settings.
![Home Assistant Settings](docs/hass-settings.png)

Open up the Add-On store and open the "Repositories" menu in the top-right corner.
![!Home Assistant Add-On Store](docs/hass-addon-store.png)

Enter the URL of the GitHub Repo to the list of your add-on
repositories (`https://github.com/t0bst4r/matterbridge-home-assistant-addon`).
![Home Assistant Add Repository](docs/hass-add-repo.png)

After the repository is added, refresh your Add-On Store page and find the Add-On in your list of Add-Ons.
![Home Assistant Add-On Store with the new Add-On](docs/hass-addon-store-with-repo.png)

Open the Add-On page and click "install".
![Home Assistant Matterbridge Add-On](docs/hass-matterbridge-addon.png)

**Before starting the plugin** open the configuration tab and enter your configuration.

![Home Assistant Matterbridge Add-On Configuration](docs/hass-matterbridge-configuration.png)

Start the addon and find the commissioning QR code in the Add-On logs or the web ui.
This code can be used to connect your Matter clients (like Alexa, Apple Home or Google Home) to the bridge.

![Matterbridge commissioning code](docs/matterbridge-commissioning.png)

# Contributors

[![Contributors](https://contrib.rocks/image?repo=t0bst4r/matterbridge-home-assistant-addon)](https://github.com/t0bst4r/matterbridge-home-assistant-addon/graphs/contributors)

---

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/t0bst4r)
