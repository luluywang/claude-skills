# Beamer Slide Types

Every slide in a deck is one of these types. During Phase 1, assign a type to
each slide. Use at least 4 different types per deck. These are tailored for
teaching and classroom discussion.

## Type 1: TITLE

Full-bleed purple background with geometric pattern. Title, subtitle (course
number + term), author, institution, date. Suppress headline and footline.
One per deck, always first.

```latex
{
\setbeamertemplate{headline}{}
\setbeamertemplate{footline}{}
\begin{frame}[plain,noframenumbering]
\titlepage
\end{frame}
}
```

## Type 2: AGENDA

Simple enumerated list of topics for the session. Frame title: "Agenda For Today"
or similar. Use `\begin{enumerate}` with 3-5 items.

## Type 3: SECTION DIVIDER

Uses `\sectionslide{Title}` for major sections or `\subsectionslide{Title}` for
sub-topics. Purple background (section) or light background (subsection). No body
text -- just the section name. Used to separate major parts of the lecture.

## Type 4: CONTENT (Bullet Points)

The workhorse slide. Frame title + bullet points. Structure:
- Main points as level-1 items (black square bullets)
- Supporting details as level-2 items (purple triangle bullets)
- Use `\vskip0.3em` or `\vskip0.5em` between logical groups
- Bold key terms with `\textbf{}`
- Color-highlight critical values with `\textcolor{kelloggcoral}{}`

Keep to 4-6 bullet points max. If more content is needed, split across slides.

## Type 5: FULL IMAGE

Frame title at top, then a single image filling the remaining space. Minimal or
no body text. The image should be large:

```latex
\begin{center}
\includegraphics[height=0.80\textheight]{imagename}
\end{center}
```

Use for: charts, graphs, screenshots, infographics, data visualizations.

## Type 6: IMAGE + TEXT

Two-column layout with text on one side and image on the other:

```latex
\begin{columns}[T]
\begin{column}{0.47\textwidth}
  % Bullets or text
\end{column}
\begin{column}{0.47\textwidth}
  \includegraphics[width=0.9\textwidth]{imagename}
\end{column}
\end{columns}
```

## Type 7: COLORED BOX COMPARISON

Side-by-side colored boxes for contrasting two concepts. The signature teaching
layout:

```latex
\begin{columns}[T]
\begin{column}{0.47\textwidth}
\begin{bluebox}[title={\textbf{Concept A}}]
  % Content
\end{bluebox}
\end{column}
\begin{column}{0.47\textwidth}
\begin{greenbox}[title={\textbf{Concept B}}]
  % Content
\end{greenbox}
\end{column}
\end{columns}
```

Variants:
- **bluebox + greenbox**: neutral comparison (most common)
- **bluebox + pinkbox**: good vs. bad / correct vs. incorrect
- **Single pinkbox**: warnings, important quotes, key takeaways
- **Single purplebox**: emphasis, summary points
- **Boxes with images**: embed `\includegraphics` inside boxes

## Type 8: EQUATION / FORMULA

Display equation as the focal point. Title + brief setup text, then:

```latex
\[
  P_{i,0} = \sum_{t=1}^{\infty} \frac{FCF_{i,t}}{(1+r_i)^t}
\]
```

Optional: bullet points below explaining each variable. Keep surrounding text
minimal so the equation stands out.

## Type 9: RETURN DECOMPOSITION

Uses the `\returndecomp` macro for financial return breakdowns:

```latex
\returndecomp{Total Return}{Dividend Yield}{Earnings Growth}{Growth in P/E}
```

Creates a visual 4-component decomposition with rounded boxes and operators.
Combine with bullet points above/below for context.

## Type 10: DISCUSSION / INTERACTIVE

A question or prompt with intentionally sparse content. Lots of whitespace for
live discussion. Patterns:

- Single question with 1-2 bullet points
- "PollEv:" prefix for audience polling questions
- "Should you...?" framing for investment decisions
- Rhetorical questions to transition between sections

```latex
\begin{frame}{Should You Invest?}
\begin{itemize}
  \item Do you think Tesla in 10 years will have over 20 times the earnings?
  \item What if you thought Tesla would only grow to 10 times the earnings?
\end{itemize}
\end{frame}
```

## Type 11: STATEMENT

Full-bleed purple background with a large quote or key insight:

```latex
\statementslide{If you sit down at the poker table and you don't know
who's the worst player, you're it.}
```

Use sparingly (1-2 per deck) for maximum impact.

## Type 12: PROGRESSIVE BUILD

A series of 2-3 slides with the same frame title that progressively add content.
Earlier slides pose the question; later slides fill in the answer. Used for
worked examples and step-by-step derivations.

## Type 13: DATA TABLE

Content slide with a styled table:

```latex
\begin{center}
\begin{tabular}{lcc}
\toprule
  & Column A & Column B \\
\midrule
  Row 1 & value & value \\
  Row 2 & value & value \\
\bottomrule
\end{tabular}
\end{center}
```

Use `booktabs` rules (`\toprule`, `\midrule`, `\bottomrule`). Keep tables simple.

## Type 14: SUMMARY

End-of-lecture summary slide. Frame title: "Summary" or "Key Takeaways". Use
bullet points recapping the main ideas. Often the last content slide before
any closing divider.
