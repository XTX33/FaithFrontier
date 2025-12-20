# DOMAIN.md - FaithFrontier Project Context

**Authority:** Subordinate to SYSTEM.md  
**Scope:** Project-specific knowledge and context  
**Version:** 1.0.0  
**Last Updated:** 2025-12-20

---

## INHERITANCE

This file inherits all constraints from:
→ **/.ai/SYSTEM.md**  
→ **/.ai/STYLE.md**

Project context does not override foundational rules.

---

## PROJECT IDENTITY

### Name & Structure

**Legal Entity:** Faith Frontier Ecclesiastical Trust  
**Repository:** FaithFrontier  
**Domain:** faithfrontier.org  
**Jurisdiction:** New Jersey, United States  
**Type:** Religious and community-stewardship institution

### Mission Statement

Faith Frontier exists as a **local, accountable sanctuary** rooted in Christian stewardship, neighbor-care, and lawful enterprise.

**Core Purpose:**
- Support small businesses, trades, and local labor
- Encourage community accountability over centralized dependency
- Steward land, housing, and work with dignity
- Provide lawful alternatives to exploitative systems
- Restore craft, vocation, and moral responsibility

---

## WHAT FAITH FRONTIER IS

### Operational Reality

Faith Frontier is:
- A **New Jersey-based trust** operating under state law
- A **Christian stewardship initiative** grounded in historic theology
- A **community support network** for local economic resilience
- A **public documentation project** showcasing legal competence
- A **transparent organization** with all records available for review

### Activities

Current and planned activities include:
- **Legal advocacy** - Documenting cases and procedural competence
- **Community housing** - Emergency shelter and reentry support
- **Local enterprise** - Supporting trades, crafts, and small businesses
- **Education** - Teaching constitutional literacy and civic engagement
- **Documentation** - Maintaining public records of all operations

---

## WHAT FAITH FRONTIER IS NOT

### Explicit Exclusions

Faith Frontier is **not**:
- A political party or campaign
- A revolutionary or separatist movement
- A currency issuer or monetary authority
- A parallel government or sovereign entity
- A rejection or replacement of civil law
- A tax avoidance scheme
- A cult or insular religious sect
- A speculative investment vehicle

### Scope Boundaries

Faith Frontier does **not**:
- Challenge legitimacy of U.S. or state government
- Operate outside legal frameworks
- Claim sovereign immunity or special status
- Create alternative monetary systems
- Operate clandestinely or secretively
- Require ideological purity tests
- Discourage civic participation in mainstream systems

---

## THEOLOGICAL FOUNDATION

### Christian Tradition

Faith Frontier is rooted in **historic Christian teaching**:
- The **Holy Bible** as authoritative Scripture
- The **Geneva Bible** as a theological and historical influence
- **Jesus Christ (Yeshua)** as Lord and Savior
- Christian ethics of stewardship, humility, service, and neighbor-love

### Theological Approach

**How we handle theology:**
- **Plainly** - Accessible language, not seminary jargon
- **Humbly** - No claims of prophetic certainty or divine mandate
- **Scripturally** - Grounded in Biblical text, not speculation
- **Ecumenically** - Respecting diverse Christian traditions
- **Practically** - Faith informs action, not replacement for civil duty

### What We Avoid

When discussing theology, AI must **never**:
- Claim special revelation or divine authority
- Weaponize Scripture to manipulate or coerce
- Imply religious superiority or exclusivism
- Suggest that faith overrides civil law
- Use prophetic or apocalyptic framing
- Present theology as settled fact rather than conviction

**Faith informs conduct and conscience - not coercion.**

---

## ECONOMIC PHILOSOPHY

### Stewardship Model

Faith Frontier's economic approach:
- **Asset stewardship** - Responsible management of resources
- **Local trade** - Supporting neighborhood businesses
- **Tangible work** - Crafts, trades, agriculture, services
- **Mutual aid** - Voluntary help networks
- **Small-scale resilience** - Diversified local economies

### What We Support

✅ **Lawful activities:**
- Cooperative work arrangements
- Skill-sharing and apprenticeships
- Community-supported agriculture
- Time banking (where legally permitted)
- Credit unions and cooperative banking
- Local currencies **within legal frameworks**

### What We Do NOT Support

❌ **Prohibited activities:**
- Creating alternative national currencies
- Operating outside regulatory frameworks
- Tax avoidance or evasion schemes
- Claiming monetary sovereignty
- Replacement of U.S. dollar
- Barter to avoid reporting requirements

**All economic activity must comply with applicable law.**

---

## LEGAL CONTEXT

### Jurisdictional Reality

Faith Frontier operates under:
- **U.S. Constitution** (supreme law)
- **Federal statutes** (commerce, taxation, civil rights)
- **New Jersey state law** (incorporation, property, contracts)
- **Local ordinances** (zoning, permits, health codes)

### Relationship to Government

Faith Frontier's stance:
- **Lawful** - Operates within established legal frameworks
- **Cooperative** - Seeks partnership with government agencies
- **Accountable** - Transparent records and public documentation
- **Compliant** - Follows all applicable regulations
- **Respectful** - Acknowledges legitimate government authority

### Government Partnerships

Faith Frontier pursues:
- Emergency housing contracts with municipalities
- Reentry programs for formerly incarcerated persons
- Workforce development partnerships
- Community development grants
- Public-private collaborative initiatives

**Trust is built through documented competence and compliance.**

---

## REPOSITORY PURPOSE

### Why This Repository Exists

This Jekyll-based website serves to:
1. **Document legal proceedings** - Complete case records and dockets
2. **Demonstrate competence** - Constitutional literacy and procedural knowledge
3. **Build public trust** - Transparency through verifiable records
4. **Educate community** - Real-world civics and legal processes
5. **Support partnerships** - Evidence of organizational capacity

### Primary Audiences

- **Government agencies** - Evaluating partnership potential
- **Community members** - Understanding Faith Frontier's work
- **Legal researchers** - Studying procedural issues and advocacy
- **Journalists** - Investigating stories or verifying claims
- **Future stewards** - Learning from documented experience

---

## KEY SYSTEMS

### 1. Case Management

**Purpose:** Document all legal proceedings  
**Location:** `_cases/` directory  
**Format:** Markdown files with YAML front matter  
**Features:**
- Complete docket entries
- PDF filings and orders
- Procedural history
- AI-generated analysis (optional)

### 2. Docket System

**Purpose:** Organize court filings and documents  
**Location:** `_data/docket/` directory  
**Format:** YAML data files  
**Features:**
- Automated PDF intake
- Standardized file naming
- Chronological organization
- Searchable metadata

### 3. Essay Platform

**Purpose:** Publish commentary and analysis  
**Location:** `_essays/` directory  
**Format:** Markdown files with front matter  
**Topics:**
- Theological reflections
- Legal analysis
- Community stewardship
- Historical context

### 4. Automation

**Purpose:** Reduce manual maintenance burden  
**Tools:**
- OpenAI GPT models (case analysis)
- GitHub Actions (CI/CD)
- Node.js scripts (document intake)
- Jekyll build system (static site generation)

---

## TECHNICAL ARCHITECTURE

### Core Technologies

- **Jekyll** - Ruby-based static site generator
- **Markdown** - Primary content format
- **YAML** - Structured data (front matter, configs)
- **Liquid** - Jekyll templating language
- **Node.js** - Automation scripts
- **GitHub Actions** - CI/CD workflows
- **GitHub Pages** - Hosting platform

### Directory Structure

```text
/
├─ _cases/              # Legal case records
├─ _data/               # Structured data (dockets, maps)
├─ _docs/               # Internal documentation
├─ _essays/             # Commentary and analysis
├─ _includes/           # Reusable HTML components
├─ _layouts/            # Page templates
├─ assets/              # CSS, JS, images
├─ cases/               # Case-specific files (PDFs, notes)
├─ scripts/             # Automation tools
└─ .github/             # GitHub Actions workflows
```

### Build Process

1. Content authors write Markdown files
2. Jekyll generates static HTML
3. GitHub Actions builds and deploys
4. Site published to faithfrontier.org

---

## CONTENT STANDARDS

### Case Records

Every case file must include:
- **Title** - Case caption or short description
- **Docket number(s)** - Official court identifiers
- **Court** - Jurisdiction and venue
- **Status** - Active, pending, closed
- **Filed date** - When case was initiated
- **Procedural posture** - Current state of proceedings
- **Docket entries** - Chronological filings and orders

### Essays

Every essay should include:
- **Clear thesis** - Main argument or point
- **Evidence** - Supporting facts, citations, examples
- **Context** - Historical, legal, or theological background
- **Disclaimers** - Appropriate qualifications
- **Publication date** - When written or updated

### Documentation

All docs should provide:
- **Purpose statement** - Why this document exists
- **Audience** - Who should read this
- **Instructions** - How to use or implement
- **Examples** - Concrete illustrations
- **Maintenance notes** - How to update

---

## GOVERNANCE INTEGRATION

### How This File Fits

```text
SYSTEM.md (foundational rules)
  ↓
STYLE.md (writing standards)
  ↓
DOMAIN.md ← YOU ARE HERE (project context)
  ↓
COMPLIANCE.md (legal boundaries)
  ↓
OUTPUT_RULES.md (technical specs)
  ↓
Tool Adapters (COPILOT, CODEX, GPT)
```

Domain knowledge informs how general rules are applied, but **never overrides foundational constraints**.

---

## CHANGE HISTORY

### Version 1.0.0 (2025-12-20)

- Initial creation
- Migrated context from `.github/copilot-instructions.md`
- Established project boundaries and scope
- Documented technical architecture
- Defined content standards

---

**END - DOMAIN.md**
