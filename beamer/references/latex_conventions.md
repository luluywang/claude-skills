# Beamer LaTeX Conventions

Rules for writing the Kellogg Evergreen Beamer `.tex` source. Consult before
generating or fixing slides.

## Critical LaTeX rules

- Always use `aspectratio=169` (widescreen)
- Title slide must suppress headline and footline with `[plain,noframenumbering]`
- Use `\sectionslide{Title}` for major section dividers (purple background)
- Use `\subsectionslide{Title}` for subsection dividers (light background)
- Use `\statementslide{text}` for impactful quote/statement slides
- Use `\vskip` for vertical spacing (0.3em, 0.5em, 1em) -- not `\\[Npt]` in body
- Use `\textcolor{kelloggcoral}{text}` for emphasis/alerts
- Use `\textcolor{kellogggreen}{text}` for positive highlights
- Use `\textbf{}` and `\underline{}` for emphasis, not italic
- Math: use `\[ ... \]` for display equations, `$ ... $` for inline
- Images: `\includegraphics[height=0.80\textheight]{imagename}` for full-slide images
- Columns: `\begin{columns}[T] \begin{column}{0.47\textwidth} ... \end{column} \end{columns}`
- Use `\small` or `\footnotesize` when content is dense, not by default
- Set `\setlength{\itemsep}{0.1em}` inside itemize for tight lists
- Escape special characters: `\&`, `\%`, `\$`, `\#`, `\_`, `\{`, `\}`
- Use `\texttildelow` for tilde in text mode

## Design rules

- Vary slide types -- alternate between content, images, boxes, discussion
- Use colored boxes (bluebox/greenbox) for side-by-side comparisons
- Use pinkbox for warnings, quotes, or key takeaways
- Use purplebox for emphasis or summary points
- Section dividers before each major topic
- Discussion/interactive slides should have minimal content (whitespace is intentional)
- Images should be large -- `height=0.78\textheight` to `0.82\textheight` for full-image slides
- Two-column layouts use `0.47\textwidth` per column with `[T]` alignment
- Every deck should have: title, agenda, sections, content, summary

## Teaching-specific rules

- Include at least one discussion or poll question per major section
- Use the return decomposition macro (`\returndecomp`) for financial formulas
- Progressive reveal: build up complex ideas across multiple slides
- "Is this realistic?" slides -- ground theory in concrete examples
- End each section with actionable takeaways
- Quote slides (`\statementslide` or `\pinkbox`) for memorable points

## Compile command

Run pdflatex twice so cross-references resolve:

```bash
cd <work_dir> && pdflatex -interaction=nonstopmode <filename>.tex
pdflatex -interaction=nonstopmode <filename>.tex
```
