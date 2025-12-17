# Faith Frontier front-end style rules

- **No CSS in markdown**: Do not paste CSS or `<style>` blocks into markdown content. Keep styles in `/assets/css/*.css` (homepage-only overrides live in `assets/css/home.css`).
- **Locked nav component**: Navigation markup lives in `_includes/nav.component.html` and JavaScript in `assets/js/nav.js`. Update `scripts/nav-snapshot.json` (with `NAV_SNAPSHOT_UPDATE=1 node scripts/check-nav-snapshot.js`) and Playwright tests if you intentionally change it.
- **Homepage styles**: Shared theme tokens and header/footer styles belong in `assets/css/theme.css`; component and page styles live in `assets/css/main.css`; homepage-only tweaks go in `assets/css/home.css`.
- **Content linting**: Run `npm run lint:content` before committing to ensure markdown files stay CSS-free.
