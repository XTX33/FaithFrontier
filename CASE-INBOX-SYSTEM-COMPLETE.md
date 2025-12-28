# Case Inbox System - Complete Setup

✅ **System Status: READY**

---

## 📍 What Was Created

### 1. **Main Inbox Directory** (`_inbox/`)
Central staging area for all PDF uploads.

### 2. **Per-Case Inbox Folders**
```
_inbox/
├── atl-l-003252-25/       ← Your case
├── a-000313-25/
├── atl-dc-007956-25/
├── atl-l-002794-25/
├── atl-l-002869-25/
├── barber-nj-pcr-2022/
├── pcr-appeal-2024-union/
├── usdj-1-22-cv-06206/
└── usdj-1-25-cv-15641/
```

### 3. **Automation Scripts**
- **`scripts/create-case-inboxes.js`** - Creates inbox folders for all cases
- **`scripts/validate-case-integrity.js`** - Validates docket/file consistency
- **`scripts/docket-intake.js`** - Main automation (already existed)

### 4. **Fixed Issues**
- ✅ Removed duplicate entries from `_data/docket/atl-l-003252-25.yml`
- ✅ Fixed file paths to use absolute format: `/cases/atl-l-003252-25/filings/<file>.pdf`

---

## 🚀 How to Use for ATL-L-003252-25

### **Quick Method (Recommended)**

```bash
# 1. Drop PDFs in your case inbox
cp ~/Downloads/*.pdf _inbox/atl-l-003252-25/

# 2. Commit and push
git add _inbox/
git commit -m "intake: ATL-L-003252-25 batch upload"
git push
```

### **Alternative: Direct to Main Inbox**
Include docket number in filename:
```bash
# Files with ATL-L-003252-25 in name will auto-route
cp ~/Downloads/ATL-L-003252-25-motion.pdf _inbox/
git add _inbox/ && git commit -m "intake: batch" && git push
```

---

## 🔄 Automation Workflow

1. **You drop PDFs** → `_inbox/` or `_inbox/atl-l-003252-25/`
2. **You commit/push** to GitHub
3. **GitHub Actions runs** `scripts/docket-intake.js`
4. **Script processes:**
   - Detects docket numbers from filenames
   - Routes to `cases/atl-l-003252-25/filings/`
   - Renames: `YYYY-MM-DD_Type_description.pdf`
   - Updates `_data/docket/atl-l-003252-25.yml`
   - Cleans up `_inbox/`
5. **PR created** for your review
6. **You merge** → Published!

---

## 📋 Current Status: ATL-L-003252-25

| Metric | Count |
|--------|-------|
| **PDF Files** | 36 files in `cases/atl-l-003252-25/filings/` |
| **Docket Entries** | 36 entries in `_data/docket/atl-l-003252-25.yml` |
| **Case Status** | ✅ Active, properly configured |
| **Inbox** | ✅ Ready at `_inbox/atl-l-003252-25/` |

---

## 🛠️ Maintenance Scripts

### **Create New Case Inboxes**
When you add new cases to `_data/cases-map.yml`:
```bash
node scripts/create-case-inboxes.js
```

### **Validate Case Integrity**
Check for missing files, duplicates, orphans:
```bash
# Single case
node scripts/validate-case-integrity.js atl-l-003252-25

# All cases
node scripts/validate-case-integrity.js
```

### **Manual Intake (if needed)**
Process PDFs without committing to GitHub:
```bash
node scripts/docket-intake.js
```

---

## 📝 Filename Best Practices

### ✅ **Good Filenames** (Auto-detected)
```
ATL-L-003252-25-motion-for-relief.pdf
2025-12-20-ATL-L-003252-25-certification.pdf
order-granting-motion-ATL-L-003252-25.pdf
```

### ✅ **Excellent Filenames** (Full metadata)
```
2025-12-27_Motion_motion-for-relief.pdf
2025-12-20_Order_order-granting-motion.pdf
2025-12-15_Certification_supplemental-certification.pdf
```

### ⚠️ **Acceptable** (Will work but require manual review)
```
document.pdf         → Goes to cases/unassigned/filings/
random-filing.pdf    → Needs manual routing
```

---

## 🗺️ Supported Docket Formats

The intake system automatically recognizes:
- `ATL-L-003252-25` ← Your case
- `ATL-DC-007956-25` (Special Civil)
- `ATL-22-002292` (Legacy format)
- `A-000313-25` (Appellate Division)
- `1:25-cv-15641-RMB-MJS` (Federal District)

---

## 📚 Related Documentation

| Document | Purpose |
|----------|---------|
| **BATCH-UPLOAD-QUICKSTART.md** | Quick reference for batch uploads |
| **DOCKET-SYSTEM.md** | Complete docket management system |
| **_inbox/README.md** | Inbox usage instructions |
| **scripts/docket-intake.js** | Main automation script |

---

## ✅ What's Righteous About This Setup

### **1. Systematic & Scalable**
Every case gets its own inbox. No more recreating directories.

### **2. Automated Integrity**
- Validation scripts catch duplicates, missing files, orphans
- Automated PR review ensures no mistakes slip through

### **3. Git-Based Workflow**
- Full version control of all filings
- Audit trail of when documents were added
- Can revert mistakes easily

### **4. Low Friction**
- Drop files → commit → push → merge
- No manual YAML editing
- No manual file renaming

### **5. Self-Documenting**
- Standardized filenames
- Chronological docket entries
- Clear paper trail

---

## 🎯 Next Steps for You

### **Immediate Use:**
```bash
# Add new PDFs for ATL-L-003252-25
cp ~/Downloads/*.pdf _inbox/atl-l-003252-25/
git add _inbox/
git commit -m "intake: ATL-L-003252-25 new filings"
git push

# Wait for GitHub Actions
# Review and merge PR
# Done!
```

### **For New Cases:**
1. Create case in `_cases/<slug>/index.md`
2. Add to `_data/cases-map.yml`
3. Run: `node scripts/create-case-inboxes.js`
4. Use `_inbox/<slug>/` for uploads

---

## 🛡️ Integrity Guarantees

✅ **Docket YAML validated** - No duplicates, proper structure  
✅ **File paths corrected** - Absolute `/cases/<slug>/filings/` format  
✅ **PDFs preserved** - All 36 files safe in filings folder  
✅ **Chronological order** - Entries sorted by date  
✅ **No orphans** - All PDFs tracked in docket YAML  

---

## Questions?

All automation scripts have `--help`:
```bash
node scripts/docket-intake.js --help
node scripts/validate-case-integrity.js --help
```

---

**Built:** 2025-12-28  
**Status:** ✅ Production Ready  
**Case:** ATL-L-003252-25 (and all others)  
**Steward:** Devon Tyler Barber
