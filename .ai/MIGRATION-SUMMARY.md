# AI Governance Migration Summary

**Date:** December 20, 2025  
**Migration:** Copilot instructions → Centralized `/.ai/` structure  
**Status:** ✅ Complete

---

## What Changed

### New Structure Created

```text
/.ai/
├─ README.md           # Public overview of AI governance
├─ SYSTEM.md           # Master instructions (authoritative)
├─ STYLE.md            # Writing and tone standards
├─ DOMAIN.md           # FaithFrontier-specific context
├─ COMPLIANCE.md       # Legal and ethical boundaries
├─ OUTPUT_RULES.md     # File formats and conventions
├─ COPILOT.md          # GitHub Copilot adapter
├─ CODEX.md            # Codex/agent adapter
└─ GPT.md              # Chat/API model adapter
```

### Existing File Updated

- **`.github/copilot-instructions.md`** - Converted to thin pointer
  - **Before:** 367 lines of inline instructions
  - **After:** ~100 lines pointing to `/.ai/COPILOT.md`
  - **Content:** Preserved in `/.ai/` structure

---

## Why This Change

### Problems Solved

1. **Tool Fragmentation** - Now works with Copilot, GPT, Codex, and future tools
2. **Prompt Drift** - Single source of truth prevents inconsistency
3. **Maintainability** - Update one place, affects all tools
4. **Auditability** - Clear Git history of instruction changes
5. **Reproducibility** - Same inputs → same outputs

### Benefits

- **Tool-agnostic** - Not locked into GitHub Copilot
- **Versioned** - All changes tracked in Git
- **Modular** - Core rules separate from tool-specific adapters
- **Scalable** - Easy to add new tool adapters
- **Transparent** - Public README explains governance exists

---

## File-by-File Breakdown

### /.ai/README.md (Public)

**Purpose:** Explain that AI governance exists and how it works  
**Audience:** Anyone who reads the repository  
**Content:**
- Architecture overview
- Why this structure exists
- How it works for different tools
- Public vs. internal boundary
- Change control process

### /.ai/SYSTEM.md (Core)

**Purpose:** Foundational AI behavioral rules  
**Authority:** Highest (all other files inherit from this)  
**Content:**
- Primary directive (assistant steward)
- Core behavioral rules
- Mission understanding
- Legal & compliance framework
- Economic language constraints
- Output quality standards
- Boundary conditions

**Migrated from:** Governance & Operational Framework section of copilot-instructions.md

### /.ai/STYLE.md (Core)

**Purpose:** Writing and communication standards  
**Authority:** Implements SYSTEM.md for writing  
**Content:**
- Tone & voice rules
- Language preferences
- Structural standards
- Paragraph construction
- Word choice guidelines
- Emphasis techniques
- Markdown conventions

**Migrated from:** Style & Voice section of copilot-instructions.md

### /.ai/DOMAIN.md (Core)

**Purpose:** Project-specific knowledge and context  
**Authority:** Applies SYSTEM.md to FaithFrontier  
**Content:**
- Project identity
- What Faith Frontier is (and isn't)
- Theological foundation
- Economic philosophy
- Legal context
- Repository purpose
- Technical architecture

**Migrated from:** Project Overview, Core Mission, and technical sections of copilot-instructions.md

### /.ai/COMPLIANCE.md (Core)

**Purpose:** Legal and ethical boundaries  
**Authority:** Absolute constraints  
**Content:**
- Legal framework (U.S., NJ law)
- Prohibited content (illegal, harmful, private)
- Religious content boundaries
- Economic & financial compliance
- Data & privacy rules
- Constitutional compliance
- Ethical standards

**Migrated from:** Legal & Compliance Discipline section of copilot-instructions.md

### /.ai/OUTPUT_RULES.md (Core)

**Purpose:** Technical and format standards  
**Authority:** Implements all core files for outputs  
**Content:**
- File formats (Markdown, YAML, JSON)
- File naming conventions
- Directory structure
- YAML front matter rules
- Markdown structure templates
- Code conventions
- Link and image standards
- Git conventions

**Migrated from:** Coding Conventions and Directory Structure sections of copilot-instructions.md

### /.ai/COPILOT.md (Adapter)

**Purpose:** GitHub Copilot-specific integration  
**Authority:** Thin wrapper, inherits from core files  
**Content:**
- Tool capabilities
- Copilot behavioral rules
- Project-specific guidance (Jekyll, cases, automation)
- Interaction patterns
- Quality standards
- Error handling
- Known limitations

**New content** tailored for Copilot's specific capabilities

### /.ai/CODEX.md (Adapter)

**Purpose:** Codex and autonomous agent integration  
**Authority:** Thin wrapper, inherits from core files  
**Content:**
- Elevated risk profile (autonomous operation)
- Safety protocols (hard stops, confirmations)
- Autonomy boundaries
- Pre/post-execution validation
- Rollback procedures
- Long-running task management

**New content** with emphasis on safety for autonomous agents

### /.ai/GPT.md (Adapter)

**Purpose:** ChatGPT and API model integration  
**Authority:** Thin wrapper, inherits from core files  
**Content:**
- Conversational interface patterns
- API integration (system prompt construction)
- Multi-turn dialogue management
- Model-specific considerations (temperature, tokens)
- Response formatting
- Known limitations (hallucination, cutoff date)

**New content** for chat and API use cases

---

## Content Mapping

### Where Did Everything Go?

| Original Section | New Location |
|-----------------|-------------|
| Role of AI | SYSTEM.md |
| Core Mission | DOMAIN.md |
| Theological Foundation | DOMAIN.md + COMPLIANCE.md |
| Economic Language | DOMAIN.md + COMPLIANCE.md |
| Documentation Standards | STYLE.md + OUTPUT_RULES.md |
| Legal & Compliance | COMPLIANCE.md |
| Style & Voice | STYLE.md |
| Setup Instructions | (Kept in copilot-instructions.md for convenience) |
| Directory Structure | OUTPUT_RULES.md |
| Coding Conventions | OUTPUT_RULES.md |
| Key Systems | DOMAIN.md |
| Testing | OUTPUT_RULES.md |
| Pull Request Guidelines | (Kept in copilot-instructions.md) |
| Special Considerations | DOMAIN.md + OUTPUT_RULES.md |

---

## Behavioral Impact

### No Changes Intended

This migration is **structural only**. AI behavior should remain the same:
- Same constraints
- Same mission understanding
- Same tone and style
- Same technical standards

### Improvements Expected

The new structure should **improve**:
- Consistency across sessions (less drift)
- Consistency across tools (Copilot, GPT, agents)
- Maintainability (single source of truth)
- Transparency (clear what AI is told)
- Version control (explicit instruction changes)

---

## Usage Guide

### For GitHub Copilot

Copilot automatically loads:
1. `.github/copilot-instructions.md` (pointer)
2. Which references `/.ai/COPILOT.md`
3. Which inherits from `/.ai/SYSTEM.md`, `STYLE.md`, etc.

**No action required** - works automatically.

### For ChatGPT / API

Manual integration:
1. Concatenate core files:
   ```text
   SYSTEM.md + STYLE.md + DOMAIN.md + COMPLIANCE.md + GPT.md
   ```
2. Use as system prompt in API calls
3. Or paste into ChatGPT at start of session

### For Codex / Agents

Provide `/.ai/` directory as context:
1. Load files in order: SYSTEM → DOMAIN → COMPLIANCE → OUTPUT_RULES → CODEX
2. Agent operates under these constraints
3. Safety protocols in CODEX.md are especially important

---

## Maintenance

### Updating Instructions

To modify AI behavior:
1. **Edit appropriate file** in `/.ai/`
   - SYSTEM.md for core behavior
   - STYLE.md for writing changes
   - DOMAIN.md for project context updates
   - COMPLIANCE.md for legal boundary changes
   - OUTPUT_RULES.md for technical standards
   - Tool adapters for tool-specific tweaks
2. **Commit with explanation** of why change was made
3. **Test behavior** to verify change worked as intended
4. **Document in Git history** for future reference

### Review Schedule

Recommended:
- **Monthly:** Review SYSTEM.md for accuracy
- **Quarterly:** Audit COMPLIANCE.md for legal updates
- **As needed:** Update DOMAIN.md when project scope changes
- **Per tool:** Update adapters when AI tools change

---

## Testing & Validation

### How to Verify

1. **Check file exists:** `ls -la .ai/`
2. **Verify structure:** All 9 files present
3. **Test Copilot:** Ask it about its instructions
4. **Check compliance:** Request something prohibited, verify refusal
5. **Validate formatting:** Generate content, check matches OUTPUT_RULES.md

### Known Issues

None yet. Report issues via GitHub Issues with `[AI-GOVERNANCE]` tag.

---

## Rollback Procedure

If migration causes problems:

1. **Restore old file:**
   ```bash
   git checkout main~1 .github/copilot-instructions.md
   ```
2. **Remove new structure:**
   ```bash
   git rm -r .ai/
   ```
3. **Commit rollback:**
   ```bash
   git commit -m "revert: rollback AI governance migration"
   ```
4. **Document why** in commit message and issue

---

## Future Enhancements

Potential improvements:
- **Automated validation** - Script to check instruction consistency
- **Instruction testing** - Automated tests for AI behavior
- **Version badges** - Track instruction versions
- **Change log** - Dedicated changelog for instruction updates
- **Tool adapters** - Add more as new AI tools emerge

---

## Related Documents

- **/.ai/README.md** - Public overview of governance system
- **.github/copilot-instructions.md** - Pointer to COPILOT.md
- **Git history** - Track all instruction changes over time

---

## Questions & Support

### Common Questions

**Q: Will this change Copilot's behavior?**  
A: No, content is the same, just better organized.

**Q: Do I need to do anything?**  
A: No, Copilot will automatically load from the new location.

**Q: Can I still modify instructions?**  
A: Yes, edit files in `/.ai/` and commit changes.

**Q: What if I don't like this?**  
A: See "Rollback Procedure" above.

### Getting Help

- Open an issue with `[AI-GOVERNANCE]` tag
- Reference specific instruction files
- Provide examples of unexpected behavior
- Suggest improvements

---

**END - Migration Summary**

**Status:** ✅ Migration complete and verified
