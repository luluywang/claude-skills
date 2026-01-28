---
**Model Directive:** Use **Haiku** for table validation. This task involves cross-referencing values with text—mechanical consistency checking.
---

# Table Validation Task

Cross-reference table values with the main text.

## Table to Validate
Table {{TABLE_NUMBER}}: {{TABLE_TITLE}}

Key values found:
{{KEY_VALUES}}

## Text Context (pages {{START_PAGE}} to {{END_PAGE}})
```
{{CONTEXT_TEXT}}
```

## Tasks
1. **Search for each key value** in the surrounding text
2. **Check consistency**:
   - Same number appears?
   - Same context/interpretation?
   - Any contradictions?

3. **Find references** like:
   - "As shown in Table X..."
   - "Table X presents..."
   - "The results in Table X..."

## Output Format
```json
{
  "table_number": "{{TABLE_NUMBER}}",
  "validation_results": {
    "values_found_in_text": ["45,231", "0.34"],
    "values_not_found": ["10,432"],
    "text_references": [
      {
        "page": 15,
        "quote": "As Table 1 shows, the mean income is $45,231"
      }
    ],
    "inconsistencies": []
  }
}
```

## Notes
- If values cannot be found, note this in values_not_found
- Inconsistencies mean different values reported in text vs table
- Missing text references is normal - tables are not always explicitly discussed
