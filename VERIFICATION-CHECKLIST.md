# Verification Checklist - FaithFrontier Fixes

This checklist can be used to verify all fixes have been properly applied.

## ✅ Completed Fixes

### 1. Naming Issues Fixed
- [ ] Verify no .pdf.pdf files exist: `find cases -name "*.pdf.pdf" | wc -l` should return 0
- [ ] Verify renamed files exist: Check `cases/atl-l-002794-25/` for 9 corrected files
- [ ] All filenames now end with single `.pdf` extension

**Expected Result:** 0 files with .pdf.pdf extension

### 2. File References Fixed  
- [ ] Run link checker: All file references should resolve to actual files
- [ ] Check YAML validity: `python3 -c "import yaml; ..." ` on all _cases/*.md files
- [ ] Verify 75/76 references are valid (1 is future placeholder)

**Expected Result:** 0 broken references (excluding documented placeholders)

### 3. Duplicate Cases Consolidated
- [ ] Verify `_cases/a-000313-25.md` does NOT exist
- [ ] Verify `_cases/atl-24-001934-street-crossing.md` exists and contains:
  - Both dockets (ATL-24-001934 and A-000313-25)
  - Filings from Law Division and Appellate Division
  - redirect_from URLs for old links
- [ ] Check case count: Should be 7 files (not 8)

**Expected Result:** 7 case files total, unified record contains both dockets

### 4. OpenAI Analysis Sections Added
- [ ] Verify all 7 case files contain "AI-Powered Case Analysis" section
- [ ] Each section includes:
  - Judicial Oversight Analysis placeholder
  - Journalistic Commentary placeholder
  - Jekyll liquid template with site.data.analysis
  - Correct slug reference
- [ ] Files checked:
  - atl-24-001934-street-crossing.md ✓
  - barber-nj-pcr-2022.md ✓
  - a-000308-25.md ✓
  - atl-l-002794-25.md ✓
  - atl-dc-007956-25.md ✓
  - usdj-1-22-cv-06206.md ✓
  - usdj-1-25-cv-15641.md ✓

**Expected Result:** All 7 files have analysis sections ready for automation

### 5. Broken PDFs Documented
- [ ] Verify `BROKEN-PDFS-TODO.md` exists
- [ ] File lists all 8 placeholder PDFs
- [ ] Count 2-byte PDFs: `find cases -name "*.pdf" -size 2c | wc -l` should return 8

**Expected Result:** Documentation exists, 8 placeholder files identified

### 6. Documentation Created
- [ ] `BROKEN-PDFS-TODO.md` exists with 8 PDFs listed
- [ ] `FIXES-SUMMARY.md` exists with comprehensive summary
- [ ] `VERIFICATION-CHECKLIST.md` exists (this file)

**Expected Result:** 3 documentation files present

## Commands to Run

```bash
# 1. Check for .pdf.pdf files
find cases -name "*.pdf.pdf" | wc -l
# Expected: 0

# 2. Count case files
ls -1 _cases/*.md | grep -v TEMPLATE | wc -l
# Expected: 7

# 3. Count placeholder PDFs
find cases -name "*.pdf" -size 2c | wc -l
# Expected: 8

# 4. Verify YAML validity
python3 << 'EOFPYTHON'
import yaml, glob
errors = 0
for f in glob.glob('_cases/*.md'):
    if 'TEMPLATE' not in f:
        try:
            content = open(f).read()
            parts = content.split('---', 2)
            if len(parts) >= 3:
                yaml.safe_load(parts[1])
                print(f"✓ {f}")
        except Exception as e:
            print(f"✗ {f}: {e}")
            errors += 1
print(f"\nTotal errors: {errors}")
EOFPYTHON
# Expected: 0 errors

# 5. Check for OpenAI sections
grep -l "AI-Powered Case Analysis" _cases/*.md | wc -l
# Expected: 7

# 6. Verify git status clean
git status
# Expected: "nothing to commit, working tree clean"
```

## Manual Verification Steps

### Test Site Build (requires Jekyll)
```bash
bundle install
bundle exec jekyll build
bundle exec jekyll serve
# Visit http://localhost:4000
```

### Test Redirects
After deployment, verify these redirects work:
- `/cases/a-000313-25/` → `/cases/street-crossing-pcr-appeal/`
- `/cases/atl-24-001934/` → `/cases/street-crossing-pcr-appeal/`

### Test File Links
Click through each case page and verify:
- All PDF links download files (or show 2-byte placeholder for documented cases)
- No 404 errors
- No broken links

## Next Actions

Once verification passes:

1. **Upload Real PDFs**
   - Replace 8 placeholder PDFs with actual documents
   - See BROKEN-PDFS-TODO.md for complete list

2. **Generate AI Analysis**
   - Run: `node scripts/analyze-cases.js`
   - Verify analysis appears in case pages

3. **Deploy to Production**
   - Merge PR to main branch
   - Verify GitHub Pages build succeeds
   - Test live site at faithfrontier.org

---

## Sign-off

- [ ] All automated checks pass
- [ ] Manual verification complete
- [ ] Documentation reviewed
- [ ] Ready for deployment

**Verified by:** _______________  
**Date:** _______________
