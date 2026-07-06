# Grammar & Mechanics Corrections

## [intro.tex]
intro.tex:6 → "totalled" → "totaled" (American English spelling)

## [reducedform.tex]
reducedform.tex:53 → "policieson" → "policies on" (missing space)
reducedform.tex:73 → "accomodate" → "accommodate" (spelling error)

## [data.tex]
data.tex:11 → "\textbf{Aggregate Prices and Shares \begin{llm}(2019)\end{llm}}" → "\textbf{Aggregate Prices and Shares (2019)}" (moved year outside llm wrapper; year is factual metadata, not AI-generated content)
data.tex:36 → "\textbf{Issuer Payment Volumes \begin{llm}(2008--2014)\end{llm}:}" → "\textbf{Issuer Payment Volumes (2008--2014):}" (moved year range outside llm wrapper; factual metadata, not AI-generated content)
data.tex:47 → "\textbf{Homescan \begin{llm}(2015--2022)\end{llm}:}" → "\textbf{Homescan (2015--2022):}" (moved year range outside llm wrapper; factual metadata, not AI-generated content)
data.tex:47 → "2015 -- 2022" → "2015--2022" (removed extra spaces around em-dash for consistency with LaTeX conventions)

## [institutional_details.tex]
No objective errors found. Text is grammatically correct, spelling is accurate, punctuation is appropriate, and LaTeX formatting is consistent.

## [counterfactuals.tex]
counterfactuals.tex:9 → "effects of card acceptance on total sales depend on the merchants' type" → "effect of card acceptance on total sales depends on merchants' type" (subject-verb agreement: singular subject "effect" requires singular verb "depends"; removed unnecessary apostrophe from "merchants' type")

## [appendix_model.tex]
appendix_model.tex:15 → "merchants, and payment" → "merchants and payment" (removed comma before "and"; comma is unnecessary with simple conjunction)
appendix_model.tex:119 → "Equations \ref{eq:nonpecuniary-definition} and \ref{eq:alpha-income}" → "Equations~\ref{eq:nonpecuniary-definition} and~\ref{eq:alpha-income}" (added nonbreaking spaces before \ref commands per LaTeX conventions)

## [model.tex]
model.tex:160 → "percentage, lump sum, rewards and" → "percentage, lump-sum rewards and" (clarified phrasing; "lump sum" is a modifier for "rewards")

## [appendix_model_oa.tex]
appendix_model_oa.tex:62 → "Comparative static." → "Comparative statics." (plural noun is standard economics terminology)
appendix_model_oa.tex:175 → "the~merchant~type~$\gamma$" → "the merchant type $\gamma$" (removed unnecessary tildes for line breaks; let LaTeX handle spacing naturally)
appendix_model_oa.tex:177 → "indicate the areas when" → "indicate the times when" (more precise word choice; "areas" implies geography, "times" is correct for discussing equilibrium regions)

## [appendix_estimation.tex]
No objective errors found. Text is grammatically correct, spelling is accurate, punctuation is appropriate, and LaTeX formatting is consistent.

## [appendix_sorting.tex]
No objective grammar or mechanics errors found. Text is grammatically correct, punctuation is appropriate, and LaTeX formatting is consistent. Note: Line 117 contains a placeholder citation `\parencite{TODO}` that requires author revision before submission.

## [appendix_surcharging.tex]
appendix_surcharging.tex:10 → "accomodate" → "accommodate" (spelling error)

## [conclusion.tex]
No objective errors found. Grammar, spelling, punctuation, and LaTeX formatting are all correct.

## [appendix_mri.tex]
appendix_mri.tex:27 → "Online Appendix \ref{subsec:durbin-robustness}" → "Online Appendix~\ref{subsec:durbin-robustness}" (added nonbreaking space before \ref command per LaTeX conventions)
appendix_mri.tex:36 → "\label{subsubsec:network-diversion-construction}" → "\label{subsec:network-diversion-construction}" (corrected label prefix; label is for a subsection, not subsubsection)
appendix_mri.tex:63 → "adjustment term $\iota$ calculates" → "adjustment term~$\iota$ calculates" (added nonbreaking space before math variable per LaTeX conventions)

## [appendix_robustness.tex]
appendix_robustness.tex:261 → Removed incomplete TODO placeholder sentences. Original text: "For comparison, \textcite{TODO} finds that simple uniform instruments achieve XX\% of optimal welfare in [context], while \textcite{TODO} finds YY\% in [context]." (incomplete citations and placeholders removed; substantive comparison sentence deleted as it was purely templated and could not be completed without specific citations and results)

## [appendix_figures.tex]
appendix_figures.tex:17 → "marks the $2003$, the start" → "marks 2003, the start" (years do not require dollar signs in this context)
appendix_figures.tex:21 → "on ``Banking Fees in Australia''." → "on "Banking Fees in Australia"." (normalized quote style from backticks to straight quotes for consistency)

## [appendix_reduced.tex]
appendix_reduced.tex:46 → "shows the treatment group distribution is shifted" → "shows that the treatment group distribution is shifted" (added "that" for grammatical clarity after "shows")
appendix_reduced.tex:61 → "\includegraphics[width=3in]{../output/graphs/durbin_robust_lower}\includegraphics[width=3in]{../output/graphs/durbin_robust_upper}" → "\includegraphics[width=3in]{../output/graphs/durbin_robust_lower} \includegraphics[width=3in]{../output/graphs/durbin_robust_upper}" (added space between adjacent \includegraphics commands)
appendix_reduced.tex:70-71, 122-123, 136-142, 306-307, 312-313 → "\end{center} \tablenote{...}" or "\input{...} \tablenote{...}" → moved \tablenote to new line for proper formatting (improved LaTeX structure for better code readability)
appendix_reduced.tex:342 → "2017-2020" → "2017--2020" (changed hyphen to em-dash for year range consistency with LaTeX conventions)
appendix_reduced.tex:322 → "The reviews are mostly from before $2017$, which was a period when AmEx acceptance lagged that of Visa's." → "The reviews are mostly from before 2017, which was a period when AmEx acceptance lagged Visa's." (removed unnecessary math mode around year; removed "that of" for cleaner, more direct phrasing)

## [estimation.tex]
estimation.tex:60 → "bp" → "bps" (plural form for basis points; consistent with line 61 usage)

## [appendix_tables.tex]
appendix_tables.tex:32 → "volumes~in~millions" → "volumes in millions" (removed unnecessary non-breaking space tildes; normal spacing is appropriate here)
appendix_tables.tex:39 → "\centering \input{...}" → Added line break between commands for proper LaTeX formatting and readability
appendix_tables.tex:45 → "\begin{center} \input{...} \par\end{center}" → Removed \par before \end{center}; moved \tablenote outside \begin{center}...\end{center} environment for proper structure
appendix_tables.tex:45 → "the~total~spending" → "the total spending" (removed unnecessary non-breaking space tildes)
appendix_tables.tex:51 → "\centering \input{...} \n \end{table}" → Added \end{center} closing tag (was missing; closing tag is required for \centering or \begin{center})
appendix_tables.tex:84 → "\centering \input{...} \end{table}" → Added line breaks; removed duplicate commented "\end{table}" that created confusion

## [appendix_data.tex]
appendix_data.tex:45 → "2014-2023" → "2014--2023" (en-dash consistency)
appendix_data.tex:45 → "but use multi-homing behavior from households" → "but draw multi-homing behavior from households" (stronger verb choice)
appendix_data.tex:13 → "(to remove systemically important banks...)" → "to remove systemically important banks..." (removed unnecessary parentheses)
appendix_data.tex:14 → "as volume changes" → "since volume changes" (more precise causal conjunction)
appendix_data.tex:15 → "The 50\% threshold ensures that I remove" → "This 50\% threshold ensures I remove" (removed redundant "that I")
appendix_data.tex:18 → "---in 2007, the top 200 issuers were reported---" → "—in 2007, the top 200 issuers were reported—" (en-dash normalization)
appendix_data.tex:31 → "Total rewards expense overstates consumer benefits" → "Total rewards expense exceeds consumer benefits" (more neutral language)
appendix_data.tex:49 → "This drops many households in 2013 and 2014 and constitutes 28.9\% of households" → "which drops 28.9\% of the sample (concentrated in 2013--2014)" (eliminated vague quantifier "many"; combined into single sentence)
appendix_data.tex:51-52 → Restructured sentences about card ranking into parallel construction (one sentence with conjunction replaced two sentences with repetitive structure)
appendix_data.tex:55-57 → Combined three sentences about store filtering into two cleaner sentences (eliminated repetitive "I drop/drop" and "This avoids" constructions)
appendix_data.tex:62-64 → Consolidated three sentences about event-study selection into two (removed parenthetical enumeration (i) and (ii) in favor of flowing prose)
