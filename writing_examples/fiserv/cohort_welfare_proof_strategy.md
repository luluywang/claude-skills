# Proof Strategy: Cohort-Level Welfare under Endogenous Payment Choice

**Goal.** The endogenous-choice appendix (`appendix_endogenous_choice.tex`,
Theorem `thm:endo-welfare`) currently proves only the *aggregate* consumer
welfare effect,
$$
\int \frac{dV_i}{\lambda_i}\,di \;=\; -\,\mathbb{E}_R\!\Big[\textstyle\sum_k \tau_{jk}\,d\mu_{jk}\Big] + O(\tau_{\max}^2).
$$
We want a **cohort-level** statement: the welfare effect on *current debit-card
users* versus *current credit-card users*, paralleling the exogenous-choice
sufficient statistic (Theorem `thm:sufficient-stat`,
eq. `eq:sufficient-stat-formula`). This document lays out a proposed proof, the
target formula, and—most importantly—**the additional assumptions the cohort
result needs that the aggregate result does not**, with an explanation of what
breaks without each one.

> ⚠️ **STATUS: the headline formula in §2 is WRONG as written.** An adversarial
> review (and independent re-checks) found a fatal order-of-magnitude error: the
> cohort result is only $O(\tau_{\max})$-accurate, and at that order the
> composition / cross-subsidy term cannot be isolated. **Read §7 first** — it
> corrects §2–§5 and gives the two honest ways forward. §1–§6 are retained as the
> original (flawed) proposal so the error and its fix are both visible.

---

## 1. What "cohort welfare" means once choice is endogenous

In the exogenous model a "cohort" is a primitive: type-$k$ consumers are a fixed
group with a representative basket. With endogenous choice there is no primitive
cohort—every consumer $i$ picks $k_i^* = \arg\max_k\{\widetilde V_{ik}(p,f_k)+\eta_{ik}\}$.

We therefore define a cohort by its **baseline** choice:
$$
\mathcal{C}_k \;\equiv\; \{\, i : k_i^* = k \text{ at the initial equilibrium} \,\}, \qquad \mu_k = \int_{\mathcal{C}_k} di.
$$
"Welfare of current debit users" is the change in welfare of the *fixed set*
$\mathcal{C}_{\text{debit}}$, evaluated as the policy perturbs the equilibrium.
A consumer who switches debit→credit in response to the perturbation is counted
in $\mathcal{C}_{\text{debit}}$ (her baseline cohort), with the debit reward
change—this is the right convention for "who currently holds debit."

**Target object (cohort total, money-metric):**
$$
\frac{dW_k}{\lambda} \;\equiv\; \int_{\mathcal{C}_k} \frac{dV_i}{\lambda_i}\, di,
\qquad
\sum_k \frac{dW_k}{\lambda} = \int \frac{dV_i}{\lambda_i}\, di \;\;(\text{aggregate}).
$$
Per-capita welfare for cohort $k$ is $\mu_k^{-1}\,dW_k/\lambda$, the natural
analog of `eq:sufficient-stat-formula`.

---

## 2. The target formula

Set $\rho^P=\rho^R=1$ (as the endogenous appendix does). The claim is:

$$
\boxed{\;
\frac{dW_k}{\lambda}
= \underbrace{\mathbb{E}_R\!\Big[\mu_{jk}\big(d\tau_{jk}-\textstyle\sum_m \mu_{jm}\,d\tau_{jm}\big)\Big]}_{\text{(i) mechanical term}=\,dW_k^{\text{exo}}/\lambda}
\;\underbrace{-\;\mathbb{E}_R\!\Big[\mu_{jk}\textstyle\sum_m \tau_{jm}\,d\mu_{jm}\Big]}_{\text{(ii) composition (switching) term}}
\;+\; O(\tau_{\max}^2).
\;}
$$

Two readings make this useful:

- **Term (i) is exactly the exogenous-choice cohort welfare.** For a baseline
  shift $d\tau_{jm}=\mathbb{1}\{m=l\}\,dx_l$ it equals
  $(\mathbb{1}\{k=l\}\,\mu_k - \mathbb{E}_R[\mu_{jk}\mu_{jl}])\,dx_l$, i.e. $\mu_k\cdot$ eq. `eq:sufficient-stat-formula`. So **endogenous-choice cohort welfare = exogenous cohort welfare − a composition correction.**

- **Term (ii) is a cross-subsidy.** Write the per-merchant composition loss
  $\ell_j \equiv \sum_m \tau_{jm}\,d\mu_{jm} = \sum_m (\tau_{jm}-\hat\tau_j)\,d\mu_{jm}$
  (recenterable because $\sum_m d\mu_{jm}=0$). Then term (ii) $=-\mathbb{E}_R[\mu_{jk}\ell_j]$, and a revenue-weighted covariance decomposition gives
$$
\frac{dW_k}{\lambda}
= \frac{dW_k^{\text{exo}}}{\lambda}
\;-\; \underbrace{\mu_k\,\mathbb{E}_R[\ell_j]}_{\text{fair share of aggregate loss}}
\;-\; \underbrace{\mathrm{Cov}_R\!\big(\mu_{jk},\,\ell_j\big)}_{\text{cross-subsidy across cohorts}}
\;+\; O(\tau_{\max}^2).
$$
  Because $\mathbb{E}_R[\ell_j]$ is the *whole* aggregate loss of
  Theorem `thm:endo-welfare`, every cohort bears it in proportion to its size
  $\mu_k$; the **covariance term is the only thing that redistributes the
  composition loss *between* cohorts.** The debit-vs-credit comparison is
$$
\frac{1}{\mu_C}\frac{dW_C}{\lambda}-\frac{1}{\mu_D}\frac{dW_D}{\lambda}
= \Big(\text{mechanical diff}\Big)
- \Big(\tfrac{1}{\mu_C}\mathrm{Cov}_R(\mu_{jC},\ell_j) - \tfrac{1}{\mu_D}\mathrm{Cov}_R(\mu_{jD},\ell_j)\Big)+O(\tau_{\max}^2).
$$

This is the payoff: **whether current credit users gain at the expense of
current debit users is governed by whether each cohort is over-represented
(across merchants, by revenue) at the merchants where the payment mix shifts
toward high-fee methods.** That correlation is, in turn, controlled by how
adoption elasticities covary with merchant fee structure—exactly the object the
additional assumptions must pin down.

---

## 3. Proof steps

The structure reuses the existing machinery; the only genuinely new step is the
*cohort* spending identity (Step 2).

**Step 1 — Per-consumer envelope (already in the appendix).**
By Roy's identity, for $i\in\mathcal{C}_k$,
$$
\frac{dV_i}{\lambda_i} = -\sum_j s^*_{ijk}\,d\log p_j + df_k,
$$
evaluated at her baseline method $k$. By Williams–Daly–Zachary this is the change
in her ex-ante (pre-taste-shock) welfare, and the switching margin is first-order
negligible *for her* because she was indifferent. **Atomless $F$** makes the set
of exactly-indifferent consumers measure zero, so $\mathcal{C}_k$ is well-defined
and each consumer is assigned to a unique baseline cohort. *(This is why atomless
tastes—already assumed—are load-bearing for the cohort result, not just the
aggregate one.)*

**Step 2 — Cohort spending identity (new).** Integrate Step 1 over $\mathcal{C}_k$:
$$
\frac{dW_k}{\lambda} = -\sum_j S_{jk}\,d\log p_j + \mu_k\,df_k,
\qquad S_{jk}\equiv \int_{\mathcal{C}_k} s^*_{ijk}\, di.
$$
$S_{jk}$ is cohort $k$'s total (normalized) spending at merchant $j$. Because
atomless $F$ makes choice deterministic a.e., $\pi_{ik}=\mathbb{1}\{k_i^*=k\}$, so
$\mu_{jk}$ (method $k$'s share of merchant $j$'s revenue) aggregates *exactly* the
cohort-$\mathcal{C}_k$ consumers. With total revenue $=1+O(\tau_{\max})$ this yields
the **cohort spending identity**
$$
S_{jk} = \omega_j\,\mu_{jk} + O(\tau_{\max}),\qquad \textstyle\sum_j S_{jk}=\mu_k.
$$
Hence $\sum_j S_{jk}\,d\log p_j = \mathbb{E}_R[\mu_{jk}\,d\log p_j]+O(\tau_{\max}^2)$.
*(Note: this identity is definitional given atomless $F$—it does **not** require
homogeneity within the cohort. Within-cohort heterogeneity and selection on
preferences are fully summarized by the observed $\mu_{jk}$.)*

**Step 3 — Reward and price responses (reuse existing results).**
- Reward (network balance, full pass-through): $\mu_k\,df_k = \mathbb{E}_R[\mu_{jk}\,d\tau_{jk}]+O(\tau_{\max}^2)$.
- Price decomposition (chain rule on `eq:retail-price-pass`):
  $d\log p_j = \sum_m \mu_{jm}\,d\tau_{jm} + \sum_m \tau_{jm}\,d\mu_{jm}$.

**Step 4 — Assemble.** Substitute Steps 2–3 into Step 1 and group $d\tau$ terms:
$$
\frac{dW_k}{\lambda}
= \mathbb{E}_R\!\Big[\mu_{jk}\big(d\tau_{jk}-\textstyle\sum_m\mu_{jm}d\tau_{jm}\big)\Big]
- \mathbb{E}_R\!\Big[\mu_{jk}\textstyle\sum_m\tau_{jm}\,d\mu_{jm}\Big]+O(\tau_{\max}^2),
$$
the target formula. Summing over $k$ (using $\sum_k\mu_{jk}=1$) recovers
Theorem `thm:endo-welfare` exactly, confirming internal consistency.

**Order accounting (the subtle point).** A fee perturbation $dx_l$ moves rewards
one-for-one ($df/dx_l=O(1)$), so the adoption response is
$d\mu_{jm}/dx_l = O(1)$, *not* $O(\tau_{\max})$. The composition term carries the
fee *level* $\tau_{jm}=O(\tau_{\max})$ as a weight, so
$\sum_m \tau_{jm}\,d\mu_{jm}/dx_l = O(\tau_{\max})$—**leading order, kept**, exactly
as in the aggregate theorem. This is why the cohort result needs a *bound on the
adoption response* (Assumption EC2 below): without it, $d\mu_{jm}/dx_l$ need not
be $O(1)$ and term (ii) is not controlled.

---

## 4. Additional assumptions required (beyond the aggregate theorem)

The aggregate theorem needs only Assumptions `dominant-diagonal`–`income-elasticity`
plus atomless tastes. The cohort result needs the following *additions*. Each is
tagged with the role it plays and **what breaks without it**.

### EC1 — Absolutely continuous tastes with bounded marginal density
*(strengthens "atomless $F$")*

**Statement.** $F$ is atomless **and** the density of consumers near each
pairwise indifference margin $\{i:\widetilde V_{ik}+\eta_{ik}=\widetilde V_{il}+\eta_{il}\}$
is bounded.

**Role.** Atomlessness alone makes $\mathcal{C}_k$ well-defined and Step 1's
envelope clean. The *bounded marginal density* is what makes the adoption response
$d\mu_{jk}/dx_l$ finite and the cohort a smooth function of the policy—needed for
the first-order expansion in Step 4 to exist.

**What breaks without it.** With an atom (a positive mass exactly indifferent),
the WDZ envelope cannot assign a unique welfare effect to switchers, and a
marginal reward change moves a discrete mass of consumers, making $d\mu_{jk}$
ill-defined as a derivative.

---

### EC2 — Bounded adoption (switching) elasticity
*(maps to the user's hint: "elasticity of payment adoption with respect to rewards")*

**Statement.** Each merchant's payment share has a finite adoption semi-elasticity
$$
\Theta_{jm,l}\;\equiv\;\frac{\partial \mu_{jm}}{\partial f_l}, \qquad \sum_l|\Theta_{jm,l}|\le \bar\Theta<\infty \ \ \forall j,m,
$$
so that $d\mu_{jm}/dx_l = O(1)$. (Equivalently: the mass of consumers near each
switching margin, weighted by their spending at $j$, is uniformly bounded.)

**Role.** This is the new primitive that the *endogenous* term (ii) introduces,
the analog of the demand bounds $M,m,L$ that control the exogenous contraction. It
guarantees the composition term is $O(\tau_{\max})$ (leading order, finite) and
lets one write
$$
d\mu_{jm} = \sum_l \Theta_{jm,l}\,df_l + (\text{price-driven intensive margin}),
$$
turning $\ell_j$ and the cross-subsidy covariance into estimable functions of
**measured adoption elasticities times the reward change**.

**What breaks without it.** If switching elasticities are unbounded (e.g. a knife-edge
mass of indifferent consumers at some merchant), term (ii) blows up; the cohort
formula remains formally true in terms of realized $d\mu_{jk}$, but it is neither
$O(\tau_{\max})$-controlled nor expressible as a sufficient statistic in measurable
elasticities. EC2 also (implicitly) needs to enter a contraction-style threshold so
that the joint price/reward/adoption fixed point stays well-posed—a natural
extension of Step C's bound $\bar\tau=1/C$ with $C$ augmented to include $\bar\Theta$.

---

### EC3 — Payment-invariant baskets (no causal effect of the instrument on consumption), or bounded such effect
*(maps to the user's hint: "how much payment choice affects consumption decisions")*

**Statement.** Either (strong form) $U_{ik}=U_i$ for all $k$, so baskets depend on
the method only through the budget $1+f_k$ (a pure income effect); or (weak form)
the direct causal effect of $k$ on the basket is $O(\tau_{\max})$:
$\big\|\,q^*_{ijk}-q^*_{ijl}\,\big\|$ attributable to the instrument (net of the
$1+f_k$ income difference) is $O(\tau_{\max})$.

**Role.** The bare formula in §2 holds in terms of *observed* $\mu_{jk}$ and
$d\mu_{jk}$ even with strong causal effects, because everything is evaluated at the
baseline. EC3 is what makes the **interpretation and the comparative statics
clean**:

1. It separates $d\mu_{jk}$ into (a) a reward-driven *extensive* margin
   (adoption, governed by EC2) and (b) a price-driven *intensive* margin that maps
   to the demand elasticities $E$, with **no third channel** in which switching
   methods mechanically reshuffles a consumer's basket across merchants. Under EC3,
   $\ell_j$ is "reward-chasing adoption into high-fee methods," the clean object the
   prose in `appendix_endogenous_choice.tex` (the "Fees, not rewards" paragraph)
   already describes.
2. It makes the cohort label economically interpretable: $\mu_{jk}$ reflects *who
   selects* method $k$ (selection on preferences), not a *consequence* of holding
   the instrument. Otherwise the debit-vs-credit comparison conflates "credit users
   shop at high-fee merchants" with "using credit *causes* them to," and the
   counterfactual welfare of moving a debit user to credit is no longer captured by
   her baseline $s^*_{ijk}$.

**What breaks without it.** With a large causal effect, term (ii) contains a basket-
reallocation component that is *not* a function of adoption elasticities, so the
cross-subsidy is no longer identified from payment shares + adoption elasticities
alone; consumer-level basket-response data would be required. The *aggregate*
theorem is immune (it never decomposes $d\mu$), which is exactly why this
assumption is *new* to the cohort exercise.

---

### EC4 — Adoption elasticities orthogonal to cohort exposure (or a signed correlation), conditional on the fee
*(maps to the user's hint: "how adoption elasticities are correlated with other merchant characteristics")*

**Statement.** Across merchants (revenue-weighted), the composition loss $\ell_j$
is mean-independent of cohort $k$'s revenue weight given the fee level:
$$
\mathrm{Cov}_R\big(\mu_{jk},\,\ell_j\big)=0 \quad\text{for each cohort }k.
$$
A sufficient primitive condition: the adoption-elasticity-weighted fee shift
$\ell_j$ depends on the merchant only through objects (e.g. average fee $\hat\tau_j$)
that are uncorrelated, across the revenue distribution, with the *gap* between
cohorts' presence $\mu_{jk}-\mu_k$.

**Role.** This is the assumption that delivers a **clean comparative verdict**.
Under EC4 the cross-subsidy covariance vanishes, every cohort bears the aggregate
composition loss strictly in proportion to its size, and
$$
\frac{1}{\mu_k}\frac{dW_k}{\lambda} = \frac{1}{\mu_k}\frac{dW_k^{\text{exo}}}{\lambda} - \mathbb{E}_R[\ell_j] + O(\tau_{\max}^2)
\quad\text{(same composition loss per dollar for all cohorts).}
$$
Then any debit-vs-credit difference comes *only* from the mechanical
(exogenous-type) term—the familiar second-moment overlap—and not from differential
exposure to switching. Conversely, **relaxing EC4 to a signed correlation is what
generates a cross-subsidy**: if high-fee merchants (large $\ell_j>0$) draw
disproportionately on credit users ($\mathrm{Cov}_R(\mu_{jC},\ell_j)>0$), then
current credit users bear *more* than their proportional share of the
composition loss, and the sign of the debit-vs-credit gap is determined.

**What breaks without it.** Without EC4 (or a sign restriction on it) the formula
is still valid but **silent on the comparative question**: the debit-vs-credit
difference is an unrestricted covariance that could go either way. EC4 is therefore
the assumption that converts the decomposition into an *economic conclusion* about
who pays.

---

## 5. Summary table

| Assumption | User's hint it addresses | Needed for | Breaks if violated |
|---|---|---|---|
| **EC1** abs. continuous tastes, bounded marginal density | (atomless extension) | cohorts well-defined; $d\mu$ a derivative | envelope can't assign switchers; $d\mu$ discontinuous |
| **EC2** bounded adoption elasticity | adoption elasticity w.r.t. rewards | term (ii) is $O(\tau_{\max})$ & estimable; well-posed fixed point | composition term uncontrolled / not a sufficient statistic |
| **EC3** payment-invariant (or bounded-causal) baskets | payment choice → consumption | clean switching interpretation; cohort label = selection not causation | cross-subsidy needs consumer basket-response data |
| **EC4** adoption elasticity ⟂ cohort exposure (or signed) | adoption-elasticity / merchant-characteristic correlation | clean debit-vs-credit verdict; sign of cross-subsidy | comparison is an unrestricted covariance, no conclusion |

**Headline.** The cohort *formula* needs essentially only EC1–EC2 (well-defined,
controlled). The economically interesting *cohort comparison*—do current credit
users gain at current debit users' expense—is decided by EC3 (so the comparison is
about reward-chasing, not instrument-caused consumption) and EC4 (the correlation
between adoption responsiveness and merchant fee structure). EC3 and EC4 are
precisely the two channels absent from the aggregate theorem.

---

## 6. Risks / things a skeptic should check

1. **Is the cohort spending identity $S_{jk}=\omega_j\mu_{jk}+O(\tau_{\max})$ really
   assumption-free given atomless $F$, or does it smuggle in a no-selection
   condition?** I claim it is definitional (both sides aggregate the same
   deterministic-choice consumers), but this deserves adversarial scrutiny—esp.
   whether the $O(\tau_{\max})$ remainder is uniform across cohorts when cohorts
   differ systematically in spending levels.
2. **Order of the composition term.** I argue $d\mu/dx_l=O(1)$ and the term is
   leading-order $O(\tau_{\max})$. Verify this against the aggregate theorem's own
   treatment of $\sum_k\tau_{jk}d\mu_{jk}$ and that the $O(\tau_{\max}^2)$ remainder
   in the cohort statement is genuinely uniform.
3. **Does EC3 belong to the formula or only the interpretation?** I placed it as
   interpretive + comparative. A skeptic might argue the *intensive price margin*
   in $d\mu$ already requires the demand bounds and that EC3 is therefore stronger
   than necessary—or, conversely, that without EC3 even the baseline-evaluated
   $S_{jk}$ is not policy-stable. Pin this down.
4. **Well-posedness of the joint fixed point with adoption.** Adding adoption to
   the price/reward system in Step C of `appendix_theory.tex` enlarges the operator
   $T$. Confirm the contraction threshold survives (with $C$ augmented by
   $\bar\Theta$) and that EC2's bound is exactly what's needed.
5. **Is EC4 testable / are the covariances signable from data?** The comparative
   result is only as useful as our ability to estimate
   $\mathrm{Cov}_R(\mu_{jk},\ell_j)$. Check whether the paper's merchant-level
   payment-share data plus an adoption-elasticity estimate suffice, or whether EC4
   is effectively an untestable identifying assumption.

---

## 7. Revision after adversarial review (CORRECTS §2–§5)

An adversarial referee, plus independent re-derivation, found a **fatal
order-of-magnitude error** in the §2 headline. This section states it, proves it,
and gives the honest result.

### 7.1 The error

§2 claims the cohort formula holds with remainder $O(\tau_{\max}^2)$ and that the
composition / cross-subsidy term (ii) is a clean, isolatable first-order object.
**Both claims are false.** The correct remainder is $O(\tau_{\max})$, and at that
order term (ii) cannot be separated from several other dropped terms of the same
size.

The tell is in the paper itself: the **exogenous-choice cohort theorem**
(`eq:sufficient-stat-formula`) carries remainder $O(\tau_{\max})$, **not**
$O(\tau_{\max}^2)$. Endogenizing choice cannot *improve* the achievable accuracy
for cohorts. My §2 implicitly claimed an order the paper's own simpler result does
not reach.

### 7.2 Why the order is $O(\tau_{\max})$, not $O(\tau_{\max}^2)$

- **Cohort welfare derivatives have an $O(1)$ leading term.** The price-overlap
  term $-\mathbb{E}_R[\mu_{jk}\mu_{jl}\,\partial\tau_{jl}/\partial x_l]$ and the
  own-reward term are each $O(1)$ and do **not** cancel for a single cohort (this
  is redistribution—the whole point of Theorem 1). Natural accuracy is one order
  down: remainder $O(\tau_{\max})$.
- **The aggregate gets $O(\tau_{\max}^2)$ only via an adding-up cancellation.**
  Summing over $k$ with $\sum_k\mu_{jk}=1$ makes the $O(1)$ price and reward terms
  cancel, so the *aggregate* leading term is the $O(\tau_{\max})$ composition loss,
  and its remainder is one order down, $O(\tau_{\max}^2)$.
- **No such cancellation exists cohort-by-cohort.** Hence the cohort composition
  term (ii) $=O(\tau_{\max})$ sits at exactly the cohort remainder order. It is at
  the noise floor.

### 7.3 Concrete demonstration (own derivation)

Start from the exact cohort identity. With $X_{jk}=\int_{\mathcal C_k}p_jq^*_{ijk}\,di$,
$R_j=\sum_l X_{jl}=\omega_j R$, $R=\sum_k\mu_k(1+f_k)=1+\bar f$ where
$\bar f\equiv\sum_k\mu_k f_k=O(\tau_{\max})$, and $\mu_{jk}=X_{jk}/R_j$, the
cohort spending is $S_{jk}=X_{jk}/(1+f_k)=\omega_j\mu_{jk}\,R/(1+f_k)$. So **exactly**
$$
\frac{dW_k}{\lambda}
= -\frac{R}{1+f_k}\,\mathbb{E}_R\!\Big[\mu_{jk}\,\tfrac{d\log p_j}{dx_l}\Big]
+ \mu_k\,\frac{df_k}{dx_l}.
$$
Two $O(\tau_{\max})$ terms that §2 silently set to zero:

1. **Spending deflator.** $\dfrac{R}{1+f_k}=\dfrac{1+\bar f}{1+f_k}=1+(\bar f-f_k)+O(\tau_{\max}^2)$.
   So the price term carries an extra
   $-(\bar f-f_k)\,\mathbb{E}_R[\mu_{jk}\mu_{jl}\,\partial\tau_{jl}/\partial x_l]=O(\tau_{\max})$.
   The factor $\bar f-f_k$ is **manifestly cohort-specific** (debit users carry
   $f_D$, credit users $f_C$, against the common mean $\bar f$): this term *by
   itself* redistributes across cohorts at first order. (The referee wrote the
   coefficient as $\bar f$; it is actually $\bar f-f_k$, which only sharpens the
   point.)
2. **Moving shares in the reward.** Differentiating
   $\mu_k f_k=\mathbb{E}_R[\mu_{jk}\tau_{jk}]+O(\tau_{\max}^2)$ gives
   $\mu_k\,df_k=\mathbb{E}_R[d(\mu_{jk}\tau_{jk})]-f_k\,d\mu_k$. The dropped
   $-f_k\,d\mu_k/dx_l=O(\tau_{\max})\cdot O(1)=O(\tau_{\max})$ — the extensive
   reward-flow term — is the **same order** as term (ii). Raising the credit fee
   raises credit rewards and pulls adopters into credit ($d\mu_C/dx_l>0$, $f_C>0$),
   a genuine first-order, cohort-specific welfare term.

§2 kept term (ii) while dropping (1) and (2). That is internally inconsistent. The
complete $O(\tau_{\max})$ cohort expansion is
$$
\frac{dW_k}{\lambda}
= \underbrace{\text{term (i)}}_{O(1),\ =\,\text{Thm 1}}
+ \underbrace{\text{term (ii)}}_{O(\tau_{\max})}
\underbrace{-(\bar f-f_k)\mathbb{E}_R[\mu_{jk}\mu_{jl}\tfrac{\partial\tau_{jl}}{\partial x_l}]}_{(a)}
+ \underbrace{\mathbb{E}_R[\tau_{jk}\tfrac{d\mu_{jk}}{dx_l}]}_{(b)}
\underbrace{-\,f_k\tfrac{d\mu_k}{dx_l}}_{(c)}
+ \underbrace{(\omega_j\text{-movement})}_{(d)}
+ O(\tau_{\max}^2),
$$
with (a)–(d) all $O(\tau_{\max})$ and cohort-specific. They **telescope to
$O(\tau_{\max}^2)$ only under $\sum_k$** (the Walras / adding-up cancellation),
which is exactly why "$\sum_k dW_k$ recovers the aggregate theorem" is true *and
yet* the per-cohort $O(\tau_{\max}^2)$ claim is false.

### 7.4 Consequence

At the accuracy this framework delivers for cohorts ($O(\tau_{\max})$, identical to
Theorem 1), the endogenous composition term — and hence the entire **clean
covariance cross-subsidy** of §2 — is below the noise floor. The decomposition
"$dW_k=$ Thm 1 $-$ cross-subsidy" is **not** a valid first-order sufficient
statistic.

### 7.5 Two honest ways forward

**(1) Downgrade the claim.** State that, to first order (Theorem 1's accuracy),
endogenous payment choice leaves *cohort* welfare equal to the exogenous result;
the inter-cohort redistribution from reward-driven switching is a
within-$O(\tau_{\max})$ effect the sufficient-statistic approach cannot isolate.
Clean and defensible, but concedes there is no new cohort-level content. (Note this
does not contradict the aggregate theorem: the aggregate composition *loss* is
real and first-order *because* the $O(1)$ pieces cancel in aggregate; it must be
borne by cohorts at $O(\tau_{\max})$, but pinning each cohort's share needs route 2.)

**(2) Full first-order expansion.** Derive the complete $O(\tau_{\max})$ cohort
welfare from the exact identity in §7.3, keeping (a)–(d) and term (ii). This is a
valid object, but: (i) it is much messier than the clean covariance; (ii) it
requires **both** merchant-level and aggregate adoption responses
($d\mu_{jk}/dx_l$, $d\mu_k/dx_l$) to evaluate. So adoption elasticities (EC2)
become necessary for the **formula**, not merely its interpretation, and the
contraction must be re-proven with the adoption block.

### 7.6 Revised assumption roles

- **EC1 — fix the justification.** The model writes $\pi_{ik}=\Pr(k_i^*=k\mid i)$,
  a choice *probability*; atomlessness gives *smooth interior* probabilities, **not**
  the $\{0,1\}$ partition my "fixed set $\mathcal C_k$" needs. Either (a) commit to
  the deterministic-individual reading ($i$ is a point consumer with a realized
  taste draw $\eta_i$), and note that atomlessness only buys a measure-zero
  indifference boundary (so the envelope kink integrates to zero) — not the
  Williams–Daly–Zachary expected-max envelope, which is the *interior-probability*
  reading; or (b) define cohorts probability-weighted, $\int\pi_{ik}\,\frac{dV_i}{\lambda_i}\,di$,
  and keep WDZ. My §3 reason ("atomless $\Rightarrow\pi_{ik}\in\{0,1\}$") is backwards.
  *(The per-consumer envelope and the switcher logic are otherwise SOUND — the
  referee confirmed switchers are not the bug; generic cohort members are strict
  optimizers and the indifferent set is measure zero.)*
- **EC2 — promoted, and load-bearing.** It is needed for the **aggregate**
  endogenous theorem too (that proof already leans on bounded share movements while
  reusing the *intensive-margin* contraction), and for the cohort formula under
  route (2). The threshold must be re-derived with an adoption block of size
  $\sim\tau_{\max}\bar\Theta$; because rewards are a **first-order driver of card
  choice**, $\bar\Theta$ may be large and the contraction (hence the entire
  first-order expansion, aggregate *and* cohort) can fail. This needs a proof, not
  the one-sentence "$C$ augmented by $\bar\Theta$."
- **EC3 — roughly as stated**, but "formula valid under strong causal effects" is
  hollow: the cross-subsidy needs $d\mu$ *identified*, and under a causal channel
  $d\mu$ contains basket reallocation that is not a function of adoption
  elasticities.
- **EC4 — demoted.** $\mathrm{Cov}_R(\mu_{jk},\ell_j)$ is not an identifying
  assumption; it **is the estimand** — the very cross-subsidy we want to measure.
  Frame the debit-vs-credit comparison as *estimating* this covariance, with
  $\mathrm{Cov}=0$ a no-cross-subsidy benchmark, not a maintained hypothesis. (And
  per §7.4, even this covariance is only defined within the $O(\tau_{\max})$ band.)

### 7.7 The one thing to settle before writing any of this into the paper

**Prove or disprove that the four cohort-specific corrections (a)–(d) sum to
$O(\tau_{\max}^2)$ for each $k$ separately** (not merely under $\sum_k$). They
appear *not* to — they telescope only through the aggregate Walras cancellation. If
they do not, then term (ii), the cross-subsidy covariance, and the entire
debit-vs-credit verdict are not first-order objects, and the paper must take route
(1) (no new cohort content to first order) or route (2) (full $O(\tau_{\max})$
expansion requiring adoption elasticities and a fresh contraction proof).
