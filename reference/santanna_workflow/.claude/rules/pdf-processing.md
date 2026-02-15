---
paths:
  - "master_supporting_docs/**"
---

# Robust PDF Processing

## Workflow
1. PDFs go to designated subdirectories
2. Verify file size and page count before processing
3. Split into manageable chunks (5 pages each) using Ghostscript
4. Read chunks ONE AT A TIME using Read tool
5. After scanning, focus on most relevant sections

## Error Handling
- Alternative splitting tools: pdftk
- Reduce scope on persistent failures (fewer chunks per session)
- Request user-specified page ranges when needed

Prioritize working within memory constraints. Staged, targeted analysis over comprehensive consumption.
