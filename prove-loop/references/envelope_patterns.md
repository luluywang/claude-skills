# Envelope-theorem patterns

Most micro-theory proofs that this skill handles invoke an envelope theorem
at some point — typically Milgrom-Segal (2002) or its smooth predecessor.
The actor and critic both consult this reference when an envelope step
appears.

## The two forms

### Smooth envelope (textbook)

If $V(\theta) = \max_{a \in A} u(a, \theta)$ with $u$ continuously
differentiable in $\theta$, $A$ compact, and the maximizer
$a^*(\theta)$ a singleton and continuous, then $V$ is differentiable and:

$$V'(\theta) = u_\theta(a^*(\theta), \theta).$$

Use this when the action set is compact and the maximizer is unique and
continuous in $\theta$. Cite as "by the envelope theorem (smooth form)."

### Milgrom-Segal envelope (the workhorse)

Drops the smoothness/uniqueness of the maximizer. Requires:

1. $u(a, \cdot)$ is absolutely continuous on $\Theta$ for each $a$.
2. There exists an integrable $b: \Theta \to \mathbb{R}_+$ with
   $|u_\theta(a, \theta)| \le b(\theta)$ for all $a$ and a.e. $\theta$.
3. $a^*(\theta) := \arg\max_{a} u(a, \theta)$ is non-empty for each $\theta$.

Conclusion:

$$V(\theta) = V(\underline{\theta}) + \int_{\underline{\theta}}^{\theta} u_\theta(a^*(s), s) \, ds.$$

(Where the integrand is well-defined a.e. by the envelope condition.)

This is the form to use whenever the action space is discrete, the maximizer
is non-unique on a set of positive measure (typical in mechanism design with
ironing), or differentiability of $V$ is what you are trying to prove rather
than assume.

## Pitfalls the critic should flag

### 1. Integrability of $u_\theta$ never verified

Citing Milgrom-Segal without checking that the equicontinuity / dominating
function condition holds. In a quasilinear screening model with
$u(a, \theta) = \theta v(a) - t(a)$, this is usually trivial (bound $v$ on
the compact action set). In richer settings, it is not — flag it.

### 2. Maximum vs. argmax confusion

The envelope theorem says $V'(\theta) = u_\theta(a^*(\theta), \theta)$,
**not** $V'(\theta) = u_\theta(a, \theta)|_{a = a^*}$. The first is the
partial derivative of $u$ in its second argument, evaluated *at the
optimizer*. Common error: writing $\frac{d}{d\theta} u(a^*(\theta), \theta)$
and applying the chain rule, then arguing the inner term vanishes by
optimality. That is correct only at interior optima with smooth $a^*$;
Milgrom-Segal's whole point is that you don't need either.

### 3. Differentiating under the integral without justification

After invoking the integral form, the proof often differentiates back. This
is fine if you stay within "almost everywhere" claims, but if the proof
asserts pointwise differentiability of $V$, that is a stronger claim
requiring continuity of $u_\theta(a^*(\cdot), \cdot)$, which is not automatic.

### 4. Non-decreasing $a^*$ assumed without single-crossing

Proofs that argue $V$ is convex (and therefore differentiable a.e.) often
quietly use that $a^*(\theta)$ is non-decreasing. That conclusion needs
a single-crossing or supermodularity assumption. Flag if missing.

### 5. Integration constant lost

The integral form pins $V(\theta)$ only up to $V(\underline{\theta})$. In
mechanism design, the boundary condition (typically IR at the lowest type)
is what nails it down. Proofs that invoke the integral form without saying
what pins the boundary are incomplete.

### 6. Closed vs. open type interval

If $\Theta = [\underline{\theta}, \overline{\theta}]$, the integral form
gives $V$ on the closed interval; if $\Theta$ is open or the support has
atoms, the statement needs adjustment. Usually fine, but flag it if the
proof leans on behavior at the boundary.

## Worked template

Use this skeleton when the proof needs the envelope step:

```latex
\begin{lemma}[Envelope]\label{l:envelope}
Suppose Assumptions~\ref{a:integrability} and~\ref{a:compact} hold. Then
$V(\theta) = \max_{a \in A} u(a, \theta)$ is absolutely continuous on
$\Theta$, and for any selection $a^*(\theta) \in \arg\max_a u(a, \theta)$,
$$V(\theta) = V(\underline{\theta}) + \int_{\underline{\theta}}^{\theta} u_\theta(a^*(s), s) \, ds.$$
\end{lemma}

\begin{proof}
We verify the conditions of Milgrom and Segal (2002, Theorem 2):
(i) For each fixed $a \in A$, $u(a, \cdot)$ is absolutely continuous on
$\Theta$ by Assumption~\ref{a:integrability}.
(ii) The dominating function $b(\theta) := \sup_a |u_\theta(a, \theta)|$ is
integrable on $\Theta$ by [argument specific to the setting].
The conclusion follows.
\end{proof}
```

The boundary value $V(\underline{\theta})$ is then determined by whatever
additional structure the main theorem requires (e.g. the lowest type's IR
binding).
