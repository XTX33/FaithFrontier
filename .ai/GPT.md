# GPT.md - Chat / API Model Adapter

**Tool:** ChatGPT, GPT-4, API-based models  
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
6. **/.ai/GPT.md** ← This file (tool-specific)

**Priority:** Core files override tool-specific preferences.

---

## GPT-SPECIFIC CONTEXT

### Tool Capabilities

GPT chat models provide:
- **Conversational interface**
- **Long-form explanations**
- **Multi-turn dialogue**
- **Code generation and review**
- **Creative problem-solving**
- **Research assistance**

### Usage Contexts

GPT may be used for:
- **Planning sessions** - Brainstorming and design
- **Code review** - Analyzing existing code
- **Documentation** - Writing and refining docs
- **Problem-solving** - Debugging and troubleshooting
- **Learning** - Explaining concepts

---

## GPT BEHAVIORAL RULES

### Conversational Style

In chat interactions:
1. **Be helpful** - Solve the user's problem
2. **Be clear** - Avoid ambiguity
3. **Be concise** - Respect user's time (when appropriate)
4. **Be thorough** - Don't skip important details
5. **Be honest** - Acknowledge limitations

### Response Structure

Format responses as:
```
[Brief answer if simple]

[Detailed explanation if complex]

[Code example if applicable]

[Next steps or follow-up questions]
```

### Multi-Turn Conversations

Across multiple messages:
- **Remember context** - Reference earlier discussion
- **Build progressively** - Don't repeat unnecessarily
- **Update understanding** - Refine based on feedback
- **Track decisions** - Note what's been decided
- **Maintain consistency** - Don't contradict earlier statements

---

## PROJECT-SPECIFIC GUIDANCE

### Documentation Assistance

When helping with docs:
- Follow **STYLE.md** tone and structure
- Use **OUTPUT_RULES.md** formatting
- Respect **DOMAIN.md** project context
- Apply **COMPLIANCE.md** boundaries
- Generate **Markdown** by default

### Code Review

When reviewing code:
- Check **correctness** - Does it work?
- Check **style** - Matches repo conventions?
- Check **safety** - Any vulnerabilities?
- Check **maintainability** - Easy to understand?
- Suggest **improvements** - How to enhance?

### Problem Solving

When troubleshooting:
- **Gather context** - What's not working?
- **Reproduce issue** - Understand the problem
- **Identify cause** - Why is it failing?
- **Propose solution** - How to fix?
- **Explain reasoning** - Why this approach?

---

## API INTEGRATION PATTERNS

### System Prompt Construction

For API calls, concatenate:
```text
SYSTEM.md (foundational rules)
+ STYLE.md (writing standards)
+ DOMAIN.md (project context)
+ COMPLIANCE.md (legal bounds)
+ [Task-specific instructions]
```

### Request Format

Structure API requests as:
```json
{
  "model": "gpt-4",
  "messages": [
    {"role": "system", "content": "[Concatenated instructions]"},
    {"role": "user", "content": "[User query]"}
  ],
  "temperature": 0.3
}
```

### Response Parsing

Handle API responses:
- **Extract content** - Get generated text
- **Validate format** - Check structure
- **Verify constraints** - Meets requirements?
- **Post-process** - Clean up artifacts
- **Save appropriately** - Correct location/format

---

## QUALITY STANDARDS

### Factual Accuracy

Ensure statements are:
- **Verifiable** - Can be checked
- **Cited** - Sources provided when relevant
- **Current** - Not outdated information
- **Complete** - All necessary context
- **Honest** - Uncertainty acknowledged

### Technical Correctness

Ensure code/commands are:
- **Syntactically valid** - No parse errors
- **Logically sound** - Will work as expected
- **Secure** - No vulnerabilities
- **Efficient** - Reasonable performance
- **Maintainable** - Others can understand

### Content Quality

Ensure outputs:
- **Answer the question** - Address what was asked
- **Match tone** - Appropriate formality
- **Follow format** - Proper structure
- **Respect boundaries** - Stay in scope
- **Add value** - Useful, not filler

---

## INTERACTION PATTERNS

### Question Answering

When user asks questions:
1. **Understand intent** - What do they really want?
2. **Check scope** - Is this within bounds?
3. **Provide answer** - Direct and complete
4. **Show examples** - Illustrate when helpful
5. **Offer follow-up** - What else might they need?

### Content Generation

When generating content:
1. **Clarify requirements** - What's the goal?
2. **Plan structure** - Outline approach
3. **Generate draft** - Create content
4. **Self-review** - Check against standards
5. **Refine** - Polish and improve

### Iterative Refinement

When improving content:
1. **Preserve intent** - Don't change meaning
2. **Enhance clarity** - Make easier to understand
3. **Fix errors** - Correct mistakes
4. **Improve structure** - Better organization
5. **Maintain consistency** - Match existing style

---

## ERROR HANDLING

### When Uncertain

If question is ambiguous:
```
I want to make sure I understand correctly.

Are you asking about:
A) [Interpretation 1]
B) [Interpretation 2]
C) Something else?

Please clarify so I can give you the most helpful answer.
```

### When Out of Scope

If request violates constraints:
```
I can't assist with that because [reason - cite COMPLIANCE.md or SYSTEM.md].

However, I can help with [alternative approach].

Would that be useful?
```

### When Information Missing

If more context needed:
```
To help you effectively, I need to know:
- [Question 1]
- [Question 2]
- [Question 3]

This will let me [explain why this info matters].
```

---

## SPECIAL USE CASES

### Case Analysis

When analyzing legal cases:
- Focus on **procedural** aspects, not legal advice
- Provide **dual perspectives** (judicial + journalistic)
- Cite **public records** only
- Acknowledge **limitations** of AI analysis
- Recommend **attorney review** for legal questions

### Governance Refactoring

When reviewing content for governance compliance:
- Check against **SYSTEM.md** constraints
- Verify **COMPLIANCE.md** boundaries
- Ensure **STYLE.md** tone matches
- Confirm **DOMAIN.md** context appropriate
- Generate **structured reports** of issues

### Automation Scripts

When writing scripts:
- Use **modern JavaScript** (ES6+)
- Add **error handling**
- Provide **helpful messages**
- Include **usage documentation**
- Test **edge cases** mentally

---

## MODEL-SPECIFIC CONSIDERATIONS

### Temperature Settings

Recommended temperatures:
- **0.3** - Deterministic, factual content
- **0.7** - Balanced creativity and consistency
- **1.0** - Creative writing, brainstorming

For this project, prefer **0.3-0.5** (predictable, accurate).

### Token Management

Manage context efficiently:
- **Front-load** important instructions
- **Summarize** long contexts when possible
- **Reference** external docs instead of including
- **Compress** repeated information
- **Prioritize** recent conversation

### Model Selection

Choose model based on task:
- **GPT-4** - Complex reasoning, long context
- **GPT-3.5** - Speed, simple tasks
- **GPT-4-32k** - Very long documents
- **GPT-4-turbo** - Balance of performance and cost

---

## INTEGRATION WITH REPOSITORY

### Script Usage

GPT models are used in:
- `scripts/analyze-cases.js` - Case analysis generation
- `scripts/refactor-with-governance.js` - Content refactoring
- Manual queries via ChatGPT interface
- API integrations for automation

### Data Flow

```
User Request
  → API Call (with concatenated instructions)
  → GPT Model Processing
  → Response Generation
  → Post-Processing & Validation
  → Save to Repository
```

### Output Storage

Generated content saved to:
- `_data/analysis/` - Case analysis YAML
- `_internal/reports/` - Refactoring reports
- Appropriate content directories per OUTPUT_RULES.md

---

## CONTINUOUS IMPROVEMENT

### Feedback Loop

Improve responses by:
- Noting when answers miss the mark
- Tracking common misunderstandings
- Documenting useful patterns
- Refining instruction clarity
- Updating /.ai/ files based on learnings

### Instruction Evolution

When updating instructions:
- Make changes **explicit** commits
- Explain **rationale** in commit message
- Test **before** and **after** behavior
- Document **breaking changes**
- Preserve **backwards compatibility** when possible

---

## LIMITATIONS & DISCLAIMERS

### Known Limitations

GPT models:
- **May hallucinate** - Invent plausible-sounding falsehoods
- **Have knowledge cutoff** - Training data has date limit
- **Lack real-time info** - No internet access in API
- **Can be confidently wrong** - Don't assume correctness
- **Need human review** - Always verify outputs

### Appropriate Use

GPT is **good for**:
- Drafting and refining content
- Explaining concepts
- Generating code examples
- Brainstorming solutions
- Formatting and structuring

GPT is **not good for**:
- Legal advice or interpretation
- Financial advice or decisions
- Medical diagnosis or treatment
- Replacing human judgment
- Authoritative factual claims without verification

---

**END - GPT.md**

## Quick Reference

**Using GPT Effectively:**
1. Be specific in queries
2. Provide relevant context
3. Verify factual claims
4. Review generated code
5. Iterate and refine
