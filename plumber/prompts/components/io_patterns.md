# I/O Pattern Reference

Shared reference for file I/O function signatures across languages used in
economics research projects.

## R

### Read functions
| Function | Pattern | Notes |
|----------|---------|-------|
| `fread()` | `fread("path")` or `fread(file="path")` | data.table |
| `read.csv()` | `read.csv("path")` | base R |
| `read_csv()` | `read_csv("path")` | readr/tidyverse |
| `readRDS()` | `readRDS("path")` | base R |
| `read.dta()` | `read.dta("path")` | foreign/haven |
| `read_dta()` | `read_dta("path")` | haven |
| `load()` | `load("path")` | base R (.rda files) |
| `source()` | `source("path")` | executes R script |
| `read_xlsx()` | `read_xlsx("path")` | openxlsx/readxl |
| `read_feather()` | `read_feather("path")` | arrow |
| `read_parquet()` | `read_parquet("path")` | arrow |

### Write functions
| Function | Pattern | Notes |
|----------|---------|-------|
| `fwrite()` | `fwrite(dt, "path")` | data.table |
| `write.csv()` | `write.csv(df, "path")` | base R |
| `write_csv()` | `write_csv(df, "path")` | readr |
| `saveRDS()` | `saveRDS(obj, "path")` | base R |
| `ggsave()` | `ggsave("path")` | ggplot2 |
| `save()` | `save(obj, file="path")` | base R |
| `cat()` | `cat(text, file="path")` | base R (text output) |
| `pdf()` | `pdf("path")` | base R graphics device |
| `png()` | `png("path")` | base R graphics device |
| `sink()` | `sink("path")` | base R (redirect output) |
| `write_xlsx()` | `write_xlsx(df, "path")` | openxlsx |

### Path construction
- `paste0(VAR, "suffix")` — concatenation
- `file.path(dir, filename)` — cross-platform path join
- Pipe syntax: `"path" %>% fread()` or `"path" |> fread()`

## Python

### Read functions
| Function | Pattern | Notes |
|----------|---------|-------|
| `pd.read_csv()` | `pd.read_csv("path")` | pandas |
| `pd.read_excel()` | `pd.read_excel("path")` | pandas |
| `pd.read_parquet()` | `pd.read_parquet("path")` | pandas |
| `pd.read_stata()` | `pd.read_stata("path")` | pandas |
| `open()` | `open("path")` | built-in |
| `np.loadtxt()` | `np.loadtxt("path")` | numpy |
| `np.load()` | `np.load("path")` | numpy |

### Write functions
| Function | Pattern | Notes |
|----------|---------|-------|
| `.to_csv()` | `df.to_csv("path")` | pandas |
| `.to_excel()` | `df.to_excel("path")` | pandas |
| `.to_parquet()` | `df.to_parquet("path")` | pandas |
| `plt.savefig()` | `plt.savefig("path")` | matplotlib |
| `.savefig()` | `fig.savefig("path")` | matplotlib |
| `np.savetxt()` | `np.savetxt("path", arr)` | numpy |

### Path construction
- `os.path.join(dir, file)` — standard
- `f"{VAR}/file.csv"` — f-string interpolation
- `Path(dir) / "file.csv"` — pathlib

## Julia

### Read functions
| Function | Pattern | Notes |
|----------|---------|-------|
| `CSV.read()` | `CSV.read("path", DataFrame)` | CSV.jl |
| `CSV.File()` | `DataFrame(CSV.File("path"))` | CSV.jl |
| `readdlm()` | `readdlm("path")` | DelimitedFiles |
| `open()` | `open("path")` | built-in |
| `load()` | `load("path")` | JLD2/FileIO |
| `Arrow.Table()` | `Arrow.Table("path")` | Arrow.jl |

### Write functions
| Function | Pattern | Notes |
|----------|---------|-------|
| `CSV.write()` | `CSV.write("path", df)` | CSV.jl |
| `writedlm()` | `writedlm("path", data)` | DelimitedFiles |
| `savefig()` | `savefig("path")` | Plots.jl |
| `save()` | `save("path", obj)` | JLD2/FileIO |
| `Arrow.write()` | `Arrow.write("path", tbl)` | Arrow.jl |
| `serialize()` | `serialize("path", obj)` | Serialization |

### Path construction
- `joinpath(dir, file)` — standard
- `@__DIR__` — directory of current file (common in HPC settings)
- String interpolation: `"$(VAR)/file.csv"`

## Stata

### Read functions
| Function | Pattern | Notes |
|----------|---------|-------|
| `use` | `use "path"` | load .dta |
| `import delimited` | `import delimited "path"` | CSV |
| `import excel` | `import excel "path"` | Excel |
| `insheet` | `insheet using "path"` | legacy CSV |
| `merge using` | `merge m:1 var using "path"` | merge datasets |

### Write functions
| Function | Pattern | Notes |
|----------|---------|-------|
| `save` | `save "path"` | save .dta |
| `export delimited` | `export delimited "path"` | CSV |
| `export excel` | `export excel "path"` | Excel |
| `outsheet` | `outsheet using "path"` | legacy CSV |
| `graph export` | `graph export "path"` | figures |
| `esttab` | `esttab using "path"` | regression tables |

## Makefile Variable Patterns

Common variable definitions in economics project Makefiles:
```makefile
RAW     = data/raw_data
INT     = data/intermediate_data
OUT     = output
GRAPHS  = output/graphs
TABLES  = output/tables
```

Target syntax: `$(INT)/file.csv: $(RAW)/input.csv code/build.ipynb`
