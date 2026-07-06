## [model.tex]

### Summary
- Total flags: 9 (High: 0, Medium: 3, Low: 6)
- Most common pattern: Pattern 1 (word repetition) and Pattern 10 (ambiguous pronouns)

### Findings (document order)

### - [ ] Lines 81, 176: "percentage, lump-sum rewards" `Medium` `Pattern 3 (Ambiguous list parallelism variant)`

**Comment:** The comma creates parsing ambiguity. The ear doesn't know if "percentage" is an adjective modifying "lump-sum rewards" or a separate noun category. Repeated twice makes it a moderate issue.

**Original:**
```
where $f^j$ represents percentage, lump-sum rewards
```

**Proposed Revision:**
```
where $f^j$ represents rewards that are percentage-based and lump-sum
```

**Why better:** Eliminates the comma ambiguity and clarifies the structure: rewards are both percentage-based (tied to transaction amounts) and lump-sum (fixed baseline components). The ear tracks "percentage-based AND lump-sum" clearly.

---

### - [ ] Lines 147-149: Repetition in fee/sales benefit explanation `Medium` `Pattern 1 (Word repetition) + mixed voice`

**Comment:** "all consumers who use it" in line 147 and "all consumers who use the card" in line 148 create a stutter. Additionally, "covers" vs. "is driven" shift agency awkwardly.

**Original:**
```
Adding a more expensive card incurs fees from all consumers who use it but raises sales only among single-homers. The incremental fee cost $a_M$ covers all consumers who use the card, whereas the incremental sales benefit $b_M$ is driven only by single-homers who cannot substitute.
```

**Proposed Revision:**
```
Adding a more expensive card incurs fees from all consumers who use it but raises sales only among single-homers. The fee cost $a_M$ includes all users; the sales benefit $b_M$ comes only from single-homers who cannot substitute.
```

**Why better:** Eliminates "all consumers who" repetition. Active voice throughout ("includes," "comes") instead of mixed passive/active. Shorter, punchier.

---

### - [ ] Line 251: Repetition of "use $j$" `Low` `Pattern 1 (Word repetition)`

**Comment:** The phrase "multi-homers who use $j$" appears with "use $j$" three times in one sentence ("single-homers on $j$", "primarily use $j$", "use $j$ as a secondary"). The ear catches the repetition.

**Original:**
```
The three terms count single-homers on $j$, multi-homers who primarily use $j$, and multi-homers who use $j$ as a secondary card.
```

**Proposed Revision:**
```
The three terms count single-homers on $j$, multi-homers who primarily prefer it, and multi-homers who hold it as a secondary.
```

**Why better:** Introduces synonyms ("prefer," "hold") to break the repetition of "use" while maintaining semantic clarity. The ear no longer stumbles on the repeated phrase.

---

### - [ ] Line 263: Pronoun ambiguity in "their own acceptance" `Medium` `Pattern 10 (Ambiguous pronouns)`

**Comment:** "networks set consumers' expectations of their own acceptance" — the ear momentarily uncertain whether "their" refers to consumers or networks. Requires backtrack.

**Original:**
```
Equivalently, networks set consumers' expectations of their own acceptance, fees, and rewards given expectations for rival networks.
```

**Proposed Revision:**
```
Equivalently, networks set consumers' expectations about network acceptance, fees, and rewards, given expectations for rivals.
```

**Why better:** Removes the ambiguous possessive "their." "Network acceptance" is explicit and avoids pronoun confusion. Cleaner on the ear.

---

### - [ ] Line 282: Extremely long equilibrium definition sentence `Medium` `Pattern 9 (Long preamble before main verb)`

**Comment:** This 52-word sentence about the equilibrium tuple is breath-heavy and uses semicolons to list multiple conditions, making it read like a dense enumeration rather than a definition.

**Original:**
```
An equilibrium is a tuple $\left(\tau^{*}, A^{*}, \tilde{\mu}^w_y, p^{*}\left(\gamma\right), M^{*}\left(\gamma\right), q^{w*}\left(\gamma\right)\right)$ satisfying: consumption is optimal (\ref{eq:optimal-consumption}); merchant pricing and acceptance maximize profits (\ref{eq:pricing-eqm}, \ref{eq:adoption-eqm}); consumers choose optimal wallets (\ref{eq:person-market-share}); and networks maximize profits (\ref{eq:network-conduct-argmax}).
```

**Proposed Revision:**
```
An equilibrium is a tuple $\left(\tau^{*}, A^{*}, \tilde{\mu}^w_y, p^{*}\left(\gamma\right), M^{*}\left(\gamma\right), q^{w*}\left(\gamma\right)\right)$ satisfying the following conditions: consumption is optimal per Eq. \ref{eq:optimal-consumption}; merchant pricing and acceptance maximize profits per Eqs. \ref{eq:pricing-eqm} and \ref{eq:adoption-eqm}; consumers choose optimal wallets per Eq. \ref{eq:person-market-share}; networks maximize profits per Eq. \ref{eq:network-conduct-argmax}.
```

**Why better:** "The following conditions" signals a list structure, helping the ear prepare. Replacing parenthetical equation references with "per Eq." shorthand keeps the ear moving without the breath-breaking.

---

### - [ ] Line 298: Ambiguous pronoun "it" `Low` `Pattern 10 (Ambiguous pronouns)`

**Comment:** "Antitrust testimony and consumer surveys support it" — the ear is momentarily unsure whether "it" refers to segmentation or to some other concept. Context resolves it but requires backtrack.

**Original:**
```
Antitrust testimony and consumer surveys support it, but Discover's rewards experiment shows some substitution at the margin (Appendix~\ref{subsec:oa-discover-rewards}).
```

**Proposed Revision:**
```
Antitrust testimony and consumer surveys support segmentation, but Discover's rewards experiment shows some substitution at the margin (Appendix~\ref{subsec:oa-discover-rewards}).
```

**Why better:** Names the referent explicitly ("segmentation") instead of relying on "it." The ear tracks the claim without backtracking.

---

### - [ ] Line 300: Ambiguous phrase "contradicts the first" `Low` `Pattern 10 (Ambiguous pronouns/referents)`

**Comment:** "Antitrust testimony in Ohio v. AmEx contradicts the first" — the ear doesn't know what "the first" refers to (the first observation? the first testimony? the first claim from the previous sentence?). Requires context-hunting.

**Original:**
```
Antitrust testimony in \emph{Ohio v.\ AmEx} contradicts the first, and Durbin halved debit interchange without moving credit interchange.
```

**Proposed Revision:**
```
But antitrust testimony in \emph{Ohio v.\ AmEx} contradicts this first claim: credit acceptance depends on credit-debit multi-homing rates.
```

**Why better:** Explicitly names what the testimony contradicts. "But" signals contrast. The ear knows exactly which claim is being disputed.

---

### - [ ] Line 323: Repeated "card" in compound terms `Low` `Pattern 1 (Word repetition)`

**Comment:** "card networks at all card-accepting stores" — "card" appears twice in quick succession as part of different compounds. Minor ear stumble.

**Original:**
```
This one-dimensional type rationalizes hierarchical acceptance but predicts identical relative shares among accepted card networks at all card-accepting stores.
```

**Proposed Revision:**
```
This one-dimensional type rationalizes hierarchical acceptance but predicts identical relative shares across networks at all stores accepting cards.
```

**Why better:** Eliminates the "card networks...card-accepting" repetition. "Networks...stores accepting cards" reads more smoothly.

---

### - [ ] Line 340: Repeated "card" in "card acceptance...card payments" `Low` `Pattern 1 (Word repetition)`

**Comment:** "Merchants with the strongest gains from card acceptance are those whose consumers value card payments" — "card" repeated in "card acceptance" and "card payments" in close proximity. Slight ear stumble.

**Original:**
```
Merchants with the strongest gains from card acceptance are those whose consumers value card payments highly and respond little to surcharges, so even small menu costs deter surcharging.
```

**Proposed Revision:**
```
Merchants who gain most from accepting cards are those whose customers value card use highly and resist surcharges, so even small menu costs deter surcharging.
```

**Why better:** Replaces first "card acceptance" with "accepting cards," eliminating the noun-phrase repetition. "Card use" is varied from "card payments." The ear hears smooth variation.

---

**Total flags found: 9. None are critical. All are Medium or Low and represent either minor repetitions or mild ambiguities that context resolves, but that benefit from clarification for read-aloud fluency.**
