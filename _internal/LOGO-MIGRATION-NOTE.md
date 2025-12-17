---
title: Logo Migration Note
---

# Logo Migration Note
# FaithFrontier Main Logo Update

The main logo is now located at:

_includes/logo-faithfrontier-header.svg

To use this as the main logo everywhere (including dark and light themes), update the following keys in _config.yml:

logo_main_dark: "/_includes/logo-faithfrontier-header.svg"
logo_main_light: "/_includes/logo-faithfrontier-header.svg"
logo_main: "/_includes/logo-faithfrontier-header.svg"

This ensures the header.html include will always use the new SVG.

---

If you want to keep the old PNGs for fallback, leave those keys as-is. The SVG will now be the default for all main logo uses.
