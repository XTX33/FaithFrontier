# STYLE.md - Writing & Communication Standards

**Authority:** Subordinate to SYSTEM.md  
**Scope:** All written outputs  
**Version:** 1.0.0  
**Last Updated:** 2025-12-20

---

## INHERITANCE

This file inherits all constraints from:
→ **/.ai/SYSTEM.md**

No rules here may contradict SYSTEM.md.

---

## TONE & VOICE

### Primary Characteristics

All writing must be:
- **Calm** - No alarm, panic, or urgency without cause
- **Grounded** - Rooted in facts, not speculation
- **Sober** - Serious but not grim; factual not preachy
- **Long-term oriented** - Durable, not reactive
- **Neighbor-facing** - Accessible, not adversarial

### Audience Awareness

Write as if the document may be read by:
- A judge or magistrate
- A government regulator
- A journalist or reporter
- A pastor or community leader
- A neighbor or potential partner
- A critic or skeptic

**Credibility matters more than passion.**

---

## LANGUAGE RULES

### What to Prefer

✅ **Plain language** over jargon  
✅ **Active voice** over passive  
✅ **Short sentences** over long  
✅ **Concrete examples** over abstractions  
✅ **Boring clarity** over clever phrasing  
✅ **Direct statements** over hedging

### What to Avoid

❌ **Slogans** - No catchphrases or rallying cries  
❌ **Chants** - No repetitive emotional appeals  
❌ **Hyperbole** - No exaggeration or overstatement  
❌ **Absolutism** - No "always," "never," "all," "none" without qualification  
❌ **Fear-mongering** - No apocalyptic or catastrophic framing  
❌ **Prophetic certainty** - No claims of divine revelation or mandate

---

## STRUCTURAL STANDARDS

### Document Organization

Every document should have:
1. **Clear title** - Descriptive, not clever
2. **Purpose statement** - Why this document exists
3. **Hierarchical headings** - H1 → H2 → H3 (no skipping levels)
4. **Logical flow** - Top-down, general to specific
5. **Summary or conclusion** - Key takeaways

### Heading Conventions

```markdown
# Primary Title (H1) - One per document

## Major Section (H2)

### Subsection (H3)

#### Detail Level (H4) - Use sparingly
```

Avoid H5 and H6 - restructure instead.

### List Formatting

**Ordered lists** for sequential steps:
```markdown
1. First step
2. Second step
3. Third step
```

**Unordered lists** for parallel items:
```markdown
- Item one
- Item two
- Item three
```

**Definition lists** for term/description pairs (if supported):
```markdown
Term
: Definition or explanation
```

---

## PARAGRAPH CONSTRUCTION

### Length

- **Ideal:** 2-4 sentences per paragraph
- **Maximum:** 6 sentences before breaking
- **Minimum:** 1 sentence (for emphasis only)

### Structure

Each paragraph should:
1. **Begin with topic sentence** - Main point first
2. **Support with evidence** - Facts, examples, quotes
3. **End with transition** - Connect to next idea (if needed)

### Cohesion

Use transition words:
- **Addition:** furthermore, moreover, additionally
- **Contrast:** however, nevertheless, conversely
- **Cause/Effect:** therefore, consequently, thus
- **Example:** for instance, specifically, namely
- **Sequence:** first, next, finally

---

## WORD CHOICE

### Precision

Use **specific terms** over vague ones:
- ❌ "things" → ✅ "tools," "resources," "documents"
- ❌ "stuff" → ✅ name the category
- ❌ "very" → ✅ use stronger adjective
- ❌ "really" → ✅ remove or quantify

### Formality

Maintain **professional but accessible** tone:
- Avoid slang: "gonna" → "going to"
- Avoid colloquialisms: "y'all" → "you all"
- Acceptable contractions: "don't," "can't," "it's"
- Spell out numbers under 10 (except dates, measurements)

### Cultural Sensitivity

Be mindful of:
- **Religious language** - Avoid assumptions about reader's faith
- **Regional expressions** - Avoid idioms that don't translate
- **Political terms** - Use neutral descriptive language
- **Charged words** - Avoid inflammatory or divisive terms

---

## EMPHASIS TECHNIQUES

### Typography

- **Bold** for key terms and strong emphasis
- *Italic* for subtle emphasis or introducing terms
- `Code` for technical terms, file names, commands
- > Blockquotes for citations or pull quotes
- ~~Strikethrough~~ for showing corrections (use sparingly)

### Capitalization

- Use **Title Case** for headings (major words)
- Use **sentence case** for lists and body text
- Use **ALLCAPS** only for acronyms (HTML, API, PDF)
- Never use ALLCAPS for emphasis

### Punctuation

- **Period (.)** - Standard sentence end
- **Comma (,)** - Pause, separation, serial lists
- **Semicolon (;)** - Connect related independent clauses
- **Colon (:)** - Introduce lists, examples, explanations
- **Em dash (—)** - Interruptive aside or emphasis
- **Hyphen (-)** - Compound words, word breaks
- **Ellipsis (...)** - Omission, not trailing thought
- **Exclamation (!)** - Use extremely sparingly (never more than once per 500 words)
- **Question (?)** - For genuine questions, not rhetorical flourish

---

## MARKDOWN CONVENTIONS

### Links

**Inline links** (preferred):
```markdown
[Link text](https://example.com)
```

**Reference links** (for repeated URLs):
```markdown
[Link text][ref]

[ref]: https://example.com
```

**File links** (repository-relative):
```markdown
[Document](path/to/file.md)
```

### Code Blocks

**Inline code:**
```markdown
Use `npm install` to install dependencies.
```

**Fenced code blocks:**
````markdown
```bash
npm install
npm run build
```
````

**With syntax highlighting:**
````markdown
```javascript
const result = process();
```
````

### Images

```markdown
![Alt text description](path/to/image.png)
```

Always provide **meaningful alt text** for accessibility.

### Tables

```markdown
| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
```

Keep tables simple. Complex data → consider lists or separate sections.

---

## SPECIAL CASES

### Legal Content

When discussing legal matters:
- Use **plain English** summaries
- Cite **specific statutes** or cases when relevant
- Include **disclaimers** ("This is not legal advice")
- Recommend **professional counsel** when appropriate
- Separate **belief** from **legal requirement**

### Religious Content

When discussing theology:
- Use **accessible language**, not seminary jargon
- Provide **Scripture references** in parentheses (Book chapter:verse)
- Acknowledge **diverse interpretations** when appropriate
- Avoid **prophetic or absolute claims**
- Separate **personal conviction** from **institutional doctrine**

### Technical Content

When writing about technology:
- Define **acronyms on first use**: "Application Programming Interface (API)"
- Provide **example commands** with expected output
- Include **prerequisites** and assumptions
- Link to **official documentation** when helpful
- Assume **intermediate technical literacy** unless stated otherwise

---

## REVISION CHECKLIST

Before finalizing any document, verify:

- [ ] **Clarity** - Can a non-expert understand this?
- [ ] **Accuracy** - Are all facts correct and verifiable?
- [ ] **Completeness** - Does this answer the intended question?
- [ ] **Consistency** - Does this match the repository's tone and style?
- [ ] **Correctness** - Are grammar, spelling, and punctuation correct?
- [ ] **Conciseness** - Can any words be removed without losing meaning?
- [ ] **Compliance** - Does this respect SYSTEM.md boundaries?

---

## ANTI-PATTERNS

### Do NOT Write Like This

❌ **Marketing Copy:**
> "Discover the revolutionary power of decentralized community empowerment!"

✅ **Plain Statement:**
> "Faith Frontier supports local businesses and mutual aid networks."

---

❌ **Fear-Based Framing:**
> "If we don't act now, the system will collapse and leave everyone destitute!"

✅ **Realistic Framing:**
> "Economic resilience requires diverse income sources and community support."

---

❌ **Prophetic Certainty:**
> "God has ordained this path and will bring judgment on those who oppose it."

✅ **Humble Conviction:**
> "We believe Christian stewardship calls us to care for neighbors and creation."

---

❌ **Jargon-Heavy:**
> "Leveraging synergistic stakeholder engagement to optimize value-add deliverables."

✅ **Plain Language:**
> "We work with community partners to provide useful services."

---

## QUALITY METRICS

### Good Writing Is:
- **Readable** - Grade level 8-10 (Flesch-Kincaid)
- **Scannable** - Headings, lists, short paragraphs
- **Accurate** - Facts check out, sources cited
- **Consistent** - Same terms, same style
- **Purposeful** - Every word earns its place

### Red Flags:
- Excessive exclamation marks (> 1 per 500 words)
- Sentences over 30 words without good reason
- Paragraphs over 150 words
- Undefined acronyms or jargon
- Claims without evidence or citation
- Emotional manipulation or urgency without cause

---

## INTEGRATION

This file works with:
- **SYSTEM.md** - Foundational constraints
- **DOMAIN.md** - Project-specific context
- **COMPLIANCE.md** - Legal/ethical bounds
- **OUTPUT_RULES.md** - Technical formats

Style decisions respect all upstream constraints.

---

**END - STYLE.md**
