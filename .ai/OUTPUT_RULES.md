# OUTPUT_RULES.md - Technical & Format Standards

**Authority:** Subordinate to SYSTEM.md  
**Scope:** File formats, naming, structure, and technical conventions  
**Version:** 1.0.0  
**Last Updated:** 2025-12-20

---

## INHERITANCE

This file inherits all constraints from:
→ **/.ai/SYSTEM.md**  
→ **/.ai/STYLE.md**  
→ **/.ai/DOMAIN.md**  
→ **/.ai/COMPLIANCE.md**

Technical rules implement broader requirements.

---

## FILE FORMATS

### Primary Format: Markdown

All documentation must use:
- **Extension:** `.md`
- **Encoding:** UTF-8 without BOM
- **Line Endings:** LF (`\n`) not CRLF (`\r\n`)
- **Indentation:** 2 spaces (not tabs)

### Markdown Dialect

Use **GitHub Flavored Markdown (GFM)**:
- Fenced code blocks (` ``` `)
- Tables
- Task lists
- Autolinked URLs
- Strikethrough (`~~text~~`)

**Not supported** (avoid):
- Footnotes (use inline citations)
- Definition lists (use bold terms)
- Table of contents (manually create if needed)

### Exceptions

Non-Markdown formats permitted for:
- **YAML:** Configuration and data files (`.yml`, `.yaml`)
- **JSON:** Structured data exports (`.json`)
- **HTML:** Jekyll layouts and includes (`.html`)
- **CSS:** Stylesheets (`.css`)
- **JavaScript:** Client-side code (`.js`)
- **Ruby:** Jekyll plugins (`.rb`)

---

## FILE NAMING CONVENTIONS

### General Rules

All filenames must:
- Use **lowercase** letters
- Use **hyphens** (`-`) for word separation, not underscores or spaces
- Be **descriptive** (no generic names like `document.md`)
- Include **file extension**
- Avoid special characters except hyphen, underscore, and period

### Specific Patterns

**Blog posts:**
```text
YYYY-MM-DD-slug.md
Example: 2025-12-20-ai-governance-structure.md
```

**Case files:**
```text
slug.md (where slug matches docket)
Example: barber-nj-pcr-2022.md
```

**Essays:**
```text
YYYY-MM-DD-title.md
Example: 2025-12-03-biography.md
```

**Documentation:**
```text
DESCRIPTIVE-NAME.md (ALL-CAPS for prominence)
Example: DOCKET-SYSTEM.md, README.md
```

**Docket data:**
```text
slug.yml (matches case slug)
Example: barber-nj-pcr-2022.yml
```

**PDF filings:**
```text
{YYYY-MM-DD}_{TYPE}_{SHORT-DESCRIPTION}.pdf
Example: 2025-11-12_Filing_Written-Appearance-ADA-MTD.pdf
```

---

## DIRECTORY STRUCTURE

### Repository Layout

```text
/
├─ .ai/                   # AI governance (this directory)
├─ .github/               # GitHub Actions, Copilot pointers
├─ _cases/                # Legal case records
├─ _data/                 # Structured data
│  ├─ docket/             # Docket YAML files
│  └─ analysis/           # AI-generated analysis
├─ _docs/                 # Public documentation
├─ _essays/               # Commentary and analysis
├─ _includes/             # Jekyll HTML partials
├─ _internal/             # Internal working docs
├─ _layouts/              # Jekyll page templates
├─ _posts/                # Blog posts
├─ assets/                # CSS, JS, images
│  ├─ css/
│  ├─ js/
│  └─ images/
├─ cases/                 # Case-specific files
│  └─ {slug}/
│     ├─ filings/         # Court documents (PDFs)
│     ├─ notes/           # Research notes
│     └─ evidence/        # Supporting evidence
├─ scripts/               # Automation tools
└─ tests/                 # Test fixtures
```

### Directory Purposes

| Directory | Purpose | Committed? |
|-----------|---------|------------|
| `.ai/` | AI instructions | ✅ Yes |
| `.github/` | GitHub configs | ✅ Yes |
| `_cases/` | Case Markdown | ✅ Yes |
| `_data/` | Structured data | ✅ Yes |
| `_docs/` | Public docs | ✅ Yes |
| `_essays/` | Essays | ✅ Yes |
| `_internal/` | Working docs | ✅ Yes |
| `_site/` | Jekyll build | ❌ No (gitignored) |
| `node_modules/` | Dependencies | ❌ No (gitignored) |
| `.env` | Secrets | ❌ No (gitignored) |
| `_inbox/` | Staging area | ❌ No (gitignored) |

---

## YAML FRONT MATTER

### Required Fields (Cases)

```yaml
---
layout: case-enhanced
title: "Full Case Title"
short_title: "Abbreviated Title"
docket: "A-000123-25"  # or use 'dockets: []' for multiple
court: "NJ Superior Court, Law Division, Atlantic County"
case_type: "Civil Rights"
status: active  # or pending, closed
filed_date: 2025-01-15
role: pro-se-plaintiff  # or attorney, defendant, etc.
---
```

### Required Fields (Essays)

```yaml
---
layout: essay
title: "Essay Title"
permalink: /faith/essay-slug/
date: 2025-12-20
tags: [tag1, tag2, tag3]
excerpt: "Brief summary for listings"
---
```

### Required Fields (Posts)

```yaml
---
layout: post
title: "Post Title"
date: 2025-12-20
categories: [category1, category2]
---
```

### Optional Fields

```yaml
author: "Author Name"
updated_date: 2025-12-21
status: draft  # or published
published: false  # hide from listings
---
```

---

## MARKDOWN STRUCTURE

### Document Template

```markdown
# Title (H1 - One per document)

**Metadata** (optional)  
**Version:** X.Y.Z  
**Last Updated:** YYYY-MM-DD

---

## Introduction (H2)

Opening paragraph explaining purpose.

## Section 1 (H2)

### Subsection 1.1 (H3)

Content with examples.

### Subsection 1.2 (H3)

More content.

## Section 2 (H2)

Continue...

---

## Conclusion (H2)

Summary or next steps.

**END - FILENAME**
```

### Heading Rules

- **H1 (`#`):** Title only (one per document)
- **H2 (`##`):** Major sections
- **H3 (`###`):** Subsections
- **H4 (`####`):** Detail level (use sparingly)
- **Never skip levels** (no H1 → H3)

---

## CODE CONVENTIONS

### Inline Code

Use backticks for:
- File names: `README.md`
- Commands: `npm install`
- Variable names: `apiKey`
- Short code: `const result = true;`

### Code Blocks

Use fenced blocks with language:

````markdown
```bash
npm install
bundle exec jekyll serve
```

```javascript
const config = {
  site: 'faithfrontier.org',
  env: 'production'
};
```

```yaml
---
title: Example
status: active
---
```
````

### Language Identifiers

Common identifiers:
- `bash` - Shell scripts
- `javascript` or `js` - JavaScript
- `ruby` - Ruby code
- `yaml` - YAML data
- `json` - JSON data
- `html` - HTML markup
- `css` - Stylesheets
- `markdown` or `md` - Markdown examples
- `text` - Plain text
- (no identifier) - Generic code

---

## LINK CONVENTIONS

### Internal Links

**Relative paths** (preferred):
```markdown
[Other Document](path/to/file.md)
[Cases](/cases/)
[Specific Case](/cases/case-slug/)
```

**Absolute paths** (when needed):
```markdown
[Root README](/README.md)
```

### External Links

```markdown
[Link Text](https://example.com)
```

**Always use HTTPS** when available.

### Link Text

Make link text **descriptive**:
- ✅ "[See the docket system documentation](DOCKET-SYSTEM.md)"
- ❌ "Click [here](DOCKET-SYSTEM.md) for docket docs"

### Reference-Style Links

For repeated URLs:
```markdown
[First reference][ref]
[Second reference][ref]

[ref]: https://example.com
```

---

## IMAGE CONVENTIONS

### Image Files

Store in:
```text
assets/images/{category}/filename.png
```

Naming:
```text
{descriptive-name}-{size}.{ext}
Example: logo-faith-frontier-512.png
```

### Image Inclusion

```markdown
![Descriptive alt text](path/to/image.png)
```

**Always provide meaningful alt text** for accessibility.

### Image Formats

- **PNG:** Logos, diagrams, screenshots
- **JPEG:** Photos
- **SVG:** Scalable graphics (preferred for logos)
- **WebP:** Modern format (if supported)

---

## TABLE CONVENTIONS

### Simple Tables

```markdown
| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
```

### Alignment

```markdown
| Left | Center | Right |
|:-----|:------:|------:|
| L1   | C1     | R1    |
```

### Complex Data

For complex tables:
- Consider splitting into multiple simple tables
- Use lists instead when appropriate
- Link to CSV or JSON data files if very large

---

## COMMENTS & ANNOTATIONS

### Markdown Comments

Use HTML comments (invisible in rendered output):
```html
<!-- This is a comment -->
```

### Jekyll/Liquid Comments

In Jekyll templates:
```liquid
{%- comment -%}
This is a Liquid comment
Useful for documenting template logic
{%- endcomment -%}
```

### Code Comments

In code blocks, use language-appropriate syntax:
```javascript
// Single-line comment
/* Multi-line
   comment */
```

---

## GIT CONVENTIONS

### Commit Messages

Format:
```text
type(scope): subject

body (optional)

footer (optional)
```

Types:
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation changes
- `style` - Formatting (not code style)
- `refactor` - Code restructuring
- `test` - Test additions
- `chore` - Maintenance tasks

Examples:
```text
feat(cases): add smart resource detection

docs(ai): create centralized governance structure

fix(workflow): handle missing API key gracefully
```

### Branch Naming

```text
{type}/{short-description}
Examples:
  feature/ai-governance
  fix/workflow-51
  docs/update-readme
```

### What to Commit

✅ **Always commit:**
- Source code
- Documentation
- Configuration files
- Data files (YAML, JSON)
- Jekyll templates
- Assets (CSS, JS, images)

❌ **Never commit:**
- Build artifacts (`_site/`)
- Dependencies (`node_modules/`, `vendor/`)
- Secrets (`.env`, API keys)
- Temporary files (`.DS_Store`, `*.tmp`)
- IDE configs (`.vscode/`, `.idea/`)
- Large binaries (>5MB) without LFS

---

## JEKYLL-SPECIFIC RULES

### Collection Items

Must have:
- Valid YAML front matter
- Proper layout specified
- Required fields for that collection
- Unique slug or filename

### Permalinks

Use semantic URLs:
```yaml
permalink: /cases/:name/
permalink: /faith/:name/
```

Avoid:
- Date-based: `/2025/12/20/title/`
- Extension: `/document.html`
- Numeric: `/post/123/`

### Liquid Templating

Keep logic in templates simple:
```liquid
{% if page.status == "active" %}
  <div class="active-case">...</div>
{% endif %}
```

Complex logic → move to Ruby plugin.

---

## DATA FILE STANDARDS

### YAML Files

```yaml
# Comment explaining purpose
key: value
list:
  - item1
  - item2
nested:
  child: value
```

Rules:
- Use **2-space indentation**
- **Quote strings** with special characters
- **No tabs** (spaces only)
- **Validate** with `yamllint` or similar

### JSON Files

```json
{
  "key": "value",
  "list": ["item1", "item2"],
  "nested": {
    "child": "value"
  }
}
```

Rules:
- **Pretty-print** with 2-space indent
- **Validate** with `jsonlint` or similar
- **UTF-8 encoding**
- **No trailing commas**

---

## VALIDATION & TESTING

### Pre-Commit Checks

Before committing:
- [ ] Jekyll builds without errors
- [ ] YAML/JSON files are valid
- [ ] Links are not broken
- [ ] Images load correctly
- [ ] No secrets committed
- [ ] Commit message follows convention

### Build Commands

```bash
# Validate Jekyll
bundle exec jekyll build

# Serve locally
bundle exec jekyll serve

# Check dependencies
bundle install
npm install
```

---

## INTEGRATION

This file implements technical standards for:
- **SYSTEM.md** - Foundational rules
- **STYLE.md** - Writing conventions
- **DOMAIN.md** - Project context
- **COMPLIANCE.md** - Legal bounds

Technical choices serve broader goals.

---

**END - OUTPUT_RULES.md**
