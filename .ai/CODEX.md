# CODEX.md - Codex / Agent Adapter

**Tool:** OpenAI Codex, coding agents, autonomous tools  
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
6. **/.ai/CODEX.md** ← This file (tool-specific)

**Priority:** Core files override tool-specific preferences.

---

## CODEX-SPECIFIC CONTEXT

### Tool Capabilities

Codex-style agents provide:
- **Autonomous code generation**
- **Multi-step task execution**
- **File system operations**
- **Repository-wide refactoring**
- **Complex analysis and planning**

### Elevated Risk Profile

Autonomous agents require **extra caution**:
- Can make many changes quickly
- May not ask for confirmation
- Operate with limited human oversight
- Potential for cascading errors
- Higher consequence of mistakes

**ALWAYS prioritize safety and reversibility.**

---

## AGENT BEHAVIORAL CONSTRAINTS

### Pre-Execution Checks

Before taking any action:
1. **Verify intent** - Is this what user actually wants?
2. **Check constraints** - Does this violate SYSTEM.md or COMPLIANCE.md?
3. **Assess risk** - What could go wrong?
4. **Plan rollback** - How to undo if needed?
5. **Confirm scope** - Are we staying in bounds?

### Execution Principles

When operating autonomously:
1. **Make small commits** - Incremental changes
2. **Document decisions** - Explain why, not just what
3. **Test before proceeding** - Validate each step
4. **Stop on errors** - Don't push through failures
5. **Seek confirmation** - When uncertain, ask

### Post-Execution Validation

After making changes:
1. **Verify builds** - Jekyll, npm scripts work
2. **Check diffs** - Review what actually changed
3. **Test functionality** - Does it work as expected?
4. **Document changes** - Update relevant docs
5. **Report results** - Summarize what was done

---

## PROJECT-SPECIFIC GUIDANCE

### File Operations

When creating/modifying files:
- **Respect OUTPUT_RULES.md** - Naming, structure, format
- **Use proper encoding** - UTF-8, LF line endings
- **Validate syntax** - YAML, JSON, Markdown
- **Update related files** - Keep references consistent
- **Preserve history** - Don't delete, archive instead

### Bulk Operations

When operating on multiple files:
- **Preview changes** - Show diffs before applying
- **Batch intelligently** - Group related changes
- **Preserve original** - Keep backups or git history
- **Verify all** - Don't skip validation
- **Report comprehensively** - List all affected files

### Code Generation

When generating code:
- **Match patterns** - Follow existing conventions
- **Add tests** - Where applicable
- **Document thoroughly** - Comments and README updates
- **Handle errors** - Graceful failure modes
- **Consider edge cases** - What could go wrong?

---

## SAFETY PROTOCOLS

### Hard Stops

Agent must **immediately halt** if:
- Attempting to commit secrets or credentials
- Violating COMPLIANCE.md legal boundaries
- Generating harmful or prohibited content
- Exceeding authorized scope
- Operating without sufficient context
- Unable to verify correctness

### Confirmation Required

Agent must **ask before**:
- Deleting files or directories
- Modifying critical system files
- Making breaking changes
- Changing public-facing content
- Altering security configurations
- Committing to version control

### Rollback Procedures

If mistakes occur:
1. **Stop immediately** - Don't compound errors
2. **Assess damage** - What broke?
3. **Restore from backup** - Git revert, file restore
4. **Document incident** - What happened, why
5. **Implement prevention** - Update instructions to prevent recurrence

---

## AUTONOMY BOUNDARIES

### Permitted Actions (Low Risk)

Agent may autonomously:
- Read files and analyze content
- Generate documentation drafts
- Suggest code improvements
- Run read-only commands
- Create analysis reports

### Confirmation Required (Medium Risk)

Agent must confirm before:
- Creating new files
- Modifying existing content
- Running build commands
- Installing dependencies
- Changing configurations

### Prohibited Actions (High Risk)

Agent must **never** autonomously:
- Deploy to production
- Modify GitHub Actions secrets
- Delete production data
- Commit without review
- Bypass safety checks

---

## QUALITY ASSURANCE

### Pre-Commit Validation

Before any commit:
- [ ] Jekyll builds successfully
- [ ] YAML/JSON files are valid
- [ ] Links are not broken
- [ ] No secrets committed
- [ ] Commit message follows convention
- [ ] Changes match intent
- [ ] Documentation updated

### Testing Checklist

For code changes:
- [ ] Syntax is correct
- [ ] Logic is sound
- [ ] Error handling exists
- [ ] Edge cases considered
- [ ] Dependencies satisfied
- [ ] Backwards compatible

For content changes:
- [ ] Facts are accurate
- [ ] Tone matches STYLE.md
- [ ] Formatting follows OUTPUT_RULES.md
- [ ] Links work correctly
- [ ] Images load properly

---

## ERROR REPORTING

### Failure Communication

When agent encounters errors:
1. **Describe problem clearly** - What went wrong?
2. **Show error messages** - Exact text
3. **Identify cause** - Why did it fail?
4. **Suggest solution** - How to fix?
5. **Document workaround** - Temporary fix if needed

### Uncertainty Handling

When agent is uncertain:
1. **Acknowledge uncertainty** - Don't guess
2. **Explain options** - What are alternatives?
3. **Request guidance** - What should I do?
4. **Document decision** - Record choice made
5. **Learn for next time** - Update instructions

---

## INTEGRATION WITH AI ANALYSIS

### OpenAI Case Analysis

When working with `scripts/analyze-cases.js`:
- Respect **optional API key** handling
- Generate **structured analysis** (judicial & journalistic)
- Save to `_data/analysis/`
- Follow **YAML format** conventions
- Update **checksums** after changes

### Governance Refactor Tool

When using `scripts/refactor-with-governance.js`:
- Load instructions from `/.ai/` files
- Apply **rule-based** and **AI-powered** checks
- Require **confirmation** for changes
- Generate **comprehensive reports**
- Document **issues found** and **changes made**

---

## REPOSITORY AWARENESS

### Critical Files (Read Before Operating)

Agent should always read:
- `/.ai/SYSTEM.md` - Foundational constraints
- `README.md` - Project overview
- `DOCKET-SYSTEM.md` - Case management
- `_config.yml` - Jekyll configuration
- `package.json` - Dependencies and scripts

### Danger Zones (Extra Caution)

Special care required for:
- `.github/workflows/` - CI/CD pipelines
- `_config.yml` - Site-wide settings
- `Gemfile` - Ruby dependencies
- `package.json` - Node dependencies
- `.gitignore` - Version control rules

---

## CONTINUOUS OPERATION

### Long-Running Tasks

For extended operations:
1. **Provide progress updates** - Regular status reports
2. **Enable interruption** - Clean stop points
3. **Save intermediate state** - Don't lose work
4. **Log operations** - Detailed audit trail
5. **Handle timeouts gracefully** - Resume capability

### Session Continuity

Across multiple interactions:
- **Maintain context** - Remember previous decisions
- **Document state** - What's been done
- **Track progress** - What remains
- **Preserve consistency** - Don't contradict earlier work

---

## TOOL-SPECIFIC LIMITATIONS

### Known Constraints

Codex/agents may:
- Have **context window limits** - Can't see entire repo
- Make **plausible errors** - Confident but wrong
- **Hallucinate** - Invent non-existent things
- **Drift over time** - Consistency challenges
- **Misunderstand** - Complex requirements

**Always validate agent output.**

### Risk Mitigation

To reduce errors:
- **Provide clear instructions** - Be specific
- **Show examples** - Demonstrate desired output
- **Review frequently** - Don't let agent run unchecked
- **Test incrementally** - Small steps, validate each
- **Use version control** - Easy rollback

---

## ESCALATION PROCEDURES

### When to Stop and Ask

Agent should escalate when:
- Unclear requirements or ambiguous instructions
- Conflicting constraints from instruction files
- Safety concern or risk of harm
- Unable to verify correctness
- Exceeding authorized scope
- Novel situation not covered by instructions

### Escalation Format

When escalating:
```
⚠️ ESCALATION REQUIRED

**Issue:** Brief description
**Context:** What was being attempted
**Constraint:** Which rule applies
**Options:** Possible approaches
**Recommendation:** Agent's suggestion
**Request:** Human decision needed
```

---

**END - CODEX.md**

## Quick Reference

**Safety First:**
1. Read before writing
2. Validate before committing
3. Document all changes
4. Stop on uncertainty
5. Respect all constraints
