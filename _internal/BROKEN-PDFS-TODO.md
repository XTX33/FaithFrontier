---
title: Broken PDFs Todo
---

# PDF Content To-Do (Placeholder / Suspect PDFs)

This is a content-tracking checklist for PDFs that appear to be placeholders (very small byte size) and should be replaced with the real filed documents.

Note: many older references used legacy paths that no longer exist. The site now primarily serves filings from:

- `cases/<slug>/filings/`

## Highest Priority (2-byte placeholders)

- `cases/atl-dc-007956-25/filings/2025-09-03_Answer-FirstAppearance.pdf`
- `cases/a-000313-25/filings/20251026-njsc-atl-22-002292-barber-petition-for-postconvictionrelief-with-certification-and-memorandum.pdf`

## Low-size PDFs (verify content; may still be placeholders)

- `cases/atl-l-002794-25/filings/20251003-verified-complaint-and-cis.pdf`
- `cases/atl-l-002794-25/filings/20251016-motion-track-change.pdf`
- `cases/atl-l-002794-25/filings/20251028-njsc-atl-l-002794-25-barber-firstamendedcomplaint-with-exhibits.pdf`
- `cases/atl-l-002794-25/filings/20251028-njsc-atl-l-002794-25-barber-pcr-insupport-of-motiontochangetrack.pdf`
- `cases/a-000313-25/filings/20251029-notice-of-appeal.pdf`
- `cases/atl-dc-007956-25/filings/20250903-answer-firstappearance.pdf`

## Action Required

Replace these placeholder/suspect files with the actual PDFs. After replacement, re-run:

- `npm run check:pdfs`
- `npm run check:pdf-health`

## How to Upload

1. Obtain the actual PDF files
2. Replace the placeholder files in the respective directories
3. Commit and push the changes
4. Verify the links work on the published site

**Note:** Until these files are uploaded, the links to these documents will result in broken/corrupted PDF downloads.
