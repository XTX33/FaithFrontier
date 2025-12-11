# FaithFrontier — A Public Trust for Justice, Faith, & Civic Integrity  
### Repository for **faithfrontier.org**  
**© 2025 Faith Frontier Ecclesiastical Trust & Devon Tyler Barber. All rights reserved.**

FaithFrontier is a faith-guided public trust dedicated to integrity, transparency, and civic accountability.  
This repository contains the source code powering the website, along with structured case records, essays, and civic educational material.

---

## ⚖️ Intellectual Property & Content Protection

This repository contains **two categories of material**:

### **1. Source Code — MIT Licensed (open use)**
All source code is open for learning, adaptation, and reuse under `/LICENSE`.

### **2. Content — Restricted (NOT open-source)**
All original essays, case summaries, analyses, theological writings, metadata structures, branding, and narrative content are protected under the **FaithFrontier Ecclesiastical Content License** (`/CONTENT_LICENSE.md`).

You may not reproduce, redistribute, sell, or create derivative works of the protected content.

---

## 📁 Repository Structure

```

├── _cases/              # Case summaries, metadata (Markdown only)
├── assets/cases/        # PDFs and exhibits for public cases
├── _essays/             # Theological, civic, and analytical writings
├── _layouts/            # Jekyll layouts
├── _includes/           # Reusable template components
├── assets/css/          # Stylesheets
├── assets/js/           # Scripts
├── assets/images/       # Logos, diagrams, graphics
└── _config.yml          # Site configuration

````

---

## 🛠 Development

```bash
bundle install
bundle exec jekyll serve
# Visit http://localhost:4000
````

Production build:

```bash
JEKYLL_ENV=production bundle exec jekyll build
```

---

## 🌐 Deployment (GitHub Pages)

* Automatic deployment from `main`
* Domain: **faithfrontier.org**
* DNS:

  * CNAME → `xtx33.github.io`
  * Optional A-records for GitHub Pages

Repo Settings → Pages → Deploy from Branch → **main**.

---

## 🤖 AI-Assisted Case Analysis (Optional)

The repo includes optional analysis tools using OpenAI APIs.
See:

* `QUICKSTART-GENERATE-ANALYSIS.md`
* `ANALYSIS-SYSTEM.md`
* `.github/SETUP-OPENAI.md`

---

## ⚠️ Legal Disclaimer

See `/DISCLAIMER.md` for the complete statement.

Nothing in this repository constitutes legal advice.

---

## 🤝 Contributions

Code contributions are welcome.

Content changes are restricted to preserve accuracy, trust, and institutional integrity.

Questions or permissions:
**[info@tillerstead.com](mailto:info@tillerstead.com)**

---

````

---

# ✅ **2. LICENSE (MIT License for Code Only)**

```markdown
MIT License

Copyright (c) 2025 
Devon Tyler Barber / Faith Frontier Ecclesiastical Trust  

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

(…standard MIT text unchanged…)

For inquiries regarding licensing, permissions, or commercial use, contact:  
**info@tillerstead.com**
````

---
