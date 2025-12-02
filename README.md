# FaithFrontier

This repository is configured for GitHub Pages using Jekyll.

## Structure

The repository includes the following directories ready for your content:

- `_layouts/` - Place your layout templates here
- `_includes/` - Place your reusable content snippets here
- `_posts/` - Place your blog posts here (format: YYYY-MM-DD-title.md)
- `_cases/` - Custom collection for cases
- `_essays/` - Custom collection for essays
- `assets/css/` - Place your CSS files here
- `assets/js/` - Place your JavaScript files here
- `assets/images/` - Place your images here

## Configuration

The `_config.yml` file is configured for GitHub Pages compatibility. To use a custom domain:

1. Uncomment and update the `url` field in `_config.yml` with your custom domain
2. Add a CNAME file to the repository root with your domain name
3. Configure your DNS settings to point to GitHub Pages

## Building Locally

To build and preview the site locally:

```bash
bundle install
bundle exec jekyll serve
```

Then visit `http://localhost:4000` in your browser.

## Deploying to GitHub Pages

1. Ensure your default branch is set to `main` in repository settings
2. Go to repository Settings > Pages
3. Set the source to deploy from the `main` branch
4. Your site will be published at `https://[username].github.io/[repository]` or your custom domain

## Adding Content

Simply add your files to the appropriate directories and commit them. Jekyll will automatically process and publish them on GitHub Pages.
# Faith Frontier — Jekyll Site

This repository powers **faithfrontier.org**.

- `_cases/` — Markdown case records (no PDFs or binary assets).
- `_essays/` — Long-form essays and commentary.
- `assets/cases/` — Case PDFs, exhibits, and other binary files (you will add these).
- `/cases/` — Public case index page.
- `/essays/` — Public essays index page.

## Building and Deploying

### Local Development

To build and test the site locally:

```bash
# Install Ruby dependencies
bundle install

# Build the site (production mode)
JEKYLL_ENV=production bundle exec jekyll build

# Or run the development server
bundle exec jekyll serve
# Visit http://localhost:4000
```

### Deployment to GitHub Pages

The site automatically deploys to GitHub Pages when changes are pushed to the `main` branch.

**Important:** The site uses the custom domain `faithfrontier.org` configured in `_config.yml` and the `CNAME` file. The GitHub Actions workflow builds Jekyll without any baseurl override to ensure asset paths work correctly with the custom domain.

**DNS Configuration:**
- Add CNAME record: `faithfrontier.org` → `xtx33.github.io`
- Or A records pointing to GitHub Pages IP addresses

**GitHub Pages Settings:**
- Repository > Settings > Pages
- Source: Deploy from a branch
- Branch: `main` / (root)
- Custom domain: `faithfrontier.org`

### Continuous Integration

The repository includes two workflows:
- **jekyll.yml**: Builds and deploys the site to GitHub Pages
- **validate.yml**: Runs on every push/PR to verify:
  - Jekyll builds successfully
  - Critical CSS files exist and are not empty
  - CSS files are properly referenced in HTML
  - Links are valid

## Usage

## Usage

1. Add or edit case records in `_cases/`.
2. Place PDFs and exhibits under `assets/cases/<docket>/` and update the `assets_dir` and `documents` fields in each case file.
3. Push to GitHub and connect the repository to your `faithfrontier.org` domain.

## Features

### Docket Management System
Automated intake and organization of court filings and documents. See [DOCKET-SYSTEM.md](DOCKET-SYSTEM.md) for details.

### AI-Powered Case Analysis
OpenAI integration provides automated analysis of case records from two perspectives:
- **Judicial Oversight**: Constitutional and procedural analysis
- **Journalistic Commentary**: Public interest and accountability perspective

**Quick Setup:**
1. Get an API key from [OpenAI Platform](https://platform.openai.com/api-keys)
2. Add it as a repository secret: Settings > Secrets and variables > Actions > New repository secret
3. Name: `OPENAI_API_KEY`
4. Value: Your OpenAI API key
5. **Generate analysis**: See [QUICKSTART-GENERATE-ANALYSIS.md](QUICKSTART-GENERATE-ANALYSIS.md) for step-by-step instructions

**Documentation:**
- [QUICKSTART-GENERATE-ANALYSIS.md](QUICKSTART-GENERATE-ANALYSIS.md) - Quick start guide to generate analysis
- [ANALYSIS-SYSTEM.md](ANALYSIS-SYSTEM.md) - Complete system documentation
- [.github/SETUP-OPENAI.md](.github/SETUP-OPENAI.md) - API key setup instructions
