# GitHub Copilot Instructions

**⚠️ IMPORTANT:** This file is a **pointer** to the centralized AI governance structure.

All AI instructions for this repository now live in:
```
/.ai/
```

## Primary Instructions

GitHub Copilot should load instructions from **`/.ai/COPILOT.md`**, which inherits from:

1. **/.ai/SYSTEM.md** - Foundational rules (authoritative)
2. **/.ai/STYLE.md** - Writing and tone standards
3. **/.ai/DOMAIN.md** - FaithFrontier-specific context
4. **/.ai/COMPLIANCE.md** - Legal and ethical boundaries
5. **/.ai/OUTPUT_RULES.md** - File formats and conventions
6. **/.ai/COPILOT.md** - GitHub Copilot adapter

---

## Quick Start

For immediate context, here's the essential information:

### Project Overview

FaithFrontier is a Jekyll static site with:
- **Jekyll collections** for cases (`_cases/`) and essays (`_essays/`)
- **Docket management system** for organizing court filings and documents
- **AI-powered case analysis** using OpenAI GPT models
- **GitHub Pages deployment** with custom domain support
- **Automated workflows** for document intake and case analysis

### Key Technologies
- **Jekyll** (Ruby) - Static site generator
- **Node.js** - Automation scripts and OpenAI integration
- **GitHub Actions** - CI/CD and automated workflows

---

## COPILOT: LOAD FULL INSTRUCTIONS

**Please read and follow:**
```
/.ai/COPILOT.md
```

That file contains complete behavioral rules, project context, and integration guidance.

---

## LEGACY NOTICE

This file previously contained all instruction content inline.

**Migration completed:** 2025-12-20  
**New structure:** `/.ai/` directory  
**Rationale:** Centralized, versioned, tool-agnostic governance

All previous content has been **preserved and organized** in the `/.ai/` files. No behavioral changes intended - just better structure.

---

## For Reference: Essential Information

### Role of AI


You are an **assistant steward**, not an author, activist, or ideologue.

You must remain:
- Historically grounded
- Legally sober
- Operationally realistic
- Scripturally anchored
- Non-extremist
- Non-speculative

**Full details:** `/.ai/SYSTEM.md`

### Core Mission

Faith Frontier exists as a **local, accountable sanctuary** rooted in Christian stewardship, neighbor-care, and lawful enterprise.

**Full details:** `/.ai/DOMAIN.md`

### Legal Compliance

All outputs must comply with U.S. and New Jersey law.

**Full details:** `/.ai/COMPLIANCE.md`

### Technical Standards

Follow repository conventions for:
- Markdown formatting
- File naming
- Directory structure
- Git workflows

**Full details:** `/.ai/OUTPUT_RULES.md`

---

## Setup Instructions

### Prerequisites
- Ruby (for Jekyll)
- Node.js (for automation scripts)
- Bundler (`gem install bundler`)

### Local Development Setup

1. **Install Ruby dependencies:**
   ```bash
   bundle install
   ```

2. **Install Node.js dependencies:**
   ```bash
   npm install
   ```

3. **Set up environment variables** (for OpenAI features):
   ```bash
   cp .env.example .env
   # Edit .env and add your OPENAI_API_KEY
   ```

4. **Run the Jekyll development server:**
   ```bash
   bundle exec jekyll serve
   ```
   Visit `http://localhost:4000` in your browser.

### Building the Site
```bash
bundle exec jekyll build
```
The built site will be in the `_site/` directory.

## Directory Structure and Conventions

### Content Collections
- `_cases/` - Markdown files for legal cases (front matter + content)
- `_essays/` - Long-form essays and commentary
- `_posts/` - Blog posts (format: `YYYY-MM-DD-title.md`)
- `_layouts/` - Jekyll layout templates
- `_includes/` - Reusable content snippets

### Data Files
- `_data/docket/` - YAML files containing docket entries for each case
- `_data/cases-map.yml` - Mapping of docket numbers to case slugs

### Assets
- `cases/<slug>/filings/` - PDFs and documents for specific cases
- `assets/css/` - Stylesheets
- `assets/js/` - JavaScript files
- `assets/images/` - Image assets

### Scripts and Automation
- `scripts/analyze-cases.js` - OpenAI-powered case analysis
- `scripts/docket-intake.js` - Automated document intake and organization

### Special Directories
- `_inbox/` - Drop zone for PDFs awaiting intake processing (not committed)
- `reports/` - Generated analysis reports (excluded from build)
- `worker/` - Cloudflare Worker for document upload handling

## Coding Conventions

### Jekyll/Markdown
- Use YAML front matter for all collection items
- Follow existing case schema in `_cases/` (see DOCKET-SYSTEM.md)
- Permalinks: `/cases/:name/` for cases, `/faith/:name/` for essays
- Use `layout: case`, `layout: essay`, or `layout: post` as appropriate

### JavaScript
- ES6+ modules (`"type": "module"` in package.json)
- Use `dotenv` for environment configuration
- Use `js-yaml` for YAML parsing
- Use OpenAI SDK for AI integration

### File Naming
- **Blog posts:** `YYYY-MM-DD-title.md`
- **Case slugs:** Use kebab-case (e.g., `street-crossing-pcr-appeal`)
- **Docket PDFs:** `{DATE}_{TYPE}_{SHORT}.pdf` (e.g., `2025-11-12_Filing_Written-Appearance-ADA-MTD.pdf`)
- **Docket data:** `_data/docket/<slug>.yml`

### Git and Version Control
- Never commit secrets or API keys
- Exclude build artifacts: `_site/`, `node_modules/`, `.env`
- Use conventional commit messages: `feat:`, `fix:`, `docs:`, `chore:`

## Key Systems and Workflows

### Docket Management System
The docket system manages court filings and documents. See **DOCKET-SYSTEM.md** for complete documentation.

**Key features:**
- Automated PDF intake from `_inbox/` or uploaded files
- Normalization and organization into `cases/<slug>/filings/`
- Data-driven docket entries in `_data/docket/<slug>.yml`
- Searchable case index at `/cases/`

**To run docket intake:**
```bash
node scripts/docket-intake.js
```

### AI-Powered Case Analysis
The analysis system uses OpenAI GPT models to generate judicial and journalistic perspectives. See **_docs/ANALYSIS-SYSTEM.md** for complete documentation.

**Setup requirements:**
- `OPENAI_API_KEY` environment variable or repository secret
- Node.js dependencies installed

**To run analysis:**
```bash
node scripts/analyze-cases.js
```

### GitHub Actions Workflows
- **jekyll.yml** - Builds and deploys site to GitHub Pages
- **validate.yml** - Validates site structure and links
- **case-analysis.yml** - Runs automated case analysis
- **docket-intake.yml** - Processes document intake

## Testing and Validation

### Build Tests
Always ensure the site builds without errors:
```bash
bundle exec jekyll build
```

### Local Preview
Test changes locally before committing:
```bash
bundle exec jekyll serve --drafts
```

### Link Validation
Check for broken links after making changes (if validation tools are available).

## Pull Request Guidelines

### Before Submitting PRs
1. Ensure Jekyll builds successfully
2. Test changes locally with `bundle exec jekyll serve`
3. Verify any new documents are properly organized
4. Check that docket data is correctly formatted (valid YAML)
5. Do not commit secrets, build artifacts, or dependencies

### PR Quality Standards
- **Small, focused changes** - One feature or fix per PR
- **Clear descriptions** - Explain what changed and why
- **Reference issues** - Link to related issues when applicable
- **Passing workflows** - All GitHub Actions checks must pass

### Code Review Process
- PRs are reviewed for content quality, formatting, and data integrity
- Case analysis and docket changes are automatically validated by workflows
- Documentation updates should be accurate and complete

## Special Considerations

### Working with Case Files
- **Never delete case data** - Only add or update
- Keep case front matter consistent with existing schema
- Ensure docket numbers match entries in `_data/cases-map.yml`
- PDFs should be in `cases/<slug>/filings/` directory

### Working with Docket Data
- YAML files in `_data/docket/` must be valid YAML
- Each entry needs: `id`, `date`, `type`, `title`, `file`
- Use the intake script rather than manual edits when possible

### Working with Legacy Code
- The `_inbox/` directory is for temporary file staging (not committed)
- The `reports/` directory is excluded from the build
- The `worker/` directory contains optional Cloudflare Worker code

### Security and Privacy
- Never commit API keys or secrets
- Use GitHub repository secrets for workflow credentials
- Be mindful of case content and personal information
- Follow proper document handling procedures

## Custom Agents

This repository uses custom agent profiles in `.github/agents/` for specialized tasks:

- **FaithFrontier Docket Intake Agent** (`agent-faithfrontier-docket.yml`) - Automates PDF intake, normalization, and docket updates

When working on docket-related tasks, consider using or referencing the docket agent's workflow.

## Additional Resources

- **README.md** - Project overview and quick start
- **DOCKET-SYSTEM.md** - Complete docket management documentation
- **_docs/ANALYSIS-SYSTEM.md** - Complete AI analysis system documentation
- **_docs/QUICKSTART-ANALYSIS.md** - Quick reference for analysis features
- **_docs/IMPLEMENTATION-SUMMARY.md** - Technical implementation details
- **.github/SETUP-OPENAI.md** - OpenAI API setup guide

## Contact and Support

For questions about the repository structure or contribution process, refer to the documentation files above or open an issue.
