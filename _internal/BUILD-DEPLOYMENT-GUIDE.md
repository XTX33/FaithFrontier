---
title: Build & Deployment Guide
---

# Build & Deployment Guide
# Build & Deployment Guide

## Overview

This guide explains how FaithFrontier is built and deployed to GitHub Pages at **faithfrontier.org**.

## Build System

### Technology Stack
- **Static Site Generator**: Jekyll 3.10.0
- **Ruby**: 3.1+ (managed via GitHub Actions)
- **Deployment**: GitHub Pages
- **CI/CD**: GitHub Actions

### Key Configuration

#### _config.yml
```yaml
url: https://faithfrontier.org
baseurl: ""  # Empty for apex domain
```

**Critical**: The `baseurl` must be empty for custom apex domains. Project pages (username.github.io/repo) require `baseurl: "/repo"`.

#### CNAME File
```
faithfrontier.org
```

This file tells GitHub Pages to serve the site at the custom domain instead of `xtx33.github.io/FaithFrontier`.

## Local Development

### Prerequisites
```bash
ruby --version  # Should be 3.1 or higher
gem install bundler
```

### Building Locally

1. **Install dependencies:**
   ```bash
   bundle install
   ```

2. **Build the site (production):**
   ```bash
   JEKYLL_ENV=production bundle exec jekyll build
   ```
   Output: `_site/` directory

3. **Development server with live reload:**
   ```bash
   bundle exec jekyll serve
   # Visit http://localhost:4000
   ```

4. **Test specific viewport (e.g., mobile):**
   - Open Chrome DevTools
   - Toggle device toolbar (Cmd+Shift+M / Ctrl+Shift+M)
   - Select "Responsive" or specific device (iPhone 12, etc.)
   - Test viewport widths: 375px, 390px, 768px, 1024px

### Verifying the Build

Run these checks after building:

```bash
# Check CSS files exist
test -f _site/assets/css/theme.css && echo "✅ theme.css exists"
test -f _site/assets/css/main.css && echo "✅ main.css exists"

# Check CSS referenced in HTML
grep 'href="/assets/css/theme.css"' _site/index.html && echo "✅ theme.css referenced"
grep 'href="/assets/css/main.css"' _site/index.html && echo "✅ main.css referenced"

# Check file sizes
ls -lh _site/assets/css/*.css
```

## GitHub Pages Deployment

### Workflow: .github/workflows/jekyll.yml

**Key Steps:**
1. Checkout code
2. Setup Ruby + bundle install (cached)
3. **Build Jekyll** - Uses `_config.yml` baseurl (empty)
4. Upload artifact
5. Deploy to GitHub Pages

**Important Change (Nov 2025):**
- **Before**: `bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"`
- **After**: `bundle exec jekyll build`
- **Why**: The dynamic baseurl was setting `/FaithFrontier/` for asset paths, breaking CSS loading on the custom domain

### Validation Workflow: .github/workflows/validate.yml

Runs on every push/PR to verify:
- ✅ Jekyll builds successfully
- ✅ CSS files exist (`theme.css`, `main.css`)
- ✅ CSS files are not empty
- ✅ CSS files referenced in HTML
- ✅ Links are valid (via lychee)

This prevents regressions from being merged.

### DNS Configuration

**Current Setup (faithfrontier.org):**
```
Type: CNAME
Host: @  (or faithfrontier.org)
Value: xtx33.github.io
TTL: 3600
```

**Alternative (A Records):**
```
Type: A
Host: @
Values:
  185.199.108.153
  185.199.109.153
  185.199.110.153
  185.199.111.153
```

**www Subdomain (Optional):**
```
Type: CNAME
Host: www
Value: xtx33.github.io
```

### GitHub Repository Settings

**Settings → Pages:**
- Source: Deploy from a branch
- Branch: `main` / (root)
- Custom domain: `faithfrontier.org`
- Enforce HTTPS: ✅ Enabled

**After saving custom domain:**
- GitHub creates a commit with CNAME file (if not already present)
- DNS verification may take a few minutes
- HTTPS certificate provisioned automatically

## Troubleshooting

### Issue: Blank Page on Mobile / CSS 404 Errors

**Symptoms:**
- Page loads but content is invisible
- Browser console shows 404 for `/FaithFrontier/assets/css/main.css`
- Network tab shows failed CSS requests

**Root Cause:**
Jekyll was built with wrong baseurl (`/FaithFrontier/` instead of `/`)

**Solution:**
✅ Fixed in workflow - now uses `_config.yml` baseurl

**Verify Fix:**
```bash
# Check built HTML
grep 'href=' _site/index.html | grep css
# Should show: href="/assets/css/theme.css"
# NOT: href="/FaithFrontier/assets/css/theme.css"
```

### Issue: Assets Not Found After Deployment

**Check:**
1. CNAME file exists and contains correct domain
2. DNS records point to GitHub Pages
3. GitHub Pages custom domain is configured
4. Workflow completed successfully
5. Wait 5-10 minutes for DNS propagation

**Debug:**
```bash
# Check what GitHub deployed
curl -I https://faithfrontier.org/assets/css/main.css
# Should return: HTTP/2 200

# Check DNS
dig faithfrontier.org
# Should show: CNAME xtx33.github.io or A records
```

### Issue: Changes Not Appearing

1. Check GitHub Actions tab - workflow must complete
2. Clear browser cache (Cmd+Shift+R / Ctrl+F5)
3. Check if commit was pushed to `main` branch
4. Verify `_site/` directory is not committed (in .gitignore)

## Testing Before Deployment

### Manual Pre-Deployment Checklist

- [ ] Local build succeeds: `bundle exec jekyll build`
- [ ] No errors in Jekyll output
- [ ] CSS files exist in `_site/assets/css/`
- [ ] CSS properly referenced in `_site/index.html`
- [ ] Mobile viewport (375px) displays content
- [ ] Desktop viewport (1024px+) displays content
- [ ] Navigation menu works (mobile toggle, desktop inline)
- [ ] No console errors in browser

### Automated CI Checks

The `validate.yml` workflow runs these automatically on PR:
- ✅ Build verification
- ✅ CSS existence check
- ✅ CSS reference check
- ✅ Link validation

**Status Badge:**
[![Validate](https://github.com/XTX33/FaithFrontier/actions/workflows/validate.yml/badge.svg)](https://github.com/XTX33/FaithFrontier/actions/workflows/validate.yml)

## Asset Management

### CSS Architecture

1. **theme.css** (8KB) - Base theme, typography, header, footer
2. **main.css** (17KB) - Component styles, page-specific CSS
3. **case-analysis.css** (3KB) - Case analysis page styles

All CSS is committed to the repository (not generated during build).

### Asset Paths

All assets use Jekyll's `relative_url` filter:
```liquid
<link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
```

This ensures paths work correctly:
- **Development**: `/assets/css/main.css`
- **Custom domain**: `/assets/css/main.css`
- **Project page**: `/repo-name/assets/css/main.css` (if baseurl set)

### Fonts

External fonts loaded from Google Fonts:
```css
@import url('https://fonts.googleapis.com/css2?family=...');
```

**Note**: Fonts may be blocked in some CI environments - this is expected and doesn't affect production.

## Performance Considerations

### Build Time
- Typical: 1.5-2 seconds locally
- CI: ~30 seconds (includes setup, caching)

### Site Size
- HTML pages: ~300KB total
- CSS: ~28KB total (gzipped: ~7KB)
- Images: Variable based on content
- Case PDFs: Not included in build (served directly)

### Optimization

Assets are:
- ✅ Minimized and compressed by GitHub Pages
- ✅ Served via CDN
- ✅ HTTPS enabled
- ✅ Cached appropriately

## References

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Jekyll GitHub Action](https://github.com/actions/jekyll-build-pages)
- [DNS Configuration for GitHub Pages](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)

---

**Last Updated**: November 18, 2025
**Maintainer**: Faith Frontier Team
