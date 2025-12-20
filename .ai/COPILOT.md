# COPILOT.md - GitHub Copilot Adapter

**Tool:** GitHub Copilot (Chat & Editor)  
**Version:** 1.0.0  
**Last Updated:** 2025-12-20

---

## INHERITANCE CHAIN

This adapter loads instructions from:

1. **/.ai/SYSTEM.md** ← Foundational rules (PRIMARY)
2. **/.ai/STYLE.md** ← Writing standards
3. **/.ai/DOMAIN.md** ← Project context
4. **/.ai/COMPLIANCE.md** ← Legal bounds
5. **/.ai/OUTPUT_RULES.md** ← Technical specs
6. **/.ai/COPILOT.md** ← This file (tool-specific)

**Priority:** Core files override tool-specific preferences.

---

## COPILOT-SPECIFIC CONTEXT

### Tool Capabilities

GitHub Copilot provides:
- **Inline suggestions** during typing
- **Chat interface** for questions
- **Code generation** from comments
- **Refactoring assistance**
- **Documentation generation**

### Integration Points

Copilot is loaded via:
- `.github/copilot-instructions.md` → **points to this file**
- Workspace context (open files, git history)
- Language servers (LSP)

---

## COPILOT BEHAVIORAL RULES

### Code Generation

When generating code:
1. **Match existing patterns** - Follow repo conventions
2. **Add comments** - Explain non-obvious logic
3. **Use existing libraries** - Don't reinvent wheels
4. **Test assumptions** - Verify code will work
5. **Suggest improvements** - Point out better approaches

### Documentation

When writing docs:
1. **Use Markdown** - Follow OUTPUT_RULES.md
2. **Structure clearly** - Headings, lists, examples
3. **Be concise** - Respect user's time
4. **Link related docs** - Cross-reference properly
5. **Include examples** - Show, don't just tell

### Refactoring

When improving code:
1. **Preserve functionality** - Don't break existing behavior
2. **Improve readability** - Make it easier to understand
3. **Remove duplication** - DRY principle
4. **Add type safety** - Use TypeScript, JSDoc, etc.
5. **Maintain tests** - Update or add test coverage

---

## PROJECT-SPECIFIC GUIDANCE

### Jekyll Development

When working with Jekyll:
- Use **Liquid templating** syntax correctly
- Respect **front matter** schema (see OUTPUT_RULES.md)
- Test with `bundle exec jekyll serve`
- Check **collection** conventions (`_cases/`, `_essays/`)
- Use **includes** for reusable components

### Case Management

When working with case files:
- Follow **docket system** conventions (see DOCKET-SYSTEM.md)
- Use **YAML data files** for structured dockets
- Place **PDFs** in `cases/{slug}/filings/`
- Maintain **case front matter** schema
- Link **related cases** properly

### Automation Scripts

When writing Node.js scripts:
- Use **ES6 modules** (`type: "module"` in package.json)
- Load `.env` with `dotenv`
- Handle **errors gracefully**
- Provide **helpful messages**
- Use **async/await** not callbacks

### GitHub Actions

When writing workflows:
- Use **conditional execution** for optional steps
- Provide **clear step names**
- Add **helpful summaries**
- Handle **secrets safely**
- Test **failure scenarios**

---

## COPILOT INTERACTION PATTERNS

### Inline Suggestions

Accept suggestions that:
- Match existing code style
- Improve code quality
- Add useful functionality
- Are correct and safe

Reject suggestions that:
- Violate COMPLIANCE.md rules
- Contradict SYSTEM.md constraints
- Introduce vulnerabilities
- Break existing functionality

### Chat Requests

When user asks questions:
1. **Understand intent** - What are they trying to do?
2. **Check scope** - Is this within bounds?
3. **Provide answer** - Direct and helpful
4. **Cite sources** - Link to relevant docs
5. **Offer follow-up** - Suggest next steps

### Multi-Turn Conversations

Maintain context across turns:
- **Remember previous** questions
- **Build on context** from earlier responses
- **Clarify ambiguity** before proceeding
- **Update understanding** as new info emerges

---

## REPOSITORY KNOWLEDGE

### Key Files

Copilot should be aware of:
- **README.md** - Project overview
- **DOCKET-SYSTEM.md** - Case management docs
- **_docs/ANALYSIS-SYSTEM.md** - AI analysis system
- **_internal/** - Working documentation
- **.github/workflows/** - CI/CD pipelines

### Common Tasks

Typical requests:
1. **Add new case** - Create file with proper front matter
2. **Update docket** - Add entries to YAML
3. **Write essay** - Follow essay template
4. **Fix workflow** - Debug GitHub Actions
5. **Generate analysis** - Use OpenAI script
6. **Refactor content** - Improve existing docs

### Technical Stack

Technologies in use:
- **Jekyll 4.x** - Static site generator
- **Ruby 3.x** - Jekyll runtime
- **Node.js 20.x** - Automation scripts
- **GitHub Actions** - CI/CD
- **OpenAI API** - Case analysis (optional)
- **GitHub Pages** - Hosting

---

## QUALITY STANDARDS

### Code Quality

Ensure code:
- **Builds successfully** - No syntax errors
- **Passes linting** - Follows ESLint/Rubocop rules
- **Works as expected** - Test mentally
- **Handles errors** - Graceful failure modes
- **Is maintainable** - Others can understand it

### Documentation Quality

Ensure docs:
- **Are accurate** - Facts check out
- **Are complete** - Answer the question
- **Are clear** - Easy to understand
- **Are consistent** - Match repo style
- **Are useful** - Solve real problems

### Content Quality

Ensure content:
- **Follows STYLE.md** - Tone and structure
- **Respects COMPLIANCE.md** - Legal/ethical bounds
- **Matches DOMAIN.md** - Project context
- **Uses OUTPUT_RULES.md** - Technical formats

---

## ERROR HANDLING

### When Uncertain

If request is unclear:
1. **Ask for clarification** - Don't guess
2. **Explain why** - What's ambiguous?
3. **Suggest alternatives** - What might they mean?
4. **Wait for response** - Don't proceed blindly

### When Out of Scope

If request violates constraints:
1. **Decline politely** - Explain why not
2. **Cite constraint** - Reference SYSTEM.md, COMPLIANCE.md
3. **Suggest alternative** - What could work instead?
4. **Offer to help differently** - Related task?

### When Tool Limits Hit

If Copilot can't do something:
1. **Acknowledge limitation** - Be honest
2. **Suggest workaround** - Manual steps?
3. **Recommend tools** - What could help?
4. **Document for future** - Note the gap

---

## INTEGRATION WITH EXISTING INSTRUCTIONS

### Migration Note

This repository **previously** used:
- `.github/copilot-instructions.md` (direct instructions)

Now uses:
- `/.ai/*` files (centralized governance)
- `.github/copilot-instructions.md` → pointer to COPILOT.md

**No behavioral changes intended** - just better organization.

### Backwards Compatibility

Previous instruction content is **preserved** in:
- SYSTEM.md (governance rules)
- DOMAIN.md (project context)
- STYLE.md (writing standards)
- COMPLIANCE.md (legal bounds)
- OUTPUT_RULES.md (technical specs)

---

## COPILOT-SPECIFIC LIMITATIONS

### What Copilot Cannot Do

Copilot cannot:
- **Run code** - Only suggest it
- **Access external APIs** - Except through code
- **Modify files directly** - User must accept
- **Guarantee correctness** - Always verify
- **Replace human judgment** - AI assists, doesn't decide

### Known Issues

Be aware:
- **Context window limits** - May not see all files
- **Outdated training** - Newer tech might not be known
- **Hallucination risk** - Can invent plausible-sounding falsehoods
- **Style drift** - May not match repo perfectly

**Always review suggestions before accepting.**

---

## CONTINUOUS IMPROVEMENT

### Feedback Loop

Help improve these instructions by:
- Noting when suggestions violate rules
- Reporting unclear or contradictory guidance
- Suggesting improvements to instruction files
- Documenting edge cases or limitations

### Version Control

All instruction changes:
- Must be explicit commits
- Need human approval
- Should explain rationale
- Are tracked in Git history

---

**END - COPILOT.md**

## Quick Reference

**When in doubt:**
1. Check SYSTEM.md first
2. Review relevant core file
3. Ask user for clarification
4. Decline if violates constraints
5. Document the issue for improvement
