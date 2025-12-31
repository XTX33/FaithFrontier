---
layout: case-enhanced
published: true
title: Full Case Title — Court Name
short_title: Short Case Name
slug: kebab-case-slug
permalink: /cases/kebab-case-slug/

court: Court Name (e.g., Superior Court of New Jersey, Law Division)
venue: County / Vicinage (if applicable)
case_type: Civil | Criminal | PCR | Declaratory Judgment | OPRA | Other
forum_level: Trial Court | Appellate Division | Federal District Court | Federal Court of Appeals
role: Plaintiff | Defendant | Petitioner | Respondent | Appellant | Appellee | Movant

dockets:
  - DOCKET-NUMBER-1
  - DOCKET-NUMBER-2
primary_docket: DOCKET-NUMBER-1

status: active | pending | stayed | closed
filed_date: YYYY-MM-DD
last_updated: YYYY-MM-DD
judge: null

tags:
  - category1
  - category2

# Public-facing assets location (served by the site).
# Keep private working materials out of /assets.
assets_dir: /cases/kebab-case-slug/filings/

# Optional: authoritative external locator (DO NOT use for private/unpublished sources)
source_url: https://example.com/source
received_via: Official court filing | Clerk portal | Certified mail | Other
provenance_note: >
  Short note describing where the public documents came from and any limits
  (e.g., "Redacted copies posted; unredacted retained offline.").

# Short, indexable overview. Keep neutral; put "meat" in body sections.
overview: >
  One- to three-sentence neutral description of the matter and procedural posture.
  Avoid conclusory phrasing. Avoid arguing merits in metadata.

# Optional structured elements used by the enhanced layout
timeline:
  - date: YYYY-MM-DD
    event: Brief, neutral description of a key procedural event
    ref: /cases/kebab-case-slug/filings/YYYY-MM-DD_Filing_Name.pdf
  - date: YYYY-MM-DD
    event: Another key event
    ref: null

next_steps:
  - Brief description of upcoming action (if known)
  - Another anticipated step

related_cases:
  - title: Related Case Name
    url: /cases/related-case-slug/
    relationship: Appeal from | Related proceeding | Parallel matter | Consolidated with

# IMPORTANT: do not list documents in front matter.
# Use the body "Filings / Docket Log" section instead to keep one source of truth.
case_slug: kebab-case-slug
---
## Overview

[Brief introductory paragraph. This appears near the top. Keep it factual and neutral.]

## Procedural Posture

[State where the case currently sits (court, track, posture, what is pending).
Avoid argument; cite to orders/filings where possible.]

## Procedural History (Chronology)

[Bullet list or short paragraphs summarizing key docket events in date order.
Link to filings in `assets_dir` as appropriate.]

## Factual Background

[Neutral, chronological summary of underlying events. Avoid subjective characterizations.
If facts are disputed, say so and attribute: "According to the complaint..." / "According to the record asserted by...".]

## Relief Sought

[Describe requested relief at a high level (damages, declaratory, injunctive/equitable).
Keep it descriptive, not persuasive.]

## Filings and Orders

[This is the authoritative list of linked PDFs and orders.
Organize by date, label, and a short neutral note.]

## Faith Frontier Connection

[Explain why this is being documented here: transparency, due process, public record indexing.
Keep modest and compliance-forward.]

## Notes

[Optional: redaction notes, access issues, corrections policy, how updates are handled.]
