# 🎯 QUICK START: ATL-L-003252-25 Batch Upload

**Your case inbox is ready. Here's how to use it.**

---

## ⚡ TL;DR - Fastest Method

```bash
# 1. Drop PDFs
cp ~/Downloads/*.pdf _inbox/atl-l-003252-25/

# 2. Push
git add _inbox/ && git commit -m "intake: ATL-L-003252-25" && git push

# 3. Merge PR when GitHub Actions completes
# Done! ✅
```

---

## 📍 Your Dedicated Inbox

```
_inbox/atl-l-003252-25/
```

This folder was created specifically for **ATL-L-003252-25** case documents.

---

## 🔄 What Happens Next

### **Step 1: You Drop Files**
```bash
cp ~/Downloads/*.pdf _inbox/atl-l-003252-25/
```

### **Step 2: You Commit**
```bash
git add _inbox/
git commit -m "intake: ATL-L-003252-25 batch upload"
git push
```

### **Step 3: GitHub Actions Runs**
Automatically:
- Detects `ATL-L-003252-25` from folder name or filename
- Moves PDFs to `cases/atl-l-003252-25/filings/`
- Renames: `YYYY-MM-DD_Type_description.pdf`
- Updates `_data/docket/atl-l-003252-25.yml`
- Creates pull request

### **Step 4: You Review & Merge**
- Check PR looks good
- Merge
- Documents now live on FaithFrontier.org ✅

---

## 📝 Windows PowerShell Example

```powershell
# Copy from Downloads
Copy-Item C:\Users\YourName\Downloads\*.pdf -Destination _inbox\atl-l-003252-25\

# Commit and push
git add _inbox\
git commit -m "intake: ATL-L-003252-25 batch"
git push
```

---

## 🎨 Filename Tips

### **Auto-Detected (Best)**
Include docket number anywhere in filename:
- `ATL-L-003252-25-motion.pdf`
- `order-ATL-L-003252-25.pdf`
- `2025-12-20-ATL-L-003252-25-brief.pdf`

### **Manual Folder** (Also Works)
Even without docket in filename, if you put it in `_inbox/atl-l-003252-25/`, it will route correctly:
- `motion-for-relief.pdf` → Routed to ATL-L-003252-25 ✅
- `certification.pdf` → Routed to ATL-L-003252-25 ✅

---

## 📊 Current Case Status

- **Inbox:** `_inbox/atl-l-003252-25/` ✅
- **Filings:** 36 PDFs in `cases/atl-l-003252-25/filings/`
- **Docket:** 37 entries in `_data/docket/atl-l-003252-25.yml`
- **Status:** Active
- **Last Court Action:** Order to Show Cause GRANTED (2025-12-16)

---

## 🛠️ All Available Tools

| Script | Purpose | Command |
|--------|---------|---------|
| **Docket Intake** | Process PDFs from inbox | `node scripts/docket-intake.js` |
| **Create Inboxes** | Set up new case inboxes | `node scripts/create-case-inboxes.js` |
| **Validate Integrity** | Check for issues | `node scripts/validate-case-integrity.js atl-l-003252-25` |
| **Batch Helper** | Validate before upload | `node scripts/batch-pdf-intake.js` |

---

## 📚 Full Documentation

- **CASE-INBOX-SYSTEM-COMPLETE.md** - Complete system guide
- **ATL-L-003252-25-STATUS-REPORT.md** - Your case's status report
- **BATCH-UPLOAD-QUICKSTART.md** - Detailed batch upload guide
- **DOCKET-SYSTEM.md** - Full docket system docs

---

## ❓ Troubleshooting

**Q: Files not processing?**
- Ensure you pushed to GitHub (`git push`)
- Check GitHub Actions tab for workflow status
- Verify filename or folder indicates `ATL-L-003252-25`

**Q: Files went to wrong case?**
- Use the dedicated folder: `_inbox/atl-l-003252-25/`
- Or include `ATL-L-003252-25` in every filename

**Q: Need to add files manually?**
- Copy directly to `cases/atl-l-003252-25/filings/`
- Edit `_data/docket/atl-l-003252-25.yml`
- Commit and push

---

## ✅ System Health Check

```bash
# Verify inbox exists
ls _inbox/atl-l-003252-25/

# Check case structure
node scripts/validate-case-integrity.js atl-l-003252-25

# See what's staged
git status
```

---

**Built:** 2025-12-28  
**Case:** ATL-L-003252-25  
**Status:** ✅ READY FOR BATCH UPLOADS  
**Steward:** Devon Tyler Barber

---

## 🚀 Ready to Go!

Your systematic, repeatable, righteous document intake system is live.

**No more manual work. No more recreating folders.**

Drop files → Push → Merge → Published. 🎯
