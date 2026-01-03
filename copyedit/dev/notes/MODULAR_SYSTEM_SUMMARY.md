# Modular Writing Review System - Implementation Summary

**Created:** 2025-11-10
**Status:** ✅ Complete

---

## What Was Built

A **composable, context-aware prompt system** for reviewing economics research papers that:
- Separates concerns by task (grammar, AI detection, structure, etc.)
- Adapts analysis to paper type (A/B/C/D)
- Allows mix-and-match workflows
- Provides focused guidance without overwhelming context

---

## Directory Structure

```
prompts/
├── master.prompt                       # 🎯 START HERE - Router with diagnostics
├── README.md                          # 📖 User navigation guide
│
├── tasks/                             # 5 task modules
│   ├── grammar.prompt                 # Objective errors only
│   ├── ai_detection.prompt            # AI tells (punctuation/structure/language)
│   ├── structure.prompt               # Organization and flow
│   ├── methodology.prompt             # Methods clarity (type-aware)
│   └── sentence_metrics.prompt        # Sentence length analysis
│
├── components/                        # 5 shared components
│   ├── paper_types.prompt             # Type A/B/C/D taxonomy
│   ├── quality_standards.prompt       # Analysis depth requirements
│   ├── latex_conventions.prompt       # LaTeX-specific rules
│   ├── economics_field.prompt         # Field conventions
│   └── output_formats.prompt          # Markdown templates
│
└── paper_type_overlays/               # 4 type-specific overlays
    ├── type_a_overlay.prompt          # Intuitive topic
    ├── type_b_overlay.prompt          # Specialized topic
    ├── type_c_overlay.prompt          # Methodological innovation
    └── type_d_overlay.prompt          # Theory + data
```

**Total:** 15 files organized in clear hierarchy

---

## How to Use

### Quick Start (Recommended)

1. Navigate to your draft folder with .tex files
2. Load `prompts/master.prompt` into Claude Code
3. Say what you want: "Fix grammar", "Check for AI tells", "Comprehensive review"
4. Answer diagnostic questions (paper type, scope)
5. Get organized output in `notes/` folder

### Example Usage

**Request:** "Check for AI tells"

**What happens:**
1. Master asks: "What type of economics paper is this?"
2. You select: "Type A: Intuitive topic, complex identification"
3. Master loads:
   - Shared components (quality standards, economics field norms, etc.)
   - Type A overlay (don't over-explain familiar concepts, focus on identification)
   - AI detection task (punctuation/structure/language patterns)
4. Launches parallel agents per file
5. Creates:
   - `notes/ai_screen.md` - 40-50 punctuation/structural tells
   - `notes/simplifications.md` - 80-100 language/wordiness items

---

## Key Design Decisions

### 1. Modular Composition (Not Monolithic)

**Instead of:** One giant 20k-token prompt for everything

**Built:** Composable pieces that combine on-demand
- Base components (always loaded)
- Paper type overlay (adapts to your paper)
- Task modules (just what you need)

**Benefit:** Focused context, no irrelevant guidance

---

### 2. Paper Type Awareness

Economics papers are heterogeneous:
- **Type A (EITC, neighborhoods):** Focus on identification, avoid over-explaining outcomes
- **Type B (securitization, media):** Explain institutions clearly, watch jargon
- **Type C (new methods):** Intuition before math, economics over technique
- **Type D (theory + data):** Show stylized facts, map theory to observables

**Each overlay modifies how tasks are performed** for that paper type.

---

### 3. Separation of Concerns

**Five distinct tasks:**
1. **Grammar** - Objective errors (spelling, syntax, LaTeX)
2. **AI Detection** - Patterns flagging AI-generated text
3. **Structure** - Organization and flow (high-level)
4. **Methodology** - Is identification/methods explained clearly?
5. **Sentence Metrics** - Quantitative rhythm analysis

**Run separately or combined** based on need.

---

### 4. Master Router with Diagnostics

The `master.prompt` acts as intelligent router:
- Interprets natural language requests
- Asks diagnostic questions
- Loads appropriate modules
- Executes with correct context
- Organizes deliverables

**User never has to think about which components to load.**

---

## Task Details

### Grammar Task (`tasks/grammar.prompt`)

**What:** Objective errors only (applied silently)
**Output:** Corrected .tex + `notes/copy_edits.md`
**Time:** Fast (direct edits)

**Fixes:**
- Spelling, homophones, commonly confused words
- Grammar (subject-verb agreement, tense, pronouns)
- Punctuation (commas, apostrophes, hyphens)
- LaTeX syntax errors
- Consistency issues

**Does NOT fix:** Style, wordiness, AI tells

---

### AI Detection Task (`tasks/ai_detection.prompt`)

**What:** Identifies AI-generated text patterns
**Output:** `notes/ai_screen.md` + `notes/simplifications.md`
**Time:** Moderate (parallel agents)

**Part 1 (ai_screen.md - 40-50 items):**
- Punctuation tells (em-dash overuse, excessive parentheticals)
- Sentence rhythm (monotonous length, robotic uniformity)
- List structures (artificial balance, enumeration overuse)
- Transition overuse (Moreover, Additionally, Furthermore)

**Part 2 (simplifications.md - 80-100 items):**
- Formulaic language ("This occurs because...", "Put differently...")
- Meta-commentary ("The paper proceeds in three parts...")
- Hedging (weak claims when evidence is strong)
- Over-explanation (Economics 101 to field experts)
- Wordiness (utilize→use, demonstrate→show)

**Deployment:** Parallel agents per file, comprehensive coverage

---

### Structure Task (`tasks/structure.prompt`)

**What:** High-level organization review
**Output:** `notes/structure_analysis.md`
**Time:** Moderate (reads full paper)

**Analyzes:**
- Introduction structure (inverted pyramid, RAP framework)
- Section ordering (appropriate for paper type)
- Paragraph flow (topic sentences, transitions)
- Headings quality
- Results presentation structure

**Not line-by-line** - strategic reorganization recommendations

---

### Methodology Task (`tasks/methodology.prompt`)

**What:** Are methods explained clearly for your paper type?
**Output:** `notes/methodology_review.md`
**Time:** Moderate (focuses on methods sections)

**Type A focus:** Identification strategy clarity
**Type B focus:** Institutional explanation adequacy
**Type C focus:** Method innovation explanation (intuition before math)
**Type D focus:** Theory-to-data mapping

**Heavily context-dependent** on paper type.

---

### Sentence Metrics Task (`tasks/sentence_metrics.prompt`)

**What:** Quantitative sentence analysis
**Output:** `notes/sentence_metrics.md`
**Time:** Moderate (parses all sentences)

**Calculates:**
- Mean/median/StdDev sentence length (overall + by section)
- Distribution patterns
- Consecutive sentences of similar length
- Missing short (< 12) or long (> 30) sentences
- Rhythm assessment

**Flags:** Robotic uniformity, monotonous sections
**Recommends:** Specific variations with examples

---

## Shared Components

### paper_types.prompt
- Type A/B/C/D definitions
- Diagnostic questions
- Writing priorities per type
- Examples from published papers

### quality_standards.prompt
- Analysis depth requirements (3-8 lines context, complete revisions)
- Coverage requirements (target item counts)
- Output organization (reading order, not alphabetical)
- Markdown format standards

### latex_conventions.prompt
- Correct LaTeX patterns (triple hyphens for em-dash)
- Common errors to fix
- What NOT to flag (intentional spacing, correct syntax)

### economics_field.prompt
- Natural field shorthand (IV diff-in-diff)
- What NOT to over-explain (Economics 101 concepts)
- Appropriate passive voice usage
- Citation conventions
- Appropriate formality level

### output_formats.prompt
- Templates for all output .md files
- Formatting guidelines
- Structure requirements

---

## Paper Type Overlays

Each overlay modifies task behavior:

### type_a_overlay.prompt
**For:** Intuitive topics (EITC, neighborhoods, education)
**Emphasis:** Get to identification fast, avoid over-explaining familiar outcomes
**Flags:** Unnecessary motivation, technical jargon for simple concepts, weak claims when ID is strong

### type_b_overlay.prompt
**For:** Specialized topics (securitization, advertising, media)
**Emphasis:** Clear institutional explanation, plain language before jargon
**Flags:** Jargon without definition, institution-dumps, missing concrete scale

### type_c_overlay.prompt
**For:** Methodological innovation
**Emphasis:** Economic question first, intuition before math, method serves economics
**Flags:** Method-first ordering, excessive generality, weak application

### type_d_overlay.prompt
**For:** Theory + empirics
**Emphasis:** Empirical puzzle motivation, stylized facts, theory-data mapping
**Flags:** Abstract theory first, unclear mapping, predictions unfalsifiable

---

## Example Workflows

### Scenario 1: "Fix grammar"
**Loads:** Grammar task only
**Creates:** Corrected .tex + `notes/copy_edits.md`
**Time:** Fast

### Scenario 2: "Check for AI tells" (Type A paper)
**Loads:** AI detection + Type A overlay
**Creates:** `notes/ai_screen.md` + `notes/simplifications.md`
**Special handling:** Flags over-explanation of familiar concepts, weak identification language
**Time:** Moderate

### Scenario 3: "Comprehensive review" (Type B paper)
**Loads:** Grammar + AI detection + Structure + Type B overlay
**Creates:** All .tex corrected + 4 .md files in notes/
**Special handling:** Structure check emphasizes institutional explanation quality
**Time:** Longer

### Scenario 4: "Is my identification clear?" (Type A)
**Loads:** Methodology + Type A overlay
**Creates:** `notes/methodology_review.md`
**Focus:** Plain English explanation, exogeneity argument, concrete examples
**Time:** Moderate

---

## Benefits of This Design

### 1. Plug-and-Play
- User says "fix grammar" in natural language
- System routes to appropriate module
- No need to understand system architecture

### 2. Context-Specific
- Type A paper gets different guidance than Type B
- Same task (e.g., structure) adapts to paper characteristics
- No irrelevant advice

### 3. Flexible
- Run single task or combine multiple
- Quick grammar check OR comprehensive review
- Mix and match as needed

### 4. Maintainable
- Single source of truth (shared components)
- Easy to update (change component, all tasks inherit)
- Clear responsibility (each file has one job)

### 5. Extensible
- Add new task: Create new file in tasks/
- Modify type handling: Edit appropriate overlay
- Update standards: Change component

---

## Comparison to Original copyedit.prompt

### Original System (copyedit.prompt)
- **Monolithic:** Single 500-line prompt with all guidance
- **All-or-nothing:** Full 3-part copyedit workflow only
- **Fixed:** Same analysis regardless of paper type
- **Manual:** User must understand structure to use

### New Modular System
- **Composable:** 15 files, mix and match
- **Granular:** Run just grammar, or just AI detection, or combined
- **Adaptive:** Analysis changes based on paper type
- **Intelligent router:** Master prompt interprets requests

### Migration Path
The original `copyedit.prompt` is now modularized as:
- Part 1 → `tasks/grammar.prompt`
- Part 2 → AI detection (punctuation/structure) in `tasks/ai_detection.prompt`
- Part 3 → AI detection (language) + simplifications in `tasks/ai_detection.prompt`

**Plus new capabilities:** Structure analysis, methodology review, sentence metrics

---

## Next Steps for Users

### Getting Started
1. Read `prompts/README.md` (user-facing guide)
2. Load `prompts/master.prompt`
3. Try: "Check for AI tells" on a draft

### Common Workflows
- **Before submission:** "Comprehensive review"
- **After writing intro:** "Is my introduction well structured?"
- **After methods section:** "Is my identification clear?" (Type A)
- **Quick polish:** "Fix grammar"

### Understanding Paper Types
- Read `components/paper_types.prompt`
- Use diagnostic questions
- Let master prompt help determine type

---

## Implementation Notes

### @IMPORT Syntax
Throughout prompts, you'll see:
```
@IMPORT: components/quality_standards.prompt
```

This is **conceptual annotation** indicating which components should be loaded. In practice, Claude Code will read and combine relevant files.

### File Reading Order
When organizing by file in output, use **reading order**:
1. introduction.tex
2. institutional_setting.tex
3. payment_costs.tex
4. real_effects.tex
5. redistribution.tex
6. conclusion.tex
7. appendix_*.tex

**NOT alphabetical order** - ensures reviewers read findings as paper flows.

### Parallel Agent Deployment
AI detection task uses parallel agents (one per file) for efficiency:
```
Uses a single message with multiple Task tool calls
```

Each agent reads file ONCE and performs both punctuation/structure AND language analysis.

---

## Files Created

**Total:** 15 files

**Prompts (14):**
- 1 master router
- 5 task modules
- 5 shared components
- 4 paper type overlays

**Documentation (1):**
- README.md navigation guide

---

## Success Criteria Met

✅ **Modular:** Tasks can be run separately or combined
✅ **Context-aware:** Paper type modifies analysis
✅ **Composable:** Shared components ensure consistency
✅ **Plug-and-play:** Natural language requests route correctly
✅ **Maintainable:** Single source of truth for standards
✅ **Extensible:** Easy to add new tasks or modify existing
✅ **Documented:** Clear navigation guide for users

---

## Version

**v1.0** - Initial implementation (2025-11-10)

Ready for use! 🎉
