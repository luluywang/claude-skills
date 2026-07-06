## introduction.tex

### Summary
- Total flags: 13 (High: 2, Medium: 10, Low: 1)
- Most common pattern: Pattern #1 — word repetition in close proximity

### Findings (document order)

### - [ ] Line 19: "regulatory" / "fees" triple plus sentence tails with meta commentary `[Medium]` `[Pattern #1, #9]`

**Comment:** "regulatory... regulation... regulatory" and "interchange fee... interchange fees... fees charged" each echo three times in one sentence. The closing "highlighting the wide variation in regulatory approaches" is meta padding that adds length without new content.

**Original:**
```
The U.S. regulatory environment strongly contrasts with the European Union's interchange fee regulation, which has capped interchange fees at less than one-sixth of the highest fees charged in the U.S., highlighting the wide variation in regulatory approaches across jurisdictions.
```

**Proposed Revision:**
```
The U.S. regulatory environment contrasts sharply with the European Union, which caps interchange at less than one-sixth of the highest U.S. rates.
```

**Why better:** Drops the triple "regulatory," collapses the "fees... fees... fees" echo, and trims the meta tail so the comparison lands quickly.

---

### - [ ] Line 27: "different... different... differences" stammer `[Medium]` `[Pattern #1]`

**Comment:** Three variants of the same root within 20 words read smoothly but sound like a stutter when spoken.

**Original:**
```
If consumers using different payment methods sort into different merchants, or if merchants face heterogeneous fees, then average fee differences are no longer sufficient to determine redistribution.
```

**Proposed Revision:**
```
If consumers with different payment preferences sort into separate merchants, or if merchants face heterogeneous fees, then average fee gaps no longer pin down redistribution.
```

**Why better:** "separate" and "gaps" replace two of the three "different/differences" roots, and "pin down" is a crisper verb than "are sufficient to determine."

---

### - [ ] Line 39: Long sentence with dangling pass-through clause `[Medium]` `[Pattern #9]`

**Comment:** The sentence runs 45+ words and accumulates three coordinated ideas (what the approach does, what it isolates, what assumptions underlie it). The "under empirically plausible pass-through assumptions that we examine in the data and in a structural model" dangles at the end, losing its own emphasis.

**Original:**
```
This approach allows us to quantify redistribution without estimating a full demand system, and to isolate the role of sorting and fee heterogeneity in shaping incidence, under empirically plausible pass-through assumptions that we examine in the data and in a structural model.
```

**Proposed Revision:**
```
This approach quantifies redistribution without estimating a full demand system and isolates the roles of sorting and fee heterogeneity. We examine the underlying pass-through assumptions both in the data and in a structural model.
```

**Why better:** Splitting into two sentences lets the verb arrive sooner in each and gives the pass-through validation its own beat.

---

### - [ ] Line 49: "merchant-level... Fiserv merchants... merchant-level" triple `[Low]` `[Pattern #1]`

**Comment:** Three forms of "merchant" land in 18 words. The ear hears a stutter where the eye reads a careful definition.

**Original:**
```
The first consists of merchant-level settlement data from all Fiserv merchants from 2006 to 2022, covering merchant-level transaction volumes, counts, and fees by card type.
```

**Proposed Revision:**
```
The first covers every Fiserv-acquired merchant from 2006 to 2022, with merchant-level volumes, transaction counts, and fees by card type.
```

**Why better:** One "merchant-level" carries the whole idea; "every Fiserv-acquired merchant" replaces "all Fiserv merchants" without the doubled "from."

---

### - [ ] Line 59: "transactions" appears three times `[Medium]` `[Pattern #1]`

**Comment:** "credit card transactions... card transactions... credit transactions" in a single sentence sounds like a stammer aloud.

**Original:**
```
Although credit card transactions account for a little more than half of all card transactions, the standard deviation of the share of credit transactions across merchants is approximately 20 percentage points.
```

**Proposed Revision:**
```
Although credit accounts for a little more than half of card transactions, the credit share varies across merchants with a standard deviation of roughly 20 percentage points.
```

**Why better:** Two of the three "transactions" drop out, and "the credit share varies" puts the variation up front where the sentence wants it.

---

### - [ ] Line 62: "consumers" brackets plus "redistribution / redistribute" echo `[Medium]` `[Pattern #1]`

**Comment:** Sentence opens with "consumers" and closes with "consumers," and couples "redistribution" with "redistribute." The ear grabs the echo before it grabs the claim.

**Original:**
```
Because redistribution arises only when consumers using different payment methods shop at the same merchants, this variation limits the extent to which credit card interchange fees redistribute consumption from cash and debit card consumers.
```

**Proposed Revision:**
```
Because redistribution arises only when different payment methods meet at the same merchant, sorting limits how much credit card interchange fees can transfer consumption from cash and debit card users.
```

**Why better:** "users" replaces the second "consumers," and "transfer" breaks the "redistribution / redistribute" echo. Shorter and more direct.

---

### - [ ] Line 75: "credit cards" three times `[Medium]` `[Pattern #1]`

**Comment:** "credit cards... credit cards... credit cards" stutters when read aloud and obscures the actual contrast between basic and premium.

**Original:**
```
Within credit cards, basic credit cards charge merchants around \absinput{fees_nobargain_basic_credit}\%, while high-fee, high-reward premium credit cards, often used by higher-income consumers, charge around \absinput{fees_nobargain_premium_credit}\%.
```

**Proposed Revision:**
```
Within credit cards, basic varieties charge merchants around \absinput{fees_nobargain_basic_credit}\%, while high-fee, high-reward premium cards, often used by higher-income consumers, charge around \absinput{fees_nobargain_premium_credit}\%.
```

**Why better:** One framing "credit cards," then "varieties" and "premium cards" carry the rest. The basic / premium contrast stands out more clearly.

---

### - [ ] Line 83: "high... high" and "pay interchange fees" twice `[Medium]` `[Pattern #1]`

**Comment:** "high credit card use... pay high interchange fees, whereas grocery stores... pay interchange fees" — the doubled "pay interchange fees" and doubled "high" make the sentence rock back and forth.

**Original:**
```
Merchants in sectors with high credit card use, such as travel and retail, pay high interchange fees, whereas grocery stores and gas stations pay interchange fees around \absinput{grocery_discount} basis points (30\%) lower.
```

**Proposed Revision:**
```
Merchants in credit-heavy sectors, such as travel and retail, pay high interchange fees, whereas grocery stores and gas stations pay around \absinput{grocery_discount} basis points (30\%) less.
```

**Why better:** "credit-heavy sectors" replaces "sectors with high credit card use," and the second clause drops "interchange fees" since it is understood from the first.

---

### - [ ] Line 86: "both X and Y and reflect Z" — ambiguous "both...and" closure `[High]` `[Pattern #5]`

**Comment:** "both publicly posted volume discounts and private negotiations and reflect..." The second "and" is a new coordinating conjunction, but the ear hears it as a third item in the "both...and" list before "reflect" forces a reparse.

**Original:**
```
These lower rates are the consequence of both publicly posted volume discounts and private negotiations and reflect the bargaining power of larger merchants.
```

**Proposed Revision:**
```
These lower rates come from both publicly posted volume discounts and private negotiations, and they reflect the bargaining power of larger merchants.
```

**Why better:** "and they reflect" inserts an unambiguous clause boundary so the listener does not hold "volume discounts and private negotiations and reflect" as a single list.

---

### - [ ] Lines 105: Awkward "and that for" parallelism `[Medium]` `[Pattern #3]`

**Comment:** "raising the sales tax rate for cash users by around X\% and that for regulated debit card users by Y\%" compresses an elision awkwardly. The ear needs to reconstruct "raising... for debit card users by Y" from "and that for... by Y," which works on the page but stumbles aloud.

**Original:**
```
Relative to an average state and local sales tax rate of around 6\%, our calculations suggest that interchange fees are analogous to raising the sales tax rate for cash users by around \absinput{tax_rate_cash}\% and that for regulated debit card users by \absinput{tax_rate_regulated_debit}\%.
```

**Proposed Revision:**
```
Relative to an average state and local sales tax rate of around 6\%, interchange fees act like raising the sales tax by \absinput{tax_rate_cash}\% for cash users and by \absinput{tax_rate_regulated_debit}\% for regulated debit card users.
```

**Why better:** The parallel becomes "by X for cash users and by Y for debit card users," which the ear can track without backfill.

---

### - [ ] Line 106: Misplaced "essentially reducing" — antecedent ambiguity `[High]` `[Pattern #10]`

**Comment:** "...more as a result of high interchange fees, essentially reducing their effective sales taxes..." On first hearing, "reducing" attaches to "fees" (which is closer) rather than to the consumers' situation. The writer means that consumers end up with lower effective taxes, but the listener gets "fees reducing sales taxes" first.

**Original:**
```
In contrast, basic and premium credit card users consume around \absinput{avg_credit_welfare} basis points more as a result of high interchange fees, essentially reducing their effective sales taxes by \absinput{tax_rate_avg_credit}\%.
```

**Proposed Revision:**
```
In contrast, high interchange fees raise consumption for basic and premium credit card users by around \absinput{avg_credit_welfare} basis points, effectively cutting their sales tax rate by \absinput{tax_rate_avg_credit}\%.
```

**Why better:** Putting "fees" up as the subject of "raise consumption" means "effectively cutting" attaches naturally to the same clause. No reparse.

---

### - [ ] Line 117: "payment methods" triple and trailing "due to" `[Medium]` `[Pattern #1, #9]`

**Comment:** "different payment methods... interchange fees and the smallest fee differentials across payment methods, due to sectoral discounts and private negotiations" — "payment methods" repeats, and the "due to" tails a long sentence when it should introduce its own causal beat.

**Original:**
```
Grocery stores, gas stations, and large retailers exhibit the greatest overlap between consumers using different payment methods, but they also face the lowest levels of interchange fees and the smallest fee differentials across payment methods, due to sectoral discounts and private negotiations. This substantially reduces the extent of redistribution.
```

**Proposed Revision:**
```
Grocery stores, gas stations, and large retailers show the greatest overlap between users of different payment methods. But sectoral discounts and private negotiations leave these merchants with the lowest interchange rates and the smallest fee gaps across cards. This substantially reduces redistribution.
```

**Why better:** Splitting into two sentences promotes "sectoral discounts and private negotiations" to the subject of the causal clause, and "cards" replaces one instance of "payment methods."

---

### - [ ] Line 154: "consumers" three times in one sentence `[Medium]` `[Pattern #1]`

**Comment:** "unsophisticated consumers cross-subsidize sophisticated consumers when both types of consumers pool on the same financial products" — three "consumers" in 17 words is a clear stutter aloud.

**Original:**
```
Our findings on redistribution through the payment system contrast significantly with prior work that emphasizes how unsophisticated consumers cross-subsidize sophisticated consumers when both types of consumers pool on the same financial products \citep{Gabaix.Laibson2006, Fisher.etal2024, Agarwal.etal2022}.
```

**Proposed Revision:**
```
Our findings contrast with prior work that emphasizes how unsophisticated consumers cross-subsidize sophisticated ones when both types pool on the same financial products \citep{Gabaix.Laibson2006, Fisher.etal2024, Agarwal.etal2022}.
```

**Why better:** "sophisticated ones" and "both types" absorb two of the three "consumers," and dropping "on redistribution through the payment system contrast significantly with" tightens the setup.

---
