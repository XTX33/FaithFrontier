# FaithFrontier Docket Management System

This document describes the docket management system implemented for the FaithFrontier Jekyll site.

## Overview

The docket system provides a structured way to manage court filings, orders, and other case documents with the following features:

- **Searchable case index** with filtering by status and text search
- **Data-driven docket entries** stored in YAML files
- **Automated intake workflow** for normalizing and organizing PDFs
- **PR-based upload system** via Cloudflare Worker (optional)
- **GitHub Pages compatible** - no custom plugins required

## Directory Structure

```
├── _cases/                          # Case markdown files
├── _data/
│   ├── docket/                      # Docket entries (YAML)
│   │   ├── street-crossing-pcr-appeal.yml
│   │   ├── barber-nj-pcr-2022.yml
│   │   └── ...
│   └── cases-map.yml                # Docket number → slug mapping
├── assets/
│   ├── cases/                       # Case assets organized by slug
│   │   ├── street-crossing-pcr-appeal/
│   │   │   └── docket/              # PDFs for this case
│   │   └── ...
│   └── js/
│       ├── case-search.js           # Client-side filtering
│       └── docket-submit.js         # Upload form handler
├── cases/
│   └── index.html                   # Searchable case index
├── cases.json                       # JSON feed for search
├── docket/
│   └── submit/
│       └── index.html               # Upload form
├── _inbox/                          # Drop PDFs here for intake
├── scripts/
│   └── docket-intake.js             # Intake automation
└── worker/
    ├── worker.js                    # Cloudflare Worker
    └── README.md                    # Worker setup instructions
```

## Case Schema

Each case in `_cases/*.md` should follow this front matter schema:

```yaml
---
layout: case
published: true
title: "Full Case Title"
short_title: "Short Case Title"
permalink: /cases/<slug>/
court: "Court Name"
venue: "Venue"
case_type: "Case Type"
role: "Your Role"
dockets: ["DOCKET-1", "DOCKET-2"]
primary_docket: "DOCKET-1"
status: "active"  # Options: active, pending, closed
filed_date: YYYY-MM-DD
judge: "Judge Name"
tags: ["tag1", "tag2"]
---
```

### Status Field Values

The `status` field should use one of three standardized values:

- **`active`** — Case is actively proceeding with regular filings, hearings, or discovery
- **`pending`** — Case has a specific pending action (e.g., awaiting a decision, motion under consideration, appeal pending)
- **`closed`** — Case has been concluded, dismissed, or otherwise terminated

These standardized values enable consistent filtering and searching across all cases in the index.

## Docket Entry Schema

Docket entries in `_data/docket/<slug>.yml`:

- PDFs live at: `cases/<slug>/filings/`

```yaml
- id: 2025-11-12-unique-identifier
  date: 2025-11-12
  type: Filing|Order|Notice|Brief|Exhibit|Motion|Other
  title: Human-readable title
  file: /cases/<slug>/filings/filename.pdf
```

## Usage

### Method 1: Web Upload (Recommended)

1. Upload PDF to `cases/<slug>/filings/`
2. Add a docket entry in `_data/docket/<slug>.yml` that points to `/cases/<slug>/filings/<filename>.pdf`

**Note:** Requires Cloudflare Worker setup (see `worker/README.md`)

### Method 2: Automated Intake

1. Drop PDFs into `_inbox/` directory
2. Commit and push
3. The intake workflow runs automatically
4. Review the generated PR and merge

### Method 3: Manual

1. Upload PDF to `cases/<slug>/filings/`
2. Edit `_data/docket/<slug>.yml` to add entry
3. Commit and push

#### Best Practice: Maintaining Chronological Order

When manually adding docket entries to `_data/docket/<slug>.yml`, follow these guidelines to maintain chronological order:

1. **Date Format**: Use `YYYY-MM-DD` format for all dates (e.g., `2025-11-16`)
2. **Entry Ordering**: Add new entries in chronological order, with the oldest entries at the top and newest at the bottom
3. **ID Convention**: Use the format `YYYY-MM-DD-brief-description` for entry IDs
4. **Consistent Structure**: Each entry should include:
   ```yaml
   - id: 2025-11-16-motion-for-relief
     date: 2025-11-16
     type: Motion|Filing|Order|Notice|Brief|Exhibit|Other
     title: Human-readable title describing the document
     file: /cases/<slug>/filings/2025-11-16_Type_Description.pdf
     notes: (Optional) Additional context or notes
   ```

**Example**: Adding multiple filings in chronological order to a case docket:

```yaml
# _data/docket/example-case.yml
- id: 2025-10-01-complaint
  date: 2025-10-01
  type: Filing
  title: Initial Complaint
  file: /cases/example-case/filings/2025-10-01_Filing_Complaint.pdf

- id: 2025-10-15-answer
  date: 2025-10-15
  type: Filing
  title: Defendant's Answer
  file: /cases/example-case/filings/2025-10-15_Filing_Answer.pdf

- id: 2025-11-01-motion
  date: 2025-11-01
  type: Motion
  title: Motion for Summary Judgment
  file: /cases/example-case/filings/2025-11-01_Motion_Summary-Judgment.pdf
```

By maintaining this chronological structure, the docket entries will display in the correct temporal sequence on the case page, making it easier for readers to follow the progression of the case.

## Workflows

### `.github/workflows/validate.yml`
- Runs on every push and PR
- Builds the Jekyll site
- Checks for broken links

### `.github/workflows/docket-intake.yml`
- Triggers on changes to `_inbox/` or `assets/uploads/`
- Normalizes PDF filenames
- Moves to correct case folder
- Updates docket YAML
- Creates PR for review

## Case Slug Mapping

The `_data/cases-map.yml` file maps docket numbers to case slugs:

```yaml
A-000313-25: a-000313-25
ATL-L-002794-25: atl-l-002794-25
ATL-22-002292: barber-nj-pcr-2022
```

This helps the intake automation route PDFs to the correct case folder.

### Auto-Bootstrap from Case Front Matter

If `_data/cases-map.yml` is missing or empty, the intake script will automatically generate it from case front matter. The bootstrap process:

1. **Scans all case files** in `_cases/` (including subdirectories with `index.md`)
2. **Extracts docket information** from:
   - `dockets:` array (inline or YAML list format)
   - `docket:` single field
   - `primary_docket:` field
3. **Extracts slugs** from `permalink:` field or uses directory name as fallback
4. **Writes the map** to `_data/cases-map.yml`

**Example**: If you have cases with these front matter fields:

```yaml
# _cases/a-000313-25/index.md
permalink: /cases/pcr-appeal-2024-union/
docket: A-000313-25

# _cases/barber-nj-pcr-2022/index.md
permalink: /cases/barber-nj-pcr-2022/
dockets:
  - ATL-22-002292
  - ATL-22-002313
```

### Manual Updates

You can manually add entries to `_data/cases-map.yml` for:
- Cases that haven't been created yet
- Special routing requirements
- Legacy docket numbers

The bootstrap process only runs when the map file is empty, so manual entries are preserved.

## Search Functionality

The case index at `/cases/` includes:

- Text search across title, docket numbers, and tags
- Filter by status (Active, Pending, Closed)
- Client-side filtering via `/cases.json`

## Naming Conventions

### PDFs
Pattern: `YYYY-MM-DD_Type_Description.pdf`

Example: `2025-11-12_Filing_Written-Appearance-ADA-MTD.pdf`

### Docket IDs
Pattern: `YYYY-MM-DD-kebab-case-description`

Example: `2025-11-12-written-appearance`

## Maintenance

### Adding a New Case

1. Create `_cases/<slug>/index.md` with proper front matter (including `dockets:` array)
2. Create `_data/docket/<slug>.yml` (can be empty initially)
3. (Optional) Add docket number mappings to `_data/cases-map.yml` - or let the bootstrap auto-generate it
4. Create folder: `cases/<slug>/filings/`

**Note**: If you include `dockets:` in your case front matter, the intake script will automatically add those mappings to `_data/cases-map.yml` if needed.

### Updating Docket Entries

Edit the corresponding `_data/docket/<slug>.yml` file directly, or use the upload form.

### Finding Orphaned PDFs

The intake script reports orphaned PDFs in `reports/docket-intake.json`.

## Troubleshooting

### Case pages show "No docket entries yet"
- Verify `_data/docket/<slug>.yml` exists
- Check that the slug in the file path matches the case's URL slug
- Ensure YAML is valid (no syntax errors)

### Search not working
- Check browser console for JavaScript errors
- Verify `/cases.json` is generating correctly
- Ensure `case-search.js` is loaded

### Upload form not working
- Check that Cloudflare Worker is deployed
- Verify worker URL in `docket-submit.js`
- Check browser console for CORS errors
- Ensure GitHub token has proper permissions

## Security Considerations

- GitHub token (for worker) only has `repo` scope
- Worker validates all inputs
- CORS restricts requests to faithfrontier.org
- All uploads go through PR review
- Never commit secrets to the repository

## Support

For issues or questions about the docket system, please open an issue on GitHub.
