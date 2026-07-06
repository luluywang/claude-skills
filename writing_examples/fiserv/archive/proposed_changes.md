# Proposed Editorial Changes

Below are the proposed changes organized by file. Each change shows the current text and the suggested replacement.

---

## 1. introduction.tex

### Change 1.1: Clarify the attenuation paragraph (lines 40-43)

**Current:**
```latex
Critically, two mechanisms substantially attenuate this transfer.
First, consumers who use different payment methods shop at different types of merchants, reducing the scale of cross-subsidization by approximately \$\absinput{cash_debit_sorting} billion.
```

**Proposed:**
```latex
Critically, two mechanisms substantially attenuate this transfer relative to a benchmark that assumes homogeneous shopping behavior.
Under the homogeneous benchmark, cash and debit users would lose approximately \$40 billion annually; consumer sorting reduces this by approximately \$\absinput{cash_debit_sorting} billion because consumers who use different payment methods tend to shop at different types of merchants.
```

---

### Change 1.2: Clarify three-part structure (lines 23-27)

**Current:**
```latex
The paper proceeds in three parts.
First, we document striking heterogeneity in both payment mix and interchange fees across merchants.
While some merchants predominantly receive low-cost payments, such as cash and debit, others are heavily skewed toward high-cost premium credit cards.
Second, we explore the determinants of this variation and its implications for merchant-level acceptance costs.
Third, we develop two complementary approaches based on a sufficient statistic and a structural model to measure how the payment system redistributes consumption through retail prices and card rewards.
```

**Proposed:**
```latex
The paper proceeds in three parts: measurement, modeling, and application.
In the first part, we measure heterogeneity in both payment mix and interchange fees across merchants.
While some merchants predominantly receive low-cost payments, such as cash and debit, others are heavily skewed toward high-cost premium credit cards.
In the second part, we develop two complementary modeling approaches---a sufficient statistic and a structural model---to quantify how the payment system redistributes consumption through retail prices and card rewards.
In the third part, we apply these frameworks to evaluate the redistributive consequences of current interchange fees and counterfactual policies.
```

---

### Change 1.3: Flag structural model more prominently (around lines 93-96)

**Current (footnote):**
```latex
\footnote{ While our sufficient statistic holds exactly for small changes in interchange fees, in Appendix \ref{sec:appendix-calibrated} we validate it by calibrating a structural model of retail competition that matches the distribution of payment shares and interchange fees across merchants.
Our structural model captures how large merchants pass through interchange fees imperfectly to retail prices due to market power.
We find that our sufficient-statistics framework closely approximates the full structural model, suggesting that our main results are robust to these additional considerations. }
```

**Proposed (move key point to main text, keep details in footnote):**

After line 91 ("These statistics remain valid even when consumers' payment and shopping preferences are arbitrarily correlated."), add:

```latex
We validate this sufficient-statistics approach by calibrating a structural model of retail competition with imperfect pass-through; the two approaches yield quantitatively similar estimates of redistribution (Table \ref{tab:compare-ss-model}).\footnote{The structural model matches the distribution of payment shares and interchange fees across merchants and allows large merchants to pass through interchange fees imperfectly to retail prices due to market power.
See Appendix \ref{sec:appendix-calibrated} for details.}
```

Then delete the original footnote at lines 94-96.

---

## 2. redistribution.tex

### Change 2.1: Fix missing "Equation" (line 267)

**Current:**
```latex
An equilibrium is defined by a vector of prices $p_{js}$ for each sector and a vector of consumption choices $q_{jks}$ for consumers of each payment method such that merchants maximize profits as per \ref{eq:optimal-price-structural} and consumers maximize utility given prices as per Equation \ref{eq:consumer-demand}.
```

**Proposed:**
```latex
An equilibrium is defined by a vector of prices $p_{js}$ for each sector and a vector of consumption choices $q_{jks}$ for consumers of each payment method such that merchants maximize profits as per Equation \ref{eq:optimal-price-structural} and consumers maximize utility given prices as per Equation \ref{eq:consumer-demand}.
```

---

### Change 2.2: Vary "Intuitively" (line 193)

**Current:**
```latex
Intuitively, a sector with a high $\alpha_{ks}$ has a high utility for consumers $k$.
```

**Proposed:**
```latex
A sector with a high $\alpha_{ks}$ delivers high utility to consumers of type $k$.
```

---

### Change 2.3 (Optional): Move calibration details to appendix (lines 269-279)

**Current:**
```latex
\subsubsection{Calibration}
We next calibrate our model to the data.
Our calibration strategy targets moments that capture both the level and heterogeneity of payment composition across merchants and sectors.
We calibrate most parameters sector-by-sector to allow for the substantial cross-sector heterogeneity documented in Section \ref{sec:costs}.

We simulate $M=300$ i.i.d. markets and compute expected welfare by averaging across them. Each sector in a market has $100$ firms. Of these firms, $j^*$ are large firms that internalize their price-index effects and $(100-j^*)$ are small firms that behave as monopolistic competitors.
For merchandise and grocery sectors, we set $j^{*}=2$, calibrating large firm parameters to match the revenue share and payment composition of firms with more than \$1 billion in revenue.
For other sectors, we set $j^{*}=0$, treating all firms as small.
We also consider an ``extreme'' calibration that extends imperfect passthrough to all sectors by setting $j^*=2$ everywhere, using synthetic large-firm moments (targeting 49.3\% revenue share) for non-grocery and non-merchandise sectors.
We parameterize the taste shifters $a_{jks}$ to be log normal in each sector, but potentially correlated across payment methods $k$, to match the revenue-weighted first and second moments of payment shares across merchants in each sector.
Appendix \ref{sec:appendix-calibrated} provides full calibration details and goodness-of-fit figures.
```

**Proposed (condensed version):**
```latex
\subsubsection{Calibration}
We calibrate the model to match key moments from the Fiserv data on payment composition across merchants and sectors.
Our calibration strategy targets both the level and heterogeneity of payment shares, calibrating parameters sector-by-sector.
For merchandise and grocery sectors, we allow for large firms with market power ($j^{*}=2$) that internalize their price-index effects, matching the revenue share and payment composition of firms with more than \$1 billion in revenue.
Appendix \ref{sec:appendix-calibrated} provides full calibration details and goodness-of-fit figures.
```

---

## 3. results.tex

### Change 3.1: Convert bullet points to prose (lines 51-76)

**Current:**
```latex
\begin{itemize}
\item \textbf{Baseline fee $\overline{\tau}_{l}$:}
\begin{equation}
A_{kl}=\overline{\tau}_{l}\times\left(\mathbbm{1}\left\{ k=l\right\} - \mu_k^{-1} \mathbb{E}_{R}\left[\mu_{jk}\mu_{jl}\right]\right)\label{eq:baseline-effect}
\end{equation}
The baseline fee formula illustrates how changes in the overall fee level redistribute surplus across payment types.
An increase in the baseline fees on card $l$ hurts consumers of card $k$ by raising retail prices, in proportion to how much consumers of card $k$ and card $l$ overlap merchants, captured by $\mathbb{E}_{R}[\mu_{jk}\mu_{jl}]$.
Card $l$ consumers, however, benefit from gaining rewards.

The appearance of second moments makes the framework rich enough to nest the corner cases, which have been considered up to now in the literature.
When consumers with different payment methods shop at disjoint sets of merchants, as in \citet{Gans2018}, we have $\mu_{jk}\mu_{jl}=0$ for all $j$ whenever $k\neq l$, and there is no redistribution.
Conversely, when merchants are homogeneous with respect to their payment mix, so that $\mu_{jk}=\overline{\mu}_{k}$ for all merchants $j$, redistribution depends on the aggregate share of each card type, consistent with the intuition in \citet{Felt.etal2023}.
Thus, the sufficient-statistics framework captures a wide range of economic environments---from perfect merchant homogeneity to full segmentation---allowing us to quantify redistribution in the presence of observed heterogeneity in payment behavior.

\item \textbf{Sector discounts $\tau_{sl}$:}
\begin{equation}
S_{kl}=-\sum_{s}\tau_{sl}\times P_{R}\left(s_{j}=s\right)\mathbb{E}_{R}\left[\mu_{jk}\mu_{jl}\rvert s_{j}=s\right]\label{eq:sector-effect}
\end{equation}
The sector discount formula says that sector-specific discounts are transmitted sector-by-sector, in proportion to the overlap of consumers within each sector.
Intuitively, if debit card and credit card consumers overlap more in groceries than in travel, then a fee discount for groceries and a higher fee for travel benefits debit card users at the expense of credit card users.

\item \textbf{Negotiated rates $\delta_{l}$:}
\begin{equation}
B_{kl}=\delta_{l}\times P_{R}\left(b_{j}=1\right)\left(\mathbbm{1}\left\{ k=l\right\} - \mu_k^{-1} \mathbb{E}_{R}\left[\mu_{jk}\mu_{jl}\rvert b_{j}=1\right]\right)\label{eq:bargain-effect}
\end{equation}
\end{itemize}
The negotiated rate formula predicts that consumers benefit from the discounts negotiated by large merchants to the extent that they shop at those merchants.
```

**Proposed (prose format):**
```latex
\paragraph{Baseline fees.}
The first component captures how changes in the overall fee level redistribute surplus:
\begin{equation}
A_{kl}=\overline{\tau}_{l}\times\left(\mathbbm{1}\left\{ k=l\right\} - \mu_k^{-1} \mathbb{E}_{R}\left[\mu_{jk}\mu_{jl}\right]\right)\label{eq:baseline-effect}
\end{equation}
An increase in the baseline fee on card $l$ hurts consumers of card $k$ by raising retail prices, in proportion to how much consumers of card $k$ and card $l$ overlap at merchants, captured by $\mathbb{E}_{R}[\mu_{jk}\mu_{jl}]$.
Card $l$ consumers, however, benefit from gaining rewards.

The appearance of second moments makes the framework rich enough to nest the corner cases considered in the literature.
When consumers with different payment methods shop at disjoint sets of merchants, as in \citet{Gans2018}, we have $\mu_{jk}\mu_{jl}=0$ for all $j$ whenever $k\neq l$, and there is no redistribution.
Conversely, when merchants are homogeneous with respect to their payment mix, so that $\mu_{jk}=\overline{\mu}_{k}$ for all merchants $j$, redistribution depends on the aggregate share of each card type, consistent with the intuition in \citet{Felt.etal2023}.
Thus, the sufficient-statistics framework captures a wide range of economic environments---from perfect merchant homogeneity to full segmentation---allowing us to quantify redistribution in the presence of observed heterogeneity in payment behavior.

\paragraph{Sector discounts.}
The second component captures how sector-specific fee adjustments affect redistribution:
\begin{equation}
S_{kl}=-\sum_{s}\tau_{sl}\times P_{R}\left(s_{j}=s\right)\mathbb{E}_{R}\left[\mu_{jk}\mu_{jl}\rvert s_{j}=s\right]\label{eq:sector-effect}
\end{equation}
Sector-specific discounts are transmitted sector-by-sector, in proportion to the overlap of consumers within each sector.
If debit card and credit card consumers overlap more in groceries than in travel, then a fee discount for groceries and a higher fee for travel benefits debit card users at the expense of credit card users.

\paragraph{Negotiated rates.}
The third component captures the effect of privately negotiated discounts:
\begin{equation}
B_{kl}=\delta_{l}\times P_{R}\left(b_{j}=1\right)\left(\mathbbm{1}\left\{ k=l\right\} - \mu_k^{-1} \mathbb{E}_{R}\left[\mu_{jk}\mu_{jl}\rvert b_{j}=1\right]\right)\label{eq:bargain-effect}
\end{equation}
Consumers benefit from the discounts negotiated by large merchants to the extent that they shop at those merchants.
```

---

### Change 3.2: Vary "Intuitively" (line 142)

**Current:**
```latex
Intuitively, premium cardholders disproportionately shop at premium card-accepting merchants.
```

**Proposed:**
```latex
This reflects the fact that premium cardholders disproportionately shop at merchants that primarily serve other premium card users.
```

---

### Change 3.3: Vary "Intuitively" (line 224)

**Current:**
```latex
Intuitively, prior to Durbin, high debit interchange funded free checking accounts for such consumers, and these perks went away after the regulation \citep{Mukharlyamov.Sarin2025}.
```

**Proposed:**
```latex
Prior to Durbin, high debit interchange funded free checking accounts for these consumers; these perks disappeared after the regulation \citep{Mukharlyamov.Sarin2025}.
```

---

## Summary of Changes

| File | Change | Description |
|------|--------|-------------|
| introduction.tex | 1.1 | Clarify attenuation paragraph (what $8.6B is relative to) |
| introduction.tex | 1.2 | Reframe three parts as "measurement, modeling, application" |
| introduction.tex | 1.3 | Move structural model validation to main text |
| redistribution.tex | 2.1 | Add missing "Equation" before reference |
| redistribution.tex | 2.2 | Remove "Intuitively" from line 193 |
| redistribution.tex | 2.3 | (Optional) Condense calibration details |
| results.tex | 3.1 | Convert bullet points to \paragraph prose |
| results.tex | 3.2 | Remove "Intuitively" from line 142 |
| results.tex | 3.3 | Remove "Intuitively" from line 224 |

---

## Notes

- **Comma review:** I did not find obvious comma errors in redistribution.tex. The user may want to do a careful read-through for any subtle issues.
- **Calibration details (Change 2.3):** Marked as optional. The condensed version removes simulation parameters (M=300 markets, 100 firms, extreme calibration variant) but keeps the key point about large firm market power.
