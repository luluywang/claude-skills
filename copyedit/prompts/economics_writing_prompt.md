# Economics Writing Improvement Prompt

**Version 2.1 | ~13,000 words**

This prompt provides comprehensive guidance for writing clear, effective economics research papers. It synthesizes principles from three authoritative writing guides (McCloskey's *Economical Writing*, Cochrane's *Writing Tips for Ph.D. Students*, and Chaubey's *The Little Book on Research Writing*) and illustrates them with examples from published economics papers.

**New in v2.1:** Section 0 streamlined to brief summaries. For detailed paper type guidance with exemplars, see `shared/paper_type_overlays/`.

---

## HOW TO USE THIS PROMPT

**For improving a draft:**
1. Copy this entire prompt into a conversation with Claude
2. Identify your paper type using Section 0 diagnostic questions
3. Optionally, load the detailed type overlay from `shared/paper_type_overlays/type_X_overlay.prompt`
4. Paste your draft text after the prompt
5. Ask Claude to apply the principles to improve specific sections or the entire draft

**For guidance while writing:**
- Reference specific sections as needed (e.g., "Help me write a strong introduction using Section 1")
- Ask Claude to check if your writing follows specific principles
- Request examples of how to apply particular techniques

**For targeted review:**
- Use `/copyedit` for specific tasks (grammar, AI detection, structure, etc.)
- See SKILL.md for complete documentation

---

# PART 0: KNOW YOUR PAPER TYPE

## 0.1 Why Paper Type Matters

Economics papers are heterogeneous. A Chetty paper about neighborhood effects uses concepts everyone understands (neighborhoods, kids, income). A Gentzkow paper about media bias or a Keys paper about securitization requires explaining specialized institutional details that most readers don't know.

**The writing challenge depends on your paper type:**
- **Intuitive topic + complex method** → Spend time on identification, less on motivation
- **Specialized topic + standard method** → Spend time explaining institutions, concepts
- **Technical innovation** → Balance explaining the innovation with showing why it matters
- **Broad audience appeal** → Minimize jargon, maximize concrete examples

**Note:** This section provides brief summaries for quick diagnosis. For detailed guidance with exemplars and excellence markers, see the type-specific files in `shared/paper_type_overlays/`.

## 0.2 The Four Main Paper Types

### Type A: Intuitive Topic, Complex Identification

**Examples:** Chetty's neighborhood mobility work, EITC labor supply papers, education interventions

**Key Characteristics:**
- Outcomes everyone cares about (income, education, health, neighborhoods)
- Challenge is credible identification, not explaining what you're measuring
- Can motivate quickly—readers already believe topic matters
- Institutional details serve identification strategy

**Writing Priorities:**
1. **Get to research design fast:** Title → research design in <200 words
2. **Minimize motivation:** Readers already care about neighborhoods/education/health
3. **Explain identification in plain language:** One-sentence distillation of the insight
4. **Use concrete examples:** "6.5% in Chicago vs. 0.6% in Rapid City" not "substantial heterogeneity"
5. **Translate magnitudes:** Economic interpretation, not just coefficients

**Common Trap:** Explaining the obvious. Don't waste paragraphs on "why education matters."

**For detailed guidance:** See `shared/paper_type_overlays/type_a_overlay.prompt`

---

### Type B: Specialized Topic, Readers Need Context

**Examples:** Securitization papers, advertising pricing, media bias, financial instruments

**Key Characteristics:**
- Specialized institutions that readers don't know (securitization, ad markets, media)
- Institutional variation drives research design (FICO 620 rule, auction formats)
- Risk of losing readers in institutional details
- Need balance: enough context to understand, not so much you lose the economics

**Writing Priorities:**
1. **Lead with economic question:** Frame before explaining institutions
2. **Define every specialized term immediately:** Inline definitions, concrete examples
3. **Layer institutional details:** One concept at a time, building complexity gradually
4. **Connect institutions to economics:** Show how institutional features affect incentives/behavior
5. **Use figures for complex institutions:** Pictures teach faster than words

**Common Trap:** "Institutional report syndrome." Reading like industry white paper instead of economics.

**For detailed guidance:** See `shared/paper_type_overlays/type_b_overlay.prompt`

---

### Type C: Methodological Innovation

**Examples:** New econometric technique, novel measurement, structural model innovation

**Key Characteristics:**
- Methodological contribution—the "how" matters
- Must answer real economic question, not just demonstrate technique
- Balance: enough technical detail to be credible, not so much economics is lost
- Need validation: show method works in practice, generalizes beyond one application

**Writing Priorities:**
1. **State economic question first:** What puzzle does this method solve?
2. **Explain why existing methods fail:** Motivate innovation with real limitation
3. **Intuition before math:** Explain key insight in words before equations
4. **Simple example first:** Two-platform/two-period case before general model
5. **Show economic payoff:** Explain stylized facts, quantitative fit with parsimony
6. **Demonstrate robustness:** Multiple settings, not cherry-picked application

**Common Trap:** "Method for method's sake." Impressive technique but unclear economic insight.

**For detailed guidance:** See `shared/paper_type_overlays/type_c_overlay.prompt`

---

### Type D: Theory Paper Applied to Data

**Examples:** Testing theoretical predictions, structural estimation, classic growth empirics (MRW)

**Key Characteristics:**
- Theory is organizing framework—generates testable predictions
- Empirics test theory, assess which theory fits, or show where augmentation needed
- Balance: theory simple enough to test, rich enough to be interesting
- Honest engagement: acknowledge failures, show theory-guided fixes

**Writing Priorities:**
1. **Motivate with empirical puzzle:** "Does Solow model explain income differences?" not "Consider an economy..."
2. **Crisp theory summary before equations:** 8-10 sentences in plain language
3. **Clear theory-to-data mapping:** Explicit about how theoretical variables map to data
4. **Show quantitative fit:** R², predicted magnitudes, not just significance
5. **Be honest about failures:** Diagnose what doesn't work, fix with theory
6. **Discuss alternative theories:** What distinguishes your prediction?

**Common Trap:** "Model dump." Pages of derivations before stating empirical question.

**For detailed guidance:** See `shared/paper_type_overlays/type_d_overlay.prompt`

---
## 0.3 Diagnostic Questions: What Type Is Your Paper?

Ask yourself:

**1. Can a smart undergrad understand your research question without specialized knowledge?**
- YES → Type A (intuitive topic)
- NO → Type B (specialized topic) or Type C (methodological)

**2. What's your main contribution?**
- Novel identification strategy for familiar outcome → Type A
- Understanding of specialized institution/market → Type B
- New method or measurement → Type C
- Testing theoretical predictions → Type D

**3. What do readers need most?**
- Believe your identification → Type A (focus on research design)
- Understand the institution → Type B (explain context clearly)
- Understand your method → Type C (intuition before math)
- See theory maps to data → Type D (clear predictions)

**4. Where will readers get stuck?**
- "How do you know it's causal?" → Type A
- "What is this institution/market?" → Type B
- "How does this method work?" → Type C
- "Why this model?" → Type D

## 0.4 Type-Specific Writing Guidance Summary

| Paper Type | Lead With | Spend Time On | Minimize | Key Risk |
|------------|-----------|---------------|----------|----------|
| **Type A: Intuitive Topic** | Research question | Identification strategy | Motivation, background | Over-explaining familiar concepts |
| **Type B: Specialized Topic** | Economic question + concrete institution | Clear institutional explanation | Jargon, unnecessary details | Losing readers in institutional weeds |
| **Type C: Methodological** | Economic question + method limitation | Intuition for innovation | Math, generality | Method overshadowing substance |
| **Type D: Theory + Data** | Empirical puzzle | Stylized facts, testable predictions | Abstract theory | Theory disconnected from data |

## 0.5 Mixed Types

Many papers combine types:
- **Specialized topic + novel identification** (Type B + A): Explain institution first, then research design
  - Example: Securitization paper has both institutional context (Type B) and clever identification (Type A: 620 rule)
  - Priority order: Economic question → institutional setup → identification strategy
- **Methodological innovation for specialized topic** (Type C + B): Lead with economic question, explain institution, then method
  - Example: Structural model of advertising with institutional features
  - Priority order: Economic puzzle → institutional facts → model innovation
- **Theory with novel identification** (Type D + A): Empirical puzzle → theory → identification
  - Example: Testing auction theory using regression discontinuity
  - Priority order: Theoretical prediction → identification strategy → empirical test

**General principle:** Order your exposition by what readers need to understand first. Build from familiar to unfamiliar, concrete to abstract.

---

# PART 1: STRUCTURAL PRINCIPLES

## 1.1 The Inverted Pyramid: Put the Punchline First

### Core Principle
Organize papers like newspapers, not like mystery novels. Start with your most important contribution, then fill in details for readers who continue.

### The Problem with Traditional Structure
Most Ph.D. papers get this exactly wrong. They spend pages on philosophy, motivation, and literature review before finally revealing the contribution in Table 12 or the conclusion. By then, most readers have given up or fallen asleep.

### What to Do Instead

**From Cochrane:**
> "Notice how newspapers start with the most important part, then fill in background later for the readers who kept going and want more details. A good joke or a mystery novel has a long windup to the final punchline. Don't write papers like that — put the punchline right up front and then slowly explain the joke."

**From Chaubey (RAP Framework):**
> "Descending structure allows more types of readers to learn from your writing... Barbara Minto's Pyramid Principle: analytical writing can be structured as a logical dialog between the reader and the writer, and the reader prefers being allowed to descend from the high level to the details."

### Actionable Guidelines
- State your central contribution in the first paragraph—no exceptions
- Never make readers wait until late in the paper to learn your main finding
- Remember: readers are busy and impatient; they skim rather than read linearly
- Think of each paragraph as answering "what do I need to know to understand what comes next?"

### Example: Mankiw, Romer, Weil (QJE 1992)

Their abstract opens with:
> "This paper examines whether the Solow growth model is consistent with the international variation in the standard of living. It shows that an augmented Solow model that includes accumulation of human as well as physical capital provides an excellent description of the cross-country data."

**Why it works:** In two sentences, readers know (1) what the paper tests, and (2) what it finds. No throat-clearing about "the importance of growth theory" or "extensive literature." The punchline comes first.

---

## 1.2 The Central Contribution: The RAP Framework

### Core Principle
Every paper has ONE central contribution. Everything else supports this. Distilling it takes painful thought but transforms your paper.

### The RAP Framework (Chaubey)

Your paper's spine consists of three elements:

**R (Research Question)**
- The question a reader might articulate whose answer lies in your paper
- Helps readers recognize your paper as relevant to their interests
- Keep many versions from the start; get feedback; think about primary and secondary audiences

**A (Answer)**
- Summarizes your main findings in concrete terms
- Should be a higher-level idea that leads readers down to detailed findings
- Extract the main message from the details

**P (Positioning Statement)**
- Shows readers the space in the literature that R and A occupy
- Makes readers infer: (1) current state of knowledge, (2) worthwhile direction to advance it, (3) how R moves in that direction
- P makes space for R; R is answered by A
- P should naturally lead readers to A

### Common RAP Orderings
- **RPA**: Most common (question, positioning, answer)
- **ARP**: Lead with findings when they're striking
- **PRA**: When positioning is crucial context

Try different combinations for different audiences.

### Actionable Guidelines

**From Cochrane:**
> "Figure out the one central and novel contribution of your paper. Write this down in one paragraph... Distilling your one central contribution will take some thought. It will cause some pain, because you will start to realize how much you're going to have to throw out."

- Write your contribution concretely, not abstractly
- BAD: "I analyzed data on executive compensation and found many interesting results"
- GOOD: "Two easily measured variables, size and book-to-market equity, combine to capture the cross-sectional variation in average stock returns" (Fama-French 1992)
- The RAP should run through your paper like its spine, linking parts into a whole

### Example: EITC Paper Opening

> "We estimate the impacts of the Earned Income Tax Credit on labor supply using local variation in knowledge about the EITC schedule. We proxy for EITC knowledge in a ZIP code with the fraction of individuals who manipulate reported self-employment income to maximize their EITC refund. This measure varies significantly across areas. We exploit changes in EITC eligibility at the birth of a child to estimate labor supply effects."

**Why it works:** Four crisp sentences that give you the complete RAP:
- **R**: How does the EITC affect labor supply?
- **A**: It increases earnings, especially on the intensive margin
- **P**: We solve the identification problem using geographic variation in knowledge (implicitly positioning against papers that can't separate knowledge from incentives)

---

## 1.3 Introduction Structure

### Core Principle
Start with your contribution, not with philosophy, policy importance, or literature review. The first sentence is the hardest and most important.

### Two-Part Introduction Structure (Chaubey)

**Part 1: Provoke Curiosity (Use P from RAP)**
- Help readers learn the context of your paper
- Identify skeleton points and insert readers' most logical questions
- Take up only as much space as an impatient reader will give you before wanting the main business

**Part 2: Deliver the Goods (Follow RAP)**
- Help readers visualize what's coming
- Tell a storyline they can recognize
- Prepare them for the body of the paper
- Pick up ideas from section takeaways to write intro paragraphs

**Bridge Between Parts**
- Transition paragraph from what other papers do to what your paper does

### What NOT to Do

**From Cochrane:**
> "Do not start with philosophy, 'Financial economists have long wondered if markets are efficient.' Do not start with 'The finance literature has long been interested in x.' Your paper must be interesting on its own, and not just because lots of other people wasted space on the subject."

**From McCloskey:**
> "Never start a paper with that all-purpose filler for the bankrupt imagination, 'This paper...'"

### Avoid These Opening Gambits
- "This paper..." (lazy and bureaucratic)
- Grand contextual statements only vaguely hinting at your paper's importance
- "Economists have long wondered..." (throat-clearing)
- "The literature has debated..." (get to YOUR contribution)
- "This topic is important for public policy..." (everyone knows; get to your point)

### Actionable Guidelines
- Three pages maximum for introduction
- First sentence must state your central contribution with the fact behind it
- No "roadmap paragraphs" listing section numbers—readers will figure it out
- Check coherence: extract the first sentence of each paragraph—do they tell a story?
- Use key words consistently; first sentence of each paragraph should carry forward a phrase from the previous one

### Example: Mankiw, Romer, Weil Opening

> "This paper takes Robert Solow seriously. In his classic 1956 article Solow proposed that we begin the study of economic growth by assuming a standard neoclassical production function with decreasing returns to capital."

**Why it works:** "This paper takes Robert Solow seriously" is memorable, direct, and sets up the contribution. No throat-clearing. The subsequent sentences are models of clarity: subject-verb-object with no clutter. Each conveys exactly one thought.

---

## 1.4 Literature Review: After Your Contribution

### Core Principle
Literature review comes AFTER you've explained your contribution, not before. Most readers haven't read those other papers anyway.

### Why Literature First Doesn't Work

**From Cochrane:**
> "Do not start your introduction with a page and a half of other literature. First, your readers are most interested in just figuring out what you do. They can't start wondering if it's better than what others have done until they understand what you do. Second, most readers do not know the literature."

### What to Include
- Make it a separate section or set it off so people can skip if uninterested
- Focus on 2-3 closest current papers
- Give proper credit to people who deserve priority for ideas that might otherwise seem new
- Be generous—you don't need to say everyone else was wrong for your contribution to matter

### What to Avoid
- Journal of Economic Literature-style comprehensive reviews
- Strategic citations just to please potential referees (at least cut these in final version)
- Citations of entire books without page numbers
- Literature dump in introduction before readers know what YOU do

### Actionable Guidelines

**From McCloskey:**
> "Citing whole books and articles is a disease in modern economics, spread by the author-date citation... By not bothering to find [the page] the author misses the chance to reread, and think."

- Cite specific pages, not entire books
- Set your paper against 2-3 closest papers
- Don't abbreviate authors' names: "Fama and French" not "FF"
- Remember: it's hard to explain how your paper differs from others when readers don't understand YOUR paper yet

---

## 1.5 Getting to the Main Result Fast

### Core Principle
There should be nothing before the main result that a reader does not need to know to understand it.

### The Problem

**From Cochrane:**
> "Your task now is to get to the central result as fast as possible. Most papers do precisely the opposite: They have a long motivation, a long literature review, a big complex model that then gets ignored, descriptive statistics, preliminary results, a side discussion or two and then finally Table 12 of 'main estimates.' By then we're all asleep."

### What to Cut Before Main Results
- Warm-up exercises
- Extensive data description (especially of well-known datasets)
- Preliminary estimates or replication of others' work
- Motivation via all your failures
- General versions of models you then specialize
- Descriptive statistics that don't directly set up the main result

### Theory Sections

**From Cochrane:**
> "The theory is there to help understand the empirical work... Do not write a 'general' model and then 'for the empirical work, we now specialize the general shock process to an AR(1)...' Work out only the specialized model that you actually take to data."

**For most papers:** If the answer to "does this paper expand our knowledge of economic theory?" is "no," then minimize theory. Include only what readers need to understand empirical results.

### After Main Result
- Follow with graphs and tables giving intuition
- Show the result is a robust feature of stylized facts in data
- Limited responses to potential criticisms
- Robustness checks (most should go to web appendix)

### Example: Advertising Pricing Paper Abstract

> "Existing theories of media competition imply that advertisers will pay a lower price in equilibrium to reach consumers who multi-home across competing outlets. We generalize, extend, and test this prediction. We find that television outlets whose viewers watch more television charge a lower price per impression to advertisers."

**Why it works:** Theory prediction stated, then the test, then the finding—all in three sentences. No extended theory section, no literature review. The main empirical result comes immediately.

---

## 1.6 Paragraph Structure: Every Paragraph Has a Point

### Core Principle
Paragraphs answer questions provoked by what came before. First sentences convey the main message and link to the overall story.

### The Three Properties of First Sentences (Chaubey)

**From Chaubey:**
> "The first sentence of each paragraph should offer the paragraph's RAP-relevant main message while provoking follow-up questions that will be answered in its body."

1. **Includes the main message** (an idea, not a detail)
2. **Links to the overall story** (use key words from RAP)
3. **Provokes follow-up questions** (that the paragraph answers)

### Paragraph Length and Structure
- 5-6 sentences per paragraph is ideal
- If longer, you've likely buried an idea readers will miss
- But structure matters more than length
- Key ideas often (unfortunately) end up at the bottom because we write to refine our thoughts
- Solution: Move key ideas to the top

### Testing Paragraph Coherence

**From Chaubey:**
> "One way to check that your paragraphs form a storyline is to take the first sentence of every paragraph, put them in a separate document, and see if others can follow the logic."

**From McCloskey:**
> "Link each sentence to the previous one through repeated words or concepts. Use transitive writing: (AB)(BC)(CD) not (AB ZYX)(MNOP)(BJKLC)."

### Actionable Guidelines
- First sentence of each paragraph should carry forward at least one phrase from the previous first sentence
- Linguistic links help readers recognize logical links
- Don't use interchangeable terms to refer to the same thing—use ONE word consistently
- Paragraphs should have points, not just information dumps
- Ask yourself: What question does this paragraph answer?

### Example: Mankiw, Romer, Weil Paragraph

> "Yet all is not right for the Solow model. Although the model correctly predicts the directions of the effects of saving and population growth, it does not correctly predict the magnitudes. In the data the effects of saving and population growth on income are too large. To understand the relation between saving, population growth, and income, one must go beyond the textbook Solow model."

**Why it works:**
- Topic sentence "all is not right" signals the main message
- Following sentences provide evidence (wrong magnitudes)
- Final sentence points to the solution (augment the model)
- A skimmer reading only first sentences would understand the logical flow

---

## 1.7 Headings and Takeaways

### Core Principle
Headings should answer readers' questions, not just organize your thoughts.

### Takeaways Under Headings (Chaubey)

**Write headings with key takeaways:**
- Less than 4 sentences for section takeaways
- Less than 2 sentences for subsection takeaways
- A reader skimming headings and takeaways should know where to find answers to questions

**What takeaways should include:**
1. Main message of the heading
2. Link to overall story (use key words)
3. Preparation for details that follow
4. Provocation of follow-up questions answered in the section

### Designing Reader-Driven Headings

**From Chaubey:**
> "Headings should help readers get answers to their own basic questions: what do you do in this paper? They should navigate any reader; only after this is secure turn to expert readers and think through questions they might expect to be answered."

- Use key words consistently (they're not key words if not used consistently)
- Write subheadings by adding specifics to key words
- Ask readers what order they expect their questions answered in
- First consider any reader, then the experts

### Example from Practice
- BAD: "Model" / "Data" / "Results" (too vague)
- BETTER: "A Model of Screening Under Securitization" / "Data on Mortgage Originations Near the 620 Threshold" / "Securitization Reduces Screening Intensity"
- BEST: Use declarative headings that state findings: "Securitization Leads to 25% Higher Default Rates"

---

## 1.8 Conclusions: Short or Omit

### Core Principle
If you explained your contribution well in the introduction and documented it in the body, conclusions are nearly redundant.

**From Cochrane:**
> "Really, a conclusions section should not be necessary. If you did a good job of explaining your contribution in understandable prose in the introduction, and then documenting those claims in the body of the paper, (writing in good triangular style), then saying it all over again is pointless."

### What to Include (If You Must Have Conclusions)
- Keep it short (one page maximum)
- Do NOT restate all findings—you've said them three times already
- Can include short paragraph acknowledging limitations
- Can suggest implications beyond those in the paper
- Keep it factual—don't speculate

### What NOT to Include
- "I leave x for future research" (we're less interested in your plans than your results)
- Grant applications outlining future research
- Repetition of everything you've said
- Opinions rather than facts

**From McCloskey:**
> "Avoid overtures, and do not give elaborate summaries of what you have said. Never repeat without apologizing for it ('as I said earlier'; or merely 'again')."

---

# PART 2: STYLISTIC PRINCIPLES

## 2.0 McCloskey's Rules and Craft Principles

> **Note:** For the complete systematic documentation of all McCloskey's rules, see `mccloskey_rules_complete.md`. This section highlights the most frequently violated and actionable rules.

### 2.0.1 The Cardinal Rule: BE CLEAR

**From Quintilian (via McCloskey):**
> "Write not merely so that the reader can understand but so that he cannot possibly misunderstand."

**Clarity is a social matter.** If the reader thinks it's unclear, it IS unclear—by definition. The reader is sovereign.

### 2.0.2 McCloskey's Ten Named Rules You Must Know

#### 1. The Rule of Coherence: Make Writing Hang Together
- **Repeat key words** (don't use "elegant variation")
- Use parallel structure for parallel ideas
- Link sentences through repeated words or concepts
- **Wrong:** "The price rose. The increase in value reflected supply shifts. The elevation of the quotation..."
- **Right:** "The price rose. The price increase reflected supply shifts. The higher price..."

#### 2. Gardner's Rule: Don't Complicate All Three (Subject, Verb, Object)
- Choose only ONE part of the sentence for elaboration
- If subject is complex, keep verb and object simple
- **Bad:** "The consideration by the Council of the question of compensation for victims using cost-benefit analysis was completed."
- **Good:** "The Council completed its consideration of compensating crime victims, using cost-benefit analysis."

#### 3. The Rule of Arrangement: End = Emphasis
- Put important matters at the **end** of the sentence
- Put less important matters at the **beginning**
- Dump trivial matters in the **middle** (or trash)
- The reader leaves the sentence with the last word ringing in her ears

#### 4. The Read-Aloud Rule
- Don't write anything you'd be embarrassed to read aloud to your intended audience
- If it embarrasses you imagining Professor Smith reading it, fix it
- Your ear detects bad spots your eye misses

#### 5. Sydney Smith's Rule: Cut Ruthlessly
- "Run your pen through every other word you have written; you have no idea what vigour it will give to your style"
- Every word that doesn't work is a word too many

#### 6. Fowler's Rule: Avoid Elegant Variation
- Use one word to mean one thing consistently
- Don't fear repeating important words—repetition creates coherence
- "Elegant variation" creates confusion

#### 7. Strunk and White's Rule: Express Parallel Ideas in Parallel Form
- **Bad:** "The study examines prices, investigates quantities, and demand elasticities are estimated"
- **Good:** "The study examines prices, investigates quantities, and estimates demand elasticities"

#### 8. Do Not Overuse Commas
- Use punctuation by ear, not by rule
- Delete most commas before "the"—"the" signals a new phrase well enough
- Read aloud to test punctuation

#### 9. Query Every "This"
- Take most of them out
- **Bad:** "This shows that demand is elastic"
- **Better:** "The evidence shows that demand is elastic"
- Or repeat the noun: "This elasticity implies..."

#### 10. Find the Action and Make It a Verb
- Avoid nominalization (turning verbs into nouns)
- **Bad:** "Data reanalysis need exists"
- **Good:** "We must reanalyze our data"
- Circle every "is" in your prose—replace with action verbs

### 2.0.3 Miss Jones' Bad Rules (REJECT THESE)

These are **wrong** rules from eighth-grade English that have "nearly ruined economic prose":

#### 1. The Jonesian Rule of Arrangement (THE WORST)
"Say what you're going to say; say it; say that you've said it."

**McCloskey's verdict:** "The person who made up this memorable phrasing is burning right now in Hell."

This creates:
- Table-of-contents paragraphs ("Section 2 presents the model...")
- Endless summaries and repetition
- Roadmap paragraphs readers skip

**Better:** Just say it once, clearly.

#### 2. Never Repeat the Same Word Within Three Lines
**WRONG.** You MUST repeat words to achieve coherence.

#### 3. Never Write "I"
Senseless if it just results in replacing "I" with "we" or "the author." Use "I" when appropriate.

#### 4. Don't Be Common; Write Fancy
**WRONG.** Be plain instead. Use Anglo-Saxon words over Latin pomposity:
- Not "utilize" → "use"
- Not "commence" → "begin"
- Not "purchase" → "buy"

#### 5. Never Split Infinitives
H.W. Fowler demolished this in 1926. "To really understand" is fine.

#### 6. Never End with a Preposition
Churchill: "This is the sort of impertinence up with which I will not put." Use final prepositions when they sound better.

### 2.0.4 Writing as Craft: Meta-Principles

#### Writing Is a Skill, Not a Character Trait
- "Amateur writers suppose that writing is a character trait instead of a skill"
- Professional writers take advantage of criticism
- Anyone can improve with practice
- Defending bad writing as "personal style" is amateurish

#### Writing IS Thinking
- Don't wait until research is done to begin writing
- Writing clarifies muddy thinking
- Write early and continuously throughout research
- Writing is not transcription of completed thought—it IS thought

#### The Social Nature of Writing
- Choose an Implied Reader: specific person (Professor Smith, friend down the hall)
- Choose an Implied Author: persona you adopt (Reasonable Journeyman, not Pompous Authority)
- If it embarrasses you imagining your reader, it's embarrassing—fix it

### 2.0.5 Bad Words to Avoid (McCloskey's List)

**Strike these immediately:**
- **"Via"** → "through"
- **"Process of"** → strike it
- **"And/or"** → pick one or rephrase
- **"Respectively"** → makes reader look back; rephrase
- **"The existence of"** → just name the thing
- **"Hypothesize"** → "suppose," "expect," "guess"
- **"Individuals/agents"** → "people" (or be specific: "firms," "households")
- **"Implement"** → "do," "carry out," "use"
- **"Concept"** → "idea," "notion," "thought"
- **"Situation"** → often padding; be specific
- **"Time frame"** → "time"
- **"Former/latter"** → makes reader look back; repeat the nouns
- **"Very"** → weak; use stronger verbs instead

### 2.0.6 Orwell's Six Rules (from "Politics and the English Language")

1. Never use a metaphor, simile, or figure of speech you're used to seeing in print (avoid clichés)
2. Never use a long word where a short one will do
3. If it is possible to cut a word out, always cut it out
4. Never use the passive where you can use the active
5. Never use a foreign phrase, scientific word, or jargon word if you can think of an everyday English equivalent
6. **Break any of these rules sooner than say anything outright barbarous**

### 2.0.7 Quick Revision Checklist

**Use this for every draft:**

1. ☐ Circle every "is"—replace with action verbs
2. ☐ Query every "this"—add noun or use "the"
3. ☐ Search for passive voice—convert to active
4. ☐ Delete adjectives and adverbs describing your own work
5. ☐ Strike bad words from McCloskey's list (via, process of, respectively, etc.)
6. ☐ Check for Miss Jones violations (table of contents paragraphs, elegant variation)
7. ☐ Test Gardner's Rule: Is more than one part (subject/verb/object) complex?
8. ☐ Check arrangement: Is the important part at the end of sentences?
9. ☐ Read aloud—would you be embarrassed to say this to your intended reader?
10. ☐ Cut every other word (Sydney Smith's Rule)—can you make the same point in less space?

**Most important:** Remember that clarity is social. If a conscientious reader finds a passage unclear, it IS unclear and must be rewritten.

**For comprehensive copy editing:** See Part 6 for the full Copy Editing Protocol, which distinguishes between:
- **Section 6.1**: Objective errors (grammar, spelling, punctuation) that should be auto-fixed
- **Section 6.2**: Clarity and style issues (like this checklist) that require your judgment

---

## 2.1 Clarity: The Golden Rule

### Core Principle
Write so the reader cannot possibly misunderstand. Clarity is a social matter—if the reader thinks it's unclear, it is, by definition.

**From Quintilian (via McCloskey):**
> "Therefore one ought to take care to write not merely so that the reader can understand but so that he cannot possibly misunderstand."

**From Popper (via McCloskey):**
> "I learned never to defend anything I had written against the accusation that it is not clear enough. If a conscientious reader finds a passage unclear, it has to be re-written."

### What Clarity Means
- Speed directed at the point
- No puzzles that make readers stop
- No sending readers in irrelevant directions
- Every sentence means something concrete
- Don't raise expectations you won't fulfill

### Why Clarity Matters

**From McCloskey:**
> "The reader is sovereign like the consumer... If readers have trouble, they give up—lack of clarity is selfish."

### Actionable Guidelines
- Read your own writing cold a week after drafting
- If you have to explain what you meant, rewrite it
- Assume readers are smart but busy—they won't work to decode your meaning
- Each sentence should advance understanding
- Circle every "is" in your prose—if the page looks like acne, replace with action verbs

---

## 2.2 Conciseness: Every Word Must Count

### Core Principle
Keep it short. Cut ruthlessly. Readers' time is valuable.

**From Sydney Smith (via McCloskey):**
> "In composing, as a general rule, run your pen through every other word you have written; you have no idea what vigour it will give to your style."

### What to Cut
- Repetition (if you've said it once, don't say it again)
- "In other words" (sign you didn't say it right the first time)
- Elegant variation (calling the same thing by different names)
- Most adjectives and adverbs
- "The existence of" (just name the thing)
- "It is the case that" and everything before "that"
- "It should be noted that" (just say it)
- "A comment is in order at this point" (just make the comment)

### Length Guidelines

**From Cochrane:**
> "Keep the paper as short as possible. Every word must count. As you edit the paper ask yourself constantly, 'can I make the same point in less space?' and 'Do I really have to say this?' Final papers should be no more than 40 pages."

- Abstracts: 100-150 words maximum
- Introductions: 3 pages maximum
- Shorter is better for everything

### Actionable Guidelines
- Don't repeat things—saying it once is enough
- Strike most adjectives and adverbs in revision
- Delete prefabricated phrases and boilerplate
- Brevity is the soul of clarity
- Your prose should be lean and muscular, not flabby

---

## 2.3 Concreteness: Examples Over Abstractions

### Core Principle
Write concretely, not abstractly. Use specific examples rather than generalizations.

**From McCloskey:**
> "Definiteness is concrete. Prefer Pepperidge Farm to bread, bread to widgets, and widgets to X. Bad writers in economics sometimes use abstraction because they have nothing to say and don't want the fact to become too plain."

### Examples of Concrete vs. Abstract

**Concrete → Abstract (Good → Bad)**
- "machines and men" → "capital and labor"
- "sheep and wheat" → "natural resource-oriented exports"
- "use" → "utilize"
- "several" → "diverse"
- "people" → "agents" or "individuals"

**From McCloskey:**
- GOOD: "Spanish prices began to rise before the treasure came"
- BAD: "The commencement of the Spanish Price Revolution antedated the inflow of treasure"

### Why Singulars Beat Plurals
- Singular words are more concrete than plurals
- "A worker" is more vivid than "workers"
- Translation is easier from concrete examples UP to abstract principles than vice versa

### Actionable Guidelines

**From Cochrane:**
> "Don't write 'I analyzed data on executive compensation and found many interesting results.' Explain what the central results are."

- Provide concrete numbers: "the coefficient is 0.3" not "the effect is significant"
- Use specific examples: "Chicago vs. Rapid City" not "geographic variation"
- Name real things: "bread" not "consumption good X_i"
- Writing should be definite and particular, not vague and general

### Example: EITC Paper

> "For example, 6.5 percent of EITC claimants in Chicago, IL in 2008 are self-employed and report earnings exactly at the refund-maximizing level, compared with 0.6 percent in Rapid City, SD."

**Why it works:** Specific cities, specific percentages, specific year. The 10-fold difference is vivid and memorable—much more than a regression coefficient.

---

## 2.4 Plain Language: Anglo-Saxon Over Latin

### Core Principle
Use short, simple Anglo-Saxon words over long Latinate abstractions. Avoid technical jargon and five-dollar words.

**From McCloskey:**
> "Anglo-Saxon words (need, someone, feels, buys, bread, bake) have often acquired a concreteness through homely use that more recent and more scholarly coinages from Latin or Greek have not (integrative, consequences, structural, differentiation)."

### Word Substitutions

**Pretentious → Plain**
- "utilize" → "use"
- "commence" → "begin" or "start"
- "purchase" → "buy"
- "endeavor" → "try"
- "individuals" → "people"
- "agents" → "people"
- "comprise" → "include"
- "hypothesize" → "suppose" or "expect"
- "implement" → "do" or "carry out"
- "critique" (verb) → "criticize"

### Jargon Often Hides Simple Ideas
- "Current period responses" = "what people do now"
- "The time inconsistency problem" = "changing your mind"
- "Geographical and cultural factors function to spatially confine growth" = "poor places tend to stay poor"

### Avoid Teutonisms (Noun-Stacking)
- "Private wealth-seeking activity" → "seeking wealth" or "the seeking of wealth"
- "Factor price equalization" → "the equalization of the prices of factors"
- "Continually-rebalanced-equally-weighted portfolio" → too many hyphens; simplify

### Actionable Guidelines
- Read your draft aloud—if you'd be embarrassed to say a word, change it
- One-syllable words are usually clearer than three-syllable words
- If your grandmother wouldn't understand a word, consider changing it
- Technical terms are fine when necessary, but not for showing off

---

## 2.5 Active Voice: Find the Actor

### Core Principle
Use active voice and take responsibility for what you're writing. Passive voice is cowardice.

**From Cochrane:**
> "Use active tense. Not: 'it is assumed that τ = 3', 'data were constructed as follows..' Gee, I wonder who did that assuming and constructing?"

**From McCloskey:**
> "Use active verbs: not 'active verbs should be used,' which is cowardice, hiding the user in the passive voice. Rather: 'you should use active verbs.'"

### Examples of Active vs. Passive

**Passive → Active**
- "It is assumed that τ = 3" → "I assume that τ = 3"
- "Data were constructed as follows" → "I construct the data as follows"
- "It was found that markets are efficient" → "I find that markets are efficient"
- "The results can be seen in Table 5" → "Table 5 shows the results" or "You can see the results in Table 5"

### Using "I" and "We"

**From Cochrane:**
- "I" is fine for single-authored papers (not the royal "we")
- Use "we" to mean "you (the reader) and I"
- Use "you" for the reader
- "We can see the u-shaped coefficients in Table 5" is better than "The u-shaped coefficients can be seen"

### Finding the Action

**From McCloskey:**
> "Find the action in a sentence and express it in a verb. Nominalization saps vigor: 'There is a data reanalysis need' → 'We must reanalyze our data.'"

### Actionable Guidelines
- Search for "is" and "are" to root out passive sentences
- Imperative is good for math: "divide both sides by x" not "both sides are then divided by x"
- Much bad writing comes from trying to avoid responsibility
- Take a deep breath and take responsibility for what you're saying

---

## 2.6 Sentence Structure: Subject-Verb-Object

### Core Principle
Use normal sentence structure. Keep sentences complete and focused. Elaborate only one part per sentence.

**From Cochrane:**
> "Use the normal sentence structure: subject, verb, object. Not: 'The insurance mechanisms that agents utilize to smooth consumption in the face of transitory earnings fluctuations are diverse' Instead: 'People use a variety of insurance mechanisms to smooth consumption.'"

### Gardner's Rule (via McCloskey)

**A sentence has three parts: subject, verb, object.**
- Vary sentences by how much you put into each part
- Choose only ONE part for elaboration per sentence
- Don't overburden all three parts at once

### Emphasis and Word Order

**From McCloskey:**
> "The most important rule of rearrangement is that the end of the sentence is the place of emphasis... The reader leaves the sentence with the last word ringing in her ears."

**Order of emphasis:**
1. **End of sentence**: Most emphatic position
2. **Beginning of sentence**: Second most emphatic
3. **Middle of sentence**: Least emphatic (dump unimportant things here)

### Actionable Guidelines
- Put important matter at the END of the sentence
- Put less important things in the middle or delete them
- Avoid straggling sentences that add one more idea at the last minute
- Listen for monotonously long or short sentences
- Don't break flow with mid-sentence parenthetical remarks
- Every sentence should have subject, verb, and object

### Example: Good vs. Bad Sentence Structure

**BAD:** "The insurance mechanisms that agents utilize to smooth consumption in the face of transitory earnings fluctuations are diverse and include self-insurance through savings, formal insurance markets, and informal risk-sharing arrangements."

**GOOD:** "People use several insurance mechanisms to smooth consumption. These include savings, formal insurance, and informal risk-sharing."

---

## 2.7 Word Choice: Precision and Simplicity

### Core Principle
Choose precise words. Avoid vague nouns, weak verbs, and useless modifiers.

### Vague Nouns to Avoid (McCloskey)
- "concept" → "idea," "notion," "thought"
- "data" (overused) → "facts," "statistics," "information," "observations"
- "function" (meaning "role") → specify what role
- "situation" → "position," "condition" or be specific
- "individuals," "agents" → "people"
- "structure" → usually means nothing; strike it
- "process" → usually empty; strike it
- "time frame" → "time"

### Weak/Pretentious Verbs
- "critique" → "criticize," "comment on"
- "implement" → specific verb
- "comprise" → "include," "consist of"
- "analyze" (overused) → "discuss," "examine"
- "hypothesize" → "suppose," "expect"
- "state" (meaning "say") → "say"

### Useless Adjectives
- "interesting" (weakened by sarcastic use)
- "kind of," "sort of," "type of" (vague)
- "former/latter" (makes reader look back; use names instead)
- "intra/inter" → "within" and "between"

### Useless Adverbs
- "very" → strike it almost always
- "respectively" → signals lack of parallel structure
- "fortunately," "interestingly" → cheap opinion
- "absolutely," "purely," "literally" → usually misused

### About Your Own Work

**From Cochrane:**
> "Don't use adjectives to describe your work: 'striking results' 'very significant' coefficients, etc. If the work merits adjectives, the world will give them to you."

- No "striking results"
- No "very significant"
- No "very novel"
- Let your work speak for itself

---

## 2.8 Eliminating Boilerplate

### Core Principle
Avoid prefabricated, predictable prose. Get to the point.

**From McCloskey:**
> "Boilerplate in prose is all that is prefabricated and predictable. It's common in economic prose."

### Examples of Boilerplate
- "This paper..." (never start with this)
- Table-of-contents paragraphs ("Section 2 sets out the model...")
- Excessive introduction and summarization
- "Background" that's really padding
- Redoing for many cases what one case shows
- Econometric chatter copied from textbooks
- Routine mathematical passages
- Hackneyed theoretical formulations

### Miss Jones's Rule Is WRONG

**From McCloskey:**
> "Tell them what you're going to say; say it; tell them what you said."

This is terrible advice for academic writing:
- Table-of-contents paragraphs: readers skip them or can't understand until they've read the paper
- Repetition wastes space and readers' patience
- One clear statement is better than three muddy ones

### Actionable Guidelines
- Never start with "This paper..."
- No roadmap paragraphs
- No "Background" sections that don't directly serve your argument
- Strike "It should be noted that"
- Strike "A comment is in order at this point"
- If you read a lot and thought through your question, you'll have plenty to say; if not, no amount of padding will fool readers

---

## 2.9 Repetition vs. Elegant Variation

### Core Principle
Repeat key terms for clarity. Avoid "elegant variation" that confuses readers.

**From McCloskey:**
> "Elegant Variation uses many words to mean one thing, with the result in the end that the reader, and even the writer, don't quite know what is being talked about."

**From Chaubey:**
> "Do not use interchangeable terms to refer to the same identity, this applies across a paragraph and across the whole paper."

### The Schoolmarm Is Wrong
- Traditional writing advice says "don't repeat words"
- This is BAD advice for technical writing
- Repetition brings clarity and unity
- Use ONE word to mean ONE thing consistently

### Example of Elegant Variation Run Amok
One paper used in two pages:
- "industrialization"
- "growing structural differentiation"
- "economic and social development"
- "social and economic development"
- "development"
- "economic growth"
- "growth"
- "revolutionized means of production"

All meaning the SAME THING! This is confusing, not elegant.

### When Variation IS Appropriate
- Use pronouns ("it," "them") to relieve monotony while maintaining links
- Query every instance of variation—is it necessary or just showing off?
- Parallel ideas should use parallel form (Strunk and White)

### Actionable Guidelines
- Don't call "consumer" → "household" → "agent" in successive sentences
- Use key words consistently throughout the paper
- Key words are not key words if not used consistently
- Get your words and things lined up and keep them that way

---

## 2.10 The Naked "This" and Pronoun Reference

### Core Principle
Make pronoun references crystal clear. Clothe the naked "this."

**From Cochrane:**
> "Clothe the naked 'this.' 'This shows that markets really are irrational...' This what? 'This' should always have something following it. 'This regression shows that....' is fine."

### The Problem with "This"
- Often has ambiguous antecedent
- Might refer to three different things in recent memory
- Leaves readers guessing what you mean

### The Solution
- "This" should have a noun following it
- "This regression shows..."
- "This result suggests..."
- "This finding implies..."
- Often plain "the" works better than "this"

### Other Pronoun Issues

**From McCloskey:**
> "Another plague is this-ism. These bad writers think this reader needs repeated reminders that it is this idea, not that one, which is being discussed."

- Circle all instances of "this" and "these"—take most out
- Use singulars and plurals to clarify reference
- Assign gender to distinguish people: "the owner... him" vs. "tenants... them"
- Use capitals for concrete reference: "the Coase Theorem" clearer than "the proposition that..."

### Greek Letters

**From Cochrane:**
> "People forget Greek letter definitions—remind them: 'the elasticity of substitution θ equals 3.'"

- Define symbols clearly in easy-to-find place
- Give them names too
- Remind people of the name and number when you use them

---

# PART 3: TECHNICAL ELEMENTS

## 3.1 Tables and Figures

### Core Principle
Tables and figures are writing. The usual rules of writing apply.

**From McCloskey:**
> "The wretched tables and graphs in economics show how little economists care about expression. Tables and graphs are writing, and the usual rules of writing therefore apply."

### Self-Contained Captions

**From Cochrane:**
> "Each table should have a self-contained caption so that a skimming reader can understand the fact presented without having to go searching through the text."

**What to include in captions:**
- For regression tables: the equation and variable names, especially left-hand variable
- Enough info that skimming reader understands without searching text
- Definition of symbols and variables
- But don't go nuts—some details can go in text

### Design Principles

**Significant digits:**
- 4.56783 ± 0.6789 should be 4.6 ± 0.7
- Two to three significant digits are plenty for economics
- Use correct number of digits, not whatever the program spits out

**Sensible units:**
- Use percentages when possible
- Report 2.3 rather than 0.0000023
- Make numbers readable

**Meaningful labels:**
- "Rich Budget Line" not "Locus QuERtY"
- Use spelled-out names, not computer acronyms
- Avoid LQWAGE and BBLUUBB—they baffle readers

**No orphan numbers:**
- Every number in a table must be discussed in text
- "Row 1 of Table 3 shows a u-shaped pattern" is OK
- "Table 5 shows summary statistics" (period) is NOT OK
- If it's not worth writing about in text, it's not worth putting in table

### Figures

**From Cochrane:**
> "Good figures really make a paper come alive, and they communicate patterns in the data much better than big tables of numbers."

- Give self-contained caption with verbal definition of each symbol
- Label the axes
- Use sensible units
- Don't use dotted line types that are invisible when reproduced
- Don't use dashes for very volatile series
- Read Tufte's *Visual Display of Quantitative Information*

### Declarative Headings
- Consider using findings as headings
- "Conferences Should Happen in the Midwest"
- Better than "A Model of Transport Costs"

---

## 3.2 Equations and Mathematics

### Core Principle
Use words in equations when possible. Anyone can retrieve algebra from words; the reverse is pointlessly harder.

**From McCloskey:**
> "It's clearer and no less scientific to say 'the regression was Quantity of Grain = 3.56 + 5.6 (Price of Grain) - 3.8 (Real Income)' than 'the regression was Q = 3.56 + 5.6P - 3.8Y, where Q is quantity of grain, P its price, and Y real income.'"

**From Halmos (via McCloskey):**
> "The author had to code his thought in [symbols] (I deny that anybody thinks in [such] terms), and the reader has to decode."

### Why This Matters
- Even professional mathematicians don't think in pure symbols
- Readers have to constantly decode your notation
- Words are more transparent than symbols for most readers

### Actionable Guidelines
- Use words in displayed equations when possible
- Define symbols clearly in easy-to-find place
- Remind readers of symbol meanings when you use them: "the elasticity of substitution θ equals 3"
- Keep displayed equations readable with meaningful variable names
- Don't assume readers remember what every Greek letter means

### Example: EITC Paper

> "Individuals have quasi-linear utility functions u(C_i, l_i; θ_i) = C_i - h(l_i; θ_i) over a numéraire consumption good C_i and labor supply l_i. The parameter θ_i captures skill or preference heterogeneity across agents."

**Why it works:** Math notation is followed immediately by words. The meaning of θ is explained right away. Readers don't have to guess or flip back to find definitions.

---

## 3.3 Footnotes and Appendices

### Footnotes

**From Cochrane:**
> "Don't use footnotes for parenthetical comments. If it's important, put it in the text. If it's not important, delete it."

**From McCloskey:**
> "Footnotes should guide the reader to the sources. That's all."

**When to use footnotes:**
- Long lists of references
- Simple bits of algebra
- Documentation typical reader can skip but a few might want
- NOT for side trips that break up flow
- NOT for parenthetical comments (signals you haven't organized your ideas)

### Appendices

**From Cochrane:**
> "Appendices are a great tool. Take that delicious section that has so many insightful comments on the literature, the general version of the model, the 57 robustness exercises that you did, and dump them in to an appendix."

**Good uses:**
- Robustness checks (summarize in paper, full version in appendix)
- General versions of models (if you must show them)
- Extensive literature comments
- Documentation that the main result is robust to various approaches
- Material you can summarize in paper and put full version on website

**Eventually:** You'll dump much of the appendix too. But appendices are a good intermediate step to get tangential material out of the main paper.

---

## 3.4 Abstracts

### Core Principle
100-150 words. State what you FIND, not what you "look for." Be concrete.

**From Cochrane:**
> "Most journals allow 100-150 words. Obey this limit now. The main function of the abstract is to communicate the one central and novel contribution, which you just figured out."

### What to Include
- Your one central contribution
- What you actually find (concrete results)
- The fact behind your conclusion

### What NOT to Include
- Other literature
- What you "look for" or "analyze"
- Abstract verbiage: "data are analyzed, theorems are proved, discussion is made"
- Hedging or vague statements

### Example: Fama-French 1992 (via Cochrane)

> "Two easily measured variables, size and book-to-market equity, combine to capture the cross-sectional variation in average stock returns associated with market β, size, leverage, book-to-market equity, and earnings-price ratios."

**Why it works:** Concrete from word one. Tells you exactly what they find. No literature review, no motivation, no throat-clearing.

---

## 3.5 Citations and References

### Core Principle
Be generous with citations. Cite specific pages, not entire books.

**From Cochrane:**
> "Be generous in your citations. You do not have to say that everyone else did it all wrong for your approach and improvements to be interesting."

**From McCloskey:**
> "Citing whole books and articles is a disease in modern economics, spread by the author-date citation... By not bothering to find [the page] the author misses the chance to reread, and think."

### Actionable Guidelines
- Cite specific pages, not entire books
- Give proper credit for ideas that might otherwise seem new
- Set your paper against 2-3 closest current papers
- Don't do JEL-style comprehensive reviews
- Don't abbreviate authors' names: "Fama and French" not "FF"
- Spell out people's names completely—you'd want them to write out yours

---

# PART 4: EMPIRICAL WORK SPECIFICS

## 4.1 Identification: The Three Most Important Things

**From Cochrane:**
> "What are the three most important things for empirical work? Identification, Identification, Identification."

### The Identification Checklist

1. **Describe the economic mechanism that caused dispersion in your right-hand variables**
   - No, God does not hand us true natural experiments very often
   - What economic forces generate variation in X?

2. **Describe the economic mechanism constituting the error term**
   - What things other than X cause variation in Y?

3. **Explain why error term is uncorrelated with right-hand variables in economic terms**
   - You can't talk about this crucial assumption without doing items 1 and 2
   - Why should we believe X is exogenous?

4. **Explain economics of why instruments are correlated with RHS variable and not with error term**
   - What excludes the instrument from the second stage?

5. **Understand difference between instrument and control**
   - In regressing y on x, when should z be an additional RHS variable vs. an instrument for x?

6. **Describe source of variation in data driving every single number**
   - With firm fixed effects: variation over time within firms
   - Without firm fixed effects: variation across firms at a moment
   - Be explicit about what variation identifies your estimates

7. **Demand curve or supply curve?**
   - Whose behavior are you modeling?
   - Is the price variation from demand shifts or supply shifts?

8. **Reverse causality?**
   - Does Y cause X, or does Z cause both X and Y?
   - Think of obvious reverse-causality stories

9. **What controls should be included?**
   - Most papers have far too many right-hand variables
   - High R² is usually bad (left shoes = right shoes + ...)
   - Don't control for mechanisms through which X affects Y

### Example: EITC Paper

> "Our research design is based on a simple idea: individuals with no knowledge of a tax policy's marginal incentives behave as they would in the absence of the policy. Hence, we can identify the causal effect of a policy by comparing behavior across cities that differ in knowledge about the policy but are otherwise comparable."

**Why it works:** The identification assumption is stated in plain English. The logic is transparent: no knowledge = no response, so comparing high-knowledge to low-knowledge cities identifies the policy effect.

---

## 4.2 Stylized Facts and Economic Significance

### Core Principle
Give stylized facts in the data, not just estimates and p-values. Explain economic significance, not just statistical significance.

**From Cochrane:**
> "Give the stylized facts in the data that drive your result, not just estimates and p values."

### The Fama-French Example

**From Cochrane:**
> "For a good example, look at Fama and French's 1996 'Multifactor explanations.' In the old style we would need one number: the GRS test. Fama and French show us the expected returns of each portfolio, they show us the beta of each portfolio, and they convince us that the pattern of expected returns matches the pattern of betas. This is the most successful factor model of the last 15 years ...even though the GRS test is a disaster!"

### Why This Works
- Shows the pattern in the data
- Readers can see the relationship visually
- Convincing even when formal test fails
- Economic significance is obvious

### Economic Magnitude

**From Cochrane:**
> "Explain the economic significance of your results. Explain the economic magnitude of the central numbers, not just their statistical significance. Especially in large panel data sets even the tiniest of effects is 'statistically significant.'"

### Actionable Guidelines
- Show expected returns, betas, patterns—not just test statistics
- Translate coefficients into economically meaningful units
- In large datasets, 2.10 t-statistic often means truly tiny effect
- Every important number should include standard error
- Explain what the magnitude means economically

### Example: EITC Paper

> "Comparing changes in earnings around child birth in high vs. low knowledge neighborhoods, we estimate that earnings responses to the EITC increase total refund amounts by approximately 5 percent on average across the U.S."

**Why it works:** The result is scaled to policy-relevant units (refund amounts, percentage increase). Readers immediately understand the magnitude and can assess whether it's economically important.

---

# PART 5: THE WRITING PROCESS

## 5.1 Writing IS Thinking

### Core Principle
Content and style cannot be separated. Writing is how you discover what you think.

**From McCloskey:**
> "The production function for thinking cannot be written as the sum of two subfunctions, one producing 'results' and the other 'writing them up.' The function is not separable. You do not learn the details of an argument until writing it in detail, and in writing the details you uncover flaws in the fundamentals."

**From Chaubey:**
> "Many people delay writing until the results are in. That is like trying to ride a bicycle one wheel at a time. Writing and research go together!"

### Why This Matters
- You discover truths you didn't know you had through writing
- Writing helps refine fuzzy notions into precise descriptions
- Like mathematics, writing is both communication instrument and thought instrument
- Don't wait until research is done to begin writing

### Actionable Guidelines
- Be writing all the time, working on a page or two here, a section there
- Write early rather than late
- Have notes and bits of prose ready to place in mosaic
- Use cards or word processor paragraphs with one idea each
- Create "The File" (C. Wright Mills): journal of systematic reflection
- RAP outline is useful for collecting feedback while still working on research

---

## 5.2 Revision: Write, Then Rewrite

### Core Principle
Good writing requires multiple revisions. No one gets it right the first time.

**From Hemingway (via McCloskey):**
> "Hemingway rewrote the last page of Farewell to Arms sixty times. Sixty. In pencil."

**From Dr. Johnson (via McCloskey):**
> "What is written without effort is in general read without pleasure."

### The Revision Process
- Rewrite again and again
- Even passable writing involves multiple revisions
- Read draft a week later with cold eye
- Reread chunks of draft with pencil in hand to revise
- Check and tighten in short sessions

### Practical Tips
- Toggle typefaces to see draft in new light
- Switch media (screen to paper, typewriter to pen)
- Keep finished manuscript in ringbinder for easy rereading
- At end of session, write down thoughts on what comes next
- Spellcheck everything before showing to anyone

### Maintaining Fluency

**From McCloskey:**
> "Fluency can be achieved by grit... The ancient recipe for success in intellectual pursuits: locate chair; apply rear end to it; locate writing implement; use it."

- Sneak up on subconscious resistance to filling blank pages
- Resist distractions: dishes, mail, trivial research points
- Don't let taste paralyze you
- Writing flares and fizzles like a candle—don't break off when on a burn

---

## 5.3 Audience Awareness

### Core Principle
Keep track of what your reader knows and doesn't know. Most Ph.D. students assume far too much.

**From Cochrane:**
> "The most important thing in writing is to keep track of what your reader knows and doesn't know. Most Ph.D. students assume far too much. No, we do not have the details of every paper ever written in our heads."

**From McCloskey:**
> "Look your audience directly in the eyes. Be honest with them. Ask who they are, aim the draft toward them, and keep hauling yourself back to facing them in revisions."

### Choosing Your Reader
- Choose one reader and stick with her
- Don't mix audiences: pre-schooler vs. expert
- Imagine ideal economist or real person (Professor Smith, friend down the hall)
- Be haunted by people with high standards looking over your shoulder

### What Readers Want
- To understand your basic point before criticizing it
- Clear explanation before comparison to alternatives
- Concrete examples before abstractions
- Most readers don't know the literature or every paper's details
- Readers want to know YOUR contribution first

---

## 5.4 Documentation and Reproducibility

### Core Principle
A fellow graduate student must be able to reproduce every number in your paper.

**From Cochrane:**
> "Document your work. A fellow graduate student must be able to sit down with your paper and all alone reproduce every number in it from instructions given in the paper, and any print or web appendices."

### What to Document
- Identification strategy clearly described
- How central tables were computed
- How standard errors were computed
- How simulations were conducted
- Data sources and variable construction
- Sample selection criteria

### The Problem
- Usual student paper has sea of verbiage
- But can't figure out how central table was computed
- Missing: details of estimation technique, standard error calculation, simulation parameters

---

## 5.5 Reading Aloud

### Core Principle
Read your writing out loud to detect bad spots. Your ear is a powerful detector.

**From McCloskey:**
> "Reading out loud is a powerful technique of revision. By reading out loud you hear your writing as others hear it internally, and if your ear is good you'll detect the bad spots."

**From Hemingway (via McCloskey):**
> "The writer needs a built-in, shockproof bullshit detector."

### What Reading Aloud Reveals
- Whether to use contractions
- Unintentional rhymes
- Over-fancy sentences that make you blush
- Jargony words that sound pretentious
- Awkward sentence rhythms

### Training Your Ear
- Read best old books
- Read poetry out loud, memorize some
- Read good writing to improve your ear
- Your ear should ring with English literature
- Don't write anything you'd be embarrassed to read aloud to intended audience

---

# PART 6: COPY EDITING PROTOCOL

## 6.1 Auto-Fix: Objective Errors

### Core Principle
These errors are objectively wrong by standard English grammar and LaTeX conventions. They should be fixed automatically, with all changes documented in `copy_edits_summary.md` for your review.

**CRITICAL:** These corrections are **objective errors only**—clear right/wrong with no judgment needed. Stylistic improvements, verbose-to-concise changes, and preference-based edits belong in the review checklist (Section 6.2).

### SPELLING & WORD CHOICE

**Fix immediately:**
- Typos and misspellings
- Homophones used incorrectly:
  - though/through/tough
  - affect/effect
  - compliment/complement
  - principle/principal
- Wrong word entirely (e.g., "casual" instead of "causal")
- Commonly confused words:
  - ensure/insure
  - discrete/discreet
  - elicit/illicit
  - comprise/compose
  - imply/infer

### GRAMMAR

**Fix immediately:**
- **Subject-verb agreement errors**
  - "The data shows" → "The data show" (data is plural)
  - "The paper examine" → "The paper examines"
- **Pronoun-antecedent agreement**
  - "Each researcher must submit their paper" → "Each researcher must submit his or her paper" (or rewrite as plural)
- **Pronoun reference ambiguity or errors**
  - Clear cases where pronoun reference is objectively unclear
- **Verb tense inconsistencies**
  - Switching between past and present tense within a paragraph without reason
- **Incorrect verb forms**
  - Irregular verbs: "I have ran" → "I have run"
  - Subjunctive mood: "If this was true" → "If this were true"
- **Sentence fragments**
  - Missing subject or verb (not intentional for stylistic effect)
- **Run-on sentences and comma splices**
  - "The model is simple, it works well" → "The model is simple. It works well." OR "The model is simple; it works well."
- **Misplaced or dangling modifiers**
  - "Walking to the office, the data looked promising" → "Walking to the office, I found the data looked promising"
- **Incorrect comparative/superlative forms**
  - "more better" → "better"
  - "most unique" → "unique"
- **Article errors**
  - Missing or incorrect use of a/an/the
  - "I ran regression" → "I ran a regression"
- **Preposition errors**
  - "Different than" → "Different from"
  - "Compared with" vs. "Compared to" (when objectively wrong)

### PUNCTUATION

**Fix immediately:**
- **Missing or extra commas**
  - Lists: "x, y and z" → "x, y, and z" (Oxford comma for clarity)
  - After introductory phrases: "After running the regression we found" → "After running the regression, we found"
  - With conjunctions in compound sentences: "The data are clean and the results are robust" → "The data are clean, and the results are robust"
  - Comma splices: "The model is good, the fit is excellent" → "The model is good. The fit is excellent."
- **Incorrect apostrophe usage**
  - "it's" (it is) vs. "its" (possessive)
  - Possessives: "the datasets features" → "the dataset's features"
  - Contractions: "dont" → "don't"
- **Missing or misplaced periods, semicolons, colons**
  - Missing periods at end of sentences
  - Incorrect use of semicolon where comma needed
  - Colon not preceded by independent clause
- **Quotation mark errors**
  - Close quote outside punctuation: "thus". → "thus."
  - Single vs. double quotes (consistency)
- **Hyphenation errors in compound adjectives**
  - "after tax income" → "after-tax income"
  - "two day return" → "two-day return"
  - BUT NOT with -ly adverbs: "previously-acquired" → "previously acquired"

### FORMATTING & CONSISTENCY

**Fix immediately:**
- **Inconsistent capitalization**
  - "the Solow Model" in one place, "the solow model" in another
  - Section headings: inconsistent use of title case
- **Number formatting inconsistencies**
  - Switching between "3" and "three" without reason
  - "5%" in one place, "five percent" in another (pick one style)
- **Inconsistent hyphenation of compound terms**
  - "co-author" and "coauthor" in same paper (pick one)
- **Citation formatting issues within text**
  - "(Smith 2020)" and "(Smith, 2020)" inconsistently
  - Inconsistent use of "et al."
- **Mathematical notation inconsistencies**
  - β vs. \beta inconsistently
  - Subscript formatting
- **Inconsistent abbreviation usage**
  - "U.S." and "US" in same paper (pick one)
  - First use without definition, later uses with definition

### LATEX-SPECIFIC

**Fix immediately:**
- **Syntax errors that would break compilation**
  - Missing $ delimiters for math mode
  - Unmatched braces or brackets
  - Undefined commands
- **Incorrect math mode delimiters**
  - Text appearing in math mode
  - Math appearing in text mode
- **Missing or extra braces/brackets**
  - `\frac{a}{b` → `\frac{a}{b}`
  - `{extra}` braces with no function
- **Incorrect reference labels**
  - `\ref{tab:results}` when label is `\label{tab:result}` (singular)
- **Spacing issues**
  - Using ` ` (space) in math mode instead of `\,` or `\;`
  - Inconsistent spacing around operators

**IMPORTANT LaTeX Notes:**
- **DO NOT FLAG:** Triple hyphens (---) are correct LaTeX syntax for em-dashes
- **DO NOT** add "Section " before `\ref` commands (already in markup)
- **DO NOT** add descriptive labels like "Section~" or "Equation~" before `\ref` commands unless they're consistently missing throughout

### How This Works

When you submit a draft:
1. Agent automatically fixes all objective errors listed above
2. Agent creates `copy_edits_summary.md` documenting every change:
   - Line number
   - Original text
   - Corrected text
   - Error type (e.g., "subject-verb agreement," "comma splice")
3. You review the summary file to see what was changed
4. You can accept, reject, or modify any changes

**Remember:** These are objective errors only. Stylistic improvements requiring judgment go to the review checklist (Section 6.2).

---

## 6.2 Review Checklist: Clarity & Style

### Core Principle
These items require **judgment and context**. The agent should present these as a checklist for your review, not apply them automatically. Clarity and sentence structure improvements need careful consideration—you decide what stays and what changes.

**Use this checklist for every draft:**

1. ☐ **Circle every "is"**—replace with action verbs where possible
   - "The model is an extension of" → "The model extends"
   - But not always: "The coefficient is 0.3" is fine

2. ☐ **Query every "this"**—add noun after it or use "the"
   - "This shows that" → "This result shows that" OR "The evidence shows that"
   - "This is because" → "This pattern occurs because"

3. ☐ **Search for passive voice**—convert to active where appropriate
   - "It was found that" → "I find that" OR "We find that"
   - "The data were analyzed" → "I analyze the data"
   - Context matters: passive sometimes appropriate in methods sections

4. ☐ **Delete adjectives and adverbs describing your own work**
   - "striking results" → "results"
   - "very significant" → "significant"
   - "novel contribution" → "contribution"
   - Let your work speak for itself

5. ☐ **Strike bad words from McCloskey's list**
   - "via" → "through"
   - "process of" → (delete)
   - "respectively" → (rephrase so readers don't have to look back)
   - "and/or" → pick one
   - "individuals" → "people"
   - "utilize" → "use"
   - "commence" → "begin"

6. ☐ **Check for Miss Jones violations**
   - Table-of-contents paragraphs: "Section 2 presents the model..." → delete
   - Elegant variation: calling same thing by different names → use one term consistently
   - Repetition without acknowledgment → say things once OR explicitly say "again"

7. ☐ **Test Gardner's Rule**
   - Is more than one part (subject/verb/object) complex in same sentence?
   - "The consideration by the Council of the question of compensation for victims using cost-benefit analysis was completed" → TOO COMPLEX
   - Fix: Simplify two of the three parts

8. ☐ **Check arrangement**
   - Is the important part at the **end** of sentences?
   - "I find evidence of peer effects in the data" → "The data show evidence of peer effects"
   - Reader leaves sentence with last word ringing in their ears

9. ☐ **Read aloud**
   - Would you be embarrassed to read this sentence to your intended reader?
   - Does it sound natural when spoken?
   - Your ear detects problems your eye misses

10. ☐ **Cut every other word (Sydney Smith's Rule)**
    - Can you make the same point in less space?
    - Every word that doesn't work is a word too many
    - Run your pen through every other word—see what vigour it gives

**Most important:** Remember that clarity is social. If a conscientious reader finds a passage unclear, it IS unclear and must be rewritten—no matter how clear it seems to you.

---

# PART 7: RULES AND COMMON PITFALLS

## 7.1 Mark Twain's Seven Rules (via McCloskey)

1. Say what he is proposing to say, not merely come near it
2. Use the right word, not its second cousin
3. Eschew surplusage
4. Not omit necessary details
5. Avoid slovenliness of form
6. Use good grammar
7. Employ a simple and straightforward style

---

## 7.2 George Orwell's Six Rules (via McCloskey)

1. Never use a metaphor, simile or other figure of speech which you are used to seeing in print
2. Never use a long word where a short one will do
3. If it is possible to cut a word out, always cut it out
4. Never use the passive where you can use the active
5. Never use a foreign phrase, a scientific word, or a jargon word if you can think of an everyday English equivalent
6. Break any of these rules sooner than say anything outright barbarous

---

## 7.3 The Meta-Rule (McCloskey)

> "Good style is above all a matter of taste... The best argument is social practice, since that is what taste is. Many people with a claim to know have listed the same rules for writing English."

---

## 7.4 Common Pitfalls: What to Avoid

1. **"This paper..."** — Never start a paper this way
2. **Table-of-contents paragraphs** — "Section 2 sets out the model, section 3..."
3. **Elegant variation** — Calling same thing by different names
4. **Passive voice** — "It was found that" instead of "I found that"
5. **Nominalization** — "There is a need for reanalysis" instead of "We must reanalyze"
6. **Teutonisms** — "Private wealth-seeking activity" instead of "seeking wealth"
7. **Boilerplate** — Prefabricated, predictable prose
8. **Throat-clearing** — Starting with philosophy or policy importance before your contribution
9. **Previews and recalls** — "As we will see in Table 6" or "Recall from section 2"
10. **Naked "this"** — "This shows that..." without noun after "this"
11. **Adjectives about own work** — "striking results," "very significant"
12. **"It should be noted that"** — Just say what you want to say
13. **"In other words"** — Sign you didn't say it right the first time
14. **Acronyms** — LQWAGE and BBLUUBB baffle readers
15. **Long footnotes for side trips** — If important, put in text; if not, delete
16. **Starting with literature review** — Explain your contribution first
17. **Preliminary results before main results** — Get to the point fast
18. **"Illustrative" empirical work** — Either do real work or none at all
19. **Repetition without acknowledgment** — Say things once, or say "again"
20. **Traffic signals** — Indeed, However, Furthermore, Therefore starting sentences

---

## 7.5 Punctuation Guide

### Comma Splice Is an Error
- WRONG: "The citizens lived in fear, the result was poor economic growth"
- FIX: Use period, semicolon, colon, or conjunction

### Colon (:)
- Means "to be specific" or introduces illustration
- "The model requires three assumptions: constant returns to scale, perfect competition, and no externalities"

### Semicolon (;)
- Means "furthermore" or introduces parallel remark
- Also used as supercomma in long series
- "The data come from Chicago, IL; Rapid City, SD; and Portland, OR"

### Dash (—)
- Parenthesis in louder tone
- Can be overused to solve badly organized sentences
- "The result—surprising to many—contradicts standard theory"

### Comma Tips
- Delete most commas before "the"—the signals new phrase well enough
- Don't separate subject from verb with comma
- Punctuate by ear rather than by rigid rule

### Quotation Marks
- Close quote goes inside punctuation: "thus."

---

## 7.6 Hyphens (from JFE style sheet)

**Use hyphens for true compound modifiers before the noun:**
- "after-tax income"
- "risk-free rate"
- "two-day return"
- "value-weighted index"

**UNLESS part of compound is an adverb ending in 'ly':**
- "previously acquired subsidiary"
- "equally weighted index"
- "publicly traded stock"

**When no risk of misinterpretation, hyphen can be omitted:**
- But treatment must be consistent throughout paper

**Don't use hyphens in other circumstances:**
- WRONG: "The paper focuses on small-stocks"
- RIGHT: "The paper focuses on small stocks"

---

# PART 8: FINAL WISDOM

## 8.1 Economics Is Writing

**From Cochrane:**
> "May economists falsely think of themselves as scientists who just 'write up' research. We are not; we are primarily writers. Economics and finance papers are essays. Most good economists spend at least 50% of the time they put into any project on writing. For me, it's more like 80%."

**From McCloskey:**
> "Economics, however, is too fine a subject to be left in a verbal mess out of mere laziness. What is at first difficult becomes a pleasure in the end, like any skill of civilization, an occasion for flow."

**From Chaubey:**
> "RAP helps researchers produce drafts that allow readers with different degrees of prior knowledge to learn as they read: RAP should go through a paper like its spine. It is what links part into a whole."

---

## 8.2 The Ultimate Goal

**Write so that the reader cannot possibly misunderstand.**

This is the golden rule of economical writing. Every other principle serves this end:
- Inverted pyramid structure helps readers find your main point
- Concrete language prevents misunderstanding
- Active voice clarifies who does what
- Plain words are harder to misunderstand than jargon
- One idea per sentence prevents confusion
- Clear topic sentences guide readers through your argument

If a reader finds your writing unclear, it is unclear—by definition. Take responsibility and rewrite.

---

## 8.3 Recommended Reading

**Writing Guides:**
- *Economical Writing (2nd ed.)* by Deirdre McCloskey
- *Writing Tips for Ph.D. Students* by John H. Cochrane
- *The Little Book on Research Writing* by Varanya Chaubey (RAP framework)
- *On Writing Well* by William Zinsser
- *The Elements of Style* by Strunk and White
- *The Visual Display of Quantitative Information* by Edward Tufte

**On the Publishing Process:**
- "The slowdown of the economics publishing process" by Glenn Ellison (JPE)

---

## 8.4 How to Use This Prompt

This prompt is a reference tool. You don't need to memorize it or apply every rule at once.

**Suggested workflow:**
1. **First draft**: Just get ideas down. Don't worry about style.
2. **Second draft**: Apply structural principles (Part 1)
   - Is your contribution clear?
   - Does the introduction follow inverted pyramid?
   - Are paragraphs well-structured with clear topic sentences?
3. **Third draft**: Apply stylistic principles (Part 2)
   - Cut ruthlessly (conciseness)
   - Replace passive with active voice
   - Substitute plain words for jargon
   - Clothe naked "this"
4. **Fourth draft**: Polish technical elements (Part 3)
   - Check table captions
   - Verify every number is discussed
   - Make equations readable
5. **Copy editing pass** (Part 6): Two-step process
   - **Step 5a: Auto-fix objective errors** (Section 6.1)
     - Agent fixes grammar, spelling, punctuation, consistency
     - Review `copy_edits_summary.md` to see what changed
     - Accept/reject/modify as needed
   - **Step 5b: Review clarity checklist** (Section 6.2)
     - Agent presents checklist of potential clarity/style improvements
     - Requires your judgment: passive voice, "this" usage, sentence complexity
     - You decide which changes to make
6. **Final draft**: Read aloud
   - Does it sound natural?
   - Would you be embarrassed to read any sentence?
   - Can readers possibly misunderstand?

**For specific sections:**
- Writing introduction? Review Section 1.3
- Stuck on paragraph structure? Review Section 1.6
- Results unclear? Review Section 4.2
- Too wordy? Review Section 2.2

**Most importantly:** Write regularly. Writing is thinking. Don't wait until "research is done."

---

**This prompt synthesizes wisdom from:**
- *Economical Writing (2nd ed.)* by Deirdre McCloskey
- *Writing Tips for Ph.D. Students* by John H. Cochrane
- *The Little Book on Research Writing* by Varanya Chaubey

**Examples drawn from:**
- Mankiw, Romer, and Weil (1992), "A Contribution to the Empirics of Economic Growth," *QJE*
- EITC neighborhood effects study
- Advertising price drivers analysis
- Securitization and screening study

---

**Now go write clearly.**
