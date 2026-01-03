# Version 2.0 Changes: Paper Type Guidance

## What's New

Version 2.0 adds **Part 0: Know Your Paper Type** - a comprehensive guide to tailoring writing advice based on the type of economics paper you're writing.

## Why This Matters

Economics papers are heterogeneous. A Chetty paper about neighborhoods uses concepts everyone understands. A Gentzkow or Keys paper about media markets or securitization requires explaining specialized institutions most readers don't know. The writing challenge differs dramatically.

## The Four Paper Types

### Type A: Intuitive Topic, Complex Identification
**Examples:** Chetty's neighborhood work, EITC papers, education interventions

**Key insight:** Readers understand the question ("Does neighborhood matter?"), so get to your identification strategy fast. Don't over-explain what neighborhoods are.

**Writing priorities:**
- Research design first
- Plain language for identification
- Concrete examples ("Chicago vs. Rapid City")
- Translate magnitudes to policy-relevant units

---

### Type B: Specialized Topic, Readers Need Context
**Examples:** Securitization, advertising pricing, media bias

**Key insight:** Most readers don't know the institutions. Must explain context before the question makes sense, but without drowning in institutional details.

**Writing priorities:**
- Lead with economic question
- Explain institutions concretely ("loans bundled and sold" not "asset-backed securitization")
- One institutional detail at a time
- Connect institutions to economic mechanism
- Use specific examples ($3.6T, not "substantial")

---

### Type C: Methodological Innovation
**Examples:** New econometric technique, novel measurement, new identification strategy

**Key insight:** Main contribution is HOW you answer the question. Must explain why existing methods fail and give intuition before math.

**Writing priorities:**
- Economic question first (method serves the question)
- Limitation of existing approach
- Intuition before math
- Simple example/special case
- Don't let method overshadow substance

---

### Type D: Theory Paper Applied to Data
**Examples:** Testing theoretical predictions, structural estimation

**Key insight:** Theory generates testable predictions. Keep model tractable, show clear mapping to observables.

**Writing priorities:**
- Motivate with empirical puzzle (not abstract theory)
- Simplest model that delivers predictions
- Show stylized facts, not just test statistics
- Clear mapping theory → data

---

## Diagnostic Questions

**1. Can a smart undergrad understand your research question without specialized knowledge?**
- YES → Type A
- NO → Type B or C

**2. What's your main contribution?**
- Novel identification for familiar outcome → Type A
- Understanding specialized institution → Type B
- New method/measurement → Type C
- Testing theory → Type D

**3. What do readers need most?**
- Believe your identification → Type A
- Understand the institution → Type B
- Understand your method → Type C
- See theory maps to data → Type D

**4. Where will readers get stuck?**
- "How do you know it's causal?" → Type A
- "What is this institution?" → Type B
- "How does this method work?" → Type C
- "Why this model?" → Type D

## Quick Reference Table

| Paper Type | Lead With | Spend Time On | Minimize | Key Risk |
|------------|-----------|---------------|----------|----------|
| **Type A: Intuitive** | Research question | Identification strategy | Motivation, background | Over-explaining familiar concepts |
| **Type B: Specialized** | Economic question + institution | Institutional explanation | Jargon, unnecessary details | Losing readers in weeds |
| **Type C: Methodological** | Economic question + limitation | Intuition for innovation | Math, generality | Method overshadowing substance |
| **Type D: Theory** | Empirical puzzle | Stylized facts, predictions | Abstract theory | Theory disconnected from data |

## Mixed Types

Many papers combine types:
- **B + A**: Specialized topic with novel identification (explain institution, then design)
- **C + B**: Method for specialized topic (question → institution → method)
- **D + A**: Theory with novel identification (puzzle → theory → identification)

**General principle:** Order exposition by what readers need to understand first. Build from familiar to unfamiliar, concrete to abstract.

## How to Use

1. **Identify your paper type** using diagnostic questions
2. **Read type-specific guidance** in Part 0
3. **Apply general principles** (Parts 1-7) with your type in mind
4. **When using prompt with Claude**, specify your paper type for tailored advice

## File Changes

- `economics_writing_prompt.md`: New Part 0 added (1,536 words)
- Total prompt: 10,813 words (~15k tokens)
- `CLAUDE.md`: Updated to reflect v2.0 structure

## Examples Used

- **Type A**: EITC paper (intuitive outcome, clever identification)
- **Type B**: Securitization paper (specialized institution explained clearly)
- **Type C**: Hypothetical bunching method (methodological innovation)
- **Type D**: Advertising pricing (theory prediction tested empirically)
