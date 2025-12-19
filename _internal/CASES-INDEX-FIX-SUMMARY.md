# Cases Index Fix Summary

**Date:** December 19, 2025  
**Issue:** Conflicting permalinks preventing new enhanced cases index from working properly  
**Status:** ✅ RESOLVED

## Problem Identified

Two separate files were configured with the same permalink `/cases/`:

1. **`_pages/cases.md`** - Original simple cases listing (71 lines)
   - Basic search functionality
   - Simple case cards
   - Minimal styling

2. **`cases/index.md`** - New enhanced cases index (476 lines)
   - Advanced filtering (search + status + court)
   - Enhanced case cards with tags and color-coding
   - Statistics dashboard
   - Government partnership messaging
   - Mobile-responsive design

Jekyll's permalink system cannot handle two pages with identical permalinks. Typically, the `_pages` collection takes precedence, meaning the old simple version would be rendered instead of the new enhanced version.

## Solution Implemented

Modified `_pages/cases.md` to:
1. Change permalink from `/cases/` to `/cases-legacy/`
2. Change title from "Case Records" to "Case Records (Legacy)"
3. Add `published: false` to prevent it from being built

This ensures:
- ✅ No permalink conflicts
- ✅ New enhanced version at `/cases/` becomes the primary page
- ✅ Old version preserved as backup (unpublished) at `/cases-legacy/`

## How Cases Data Flows

### Jekyll Collection Structure

```
_cases/                          ← Jekyll collection (markdown files)
  ├── a-000313-25/
  │   └── index.md              ← Case metadata + front matter
  ├── atl-l-002794-25/
  │   └── index.md
  └── ...

cases/                           ← Asset directory + index page
  ├── a-000313-25/
  │   └── filings/              ← PDF documents
  │       ├── 2024-10-29_Filing_Notice-of-Appeal.pdf
  │       └── ...
  ├── atl-l-002794-25/
  │   └── filings/
  └── index.md                  ← **Cases index page (NEW)**
```

### Data Access in Liquid Templates

The `cases/index.md` page uses:

```liquid
{% assign cases = site.cases | sort: "filed_date" | reverse %}
{% for case in cases %}
  <!-- Render each case -->
{% endfor %}
```

- `site.cases` - References the `_cases` collection defined in `_config.yml`
- Each case in `_cases/[slug]/index.md` becomes accessible via this collection
- Front matter fields (title, court, status, filed_date, etc.) are available as `case.field_name`

### Permalink Configuration

From `_config.yml`:

```yaml
collections:
  cases:
    output: true
    permalink: /cases/:path/
```

This means:
- `_cases/a-000313-25/index.md` → `/cases/a-000313-25/`
- `_cases/atl-l-002794-25/index.md` → `/cases/atl-l-002794-25/`
- `cases/index.md` with `permalink: /cases/` → `/cases/` (index page)

## Features of Enhanced Index

### 1. Hero Section with Live Statistics
- Total cases count (dynamically calculated)
- Active cases count
- Pending cases count
- 100% transparency badge

### 2. Advanced Filtering System
- **Search bar** - Full-text search across title, docket, court, overview, tags
- **Status filter** - Filter by active/pending/closed
- **Court filter** - Filter by Superior/Appellate/Federal courts

### 3. Enhanced Case Cards
- Color-coded status badges (green=active, brass=pending, gray=closed)
- Court, docket, status, filed date metadata
- Tags display (civil, federal, pcr, etc.)
- Full overview text
- Hover effects and smooth transitions

### 4. Strategic Messaging
- "Why This Archive Matters" section for three audiences:
  - Government Partners (procedural competence)
  - Community Members (civics education)
  - Future Stewards (transparency demonstration)
- CTAs linking to stewardship pathway and partnerships

### 5. JavaScript Filtering
- Real-time filtering without page reload
- No-results message when filters eliminate all cases
- Mobile-responsive design

## Testing Checklist

Once Jekyll build issues are resolved:

- [ ] Visit `http://localhost:4000/cases/` and verify page loads
- [ ] Verify all 8 cases appear in the list
- [ ] Test search functionality (search for "federal", "atlantic", etc.)
- [ ] Test status filter (select "Active", "Pending", "Closed")
- [ ] Test court filter (select "NJ Superior Court", "Appellate", "Federal")
- [ ] Verify statistics show correct counts
- [ ] Click case links and verify they navigate to individual case pages
- [ ] Test on mobile viewport (responsive design)
- [ ] Verify no console errors in browser dev tools

## Case Data Verification

All cases in `_cases/` should have these required fields:

```yaml
---
layout: case
title: "Full Case Title"
short_title: "Short Title"
court: "Court Name"
status: active|pending|closed
filed_date: YYYY-MM-DD
primary_docket: "DOCKET-NUMBER"
permalink: /cases/case-slug/
---
```

Current cases (verified):
1. ✅ a-000313-25 (Appellate, active)
2. ✅ atl-dc-007956-25 (Special Civil, active)
3. ✅ atl-l-002794-25 (Law Division, active)
4. ✅ atl-l-002869-25 (status to verify)
5. ✅ atl-l-003252-25 (status to verify)
6. ✅ barber-nj-pcr-2022 (PCR, pending)
7. ✅ usdj-1-22-cv-06206 (Federal, pending)
8. ✅ usdj-1-25-cv-15641 (Federal, active)

## Next Steps

1. **Resolve YAML merge conflicts** in `_data/docket/*.yml` files
   - Run `node scripts/resolve-docket-conflicts.js`
   - This is blocking the Jekyll build

2. **Test Jekyll build**
   ```bash
   bundle exec jekyll build --trace
   ```

3. **Preview site locally**
   ```bash
   bundle exec jekyll serve
   ```
   Visit `http://localhost:4000/cases/`

4. **Verify filtering works**
   - Open browser console
   - Test all three filter controls
   - Verify no JavaScript errors

5. **Mobile testing**
   - Open dev tools mobile emulation
   - Verify responsive layout
   - Test touch interactions

## Related Files

- `/workspaces/FaithFrontier/cases/index.md` - New enhanced cases index (PRIMARY)
- `/workspaces/FaithFrontier/_pages/cases.md` - Old simple listing (UNPUBLISHED)
- `/workspaces/FaithFrontier/_config.yml` - Jekyll configuration
- `/workspaces/FaithFrontier/_cases/*/index.md` - Individual case files (8 total)
- `/workspaces/FaithFrontier/_data/docket/*.yml` - Docket data (needs conflict resolution)

## Success Criteria

✅ No permalink conflicts  
✅ Enhanced index is the primary `/cases/` page  
✅ Old version preserved but unpublished  
⏳ Jekyll build succeeds (pending YAML conflict resolution)  
⏳ All 8 cases display correctly  
⏳ All filtering features work  
⏳ Mobile responsive layout works  

---

**Resolution:** Permalink conflict resolved by changing old page to `/cases-legacy/` and setting `published: false`. New enhanced index at `/cases/` will properly ingest all case data from `_cases` collection once Jekyll build succeeds.
