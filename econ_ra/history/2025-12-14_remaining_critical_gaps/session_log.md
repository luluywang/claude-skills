# Session Log - Econ RA Tasks

## 2025-12-14 - Task 2: Call Graph Analysis

**Task:** Identify which functions from model_functions.jl are called during model estimation by tracing estimate_model_current_eqm_foc.jl call graph

**Status:** COMPLETE

**Files Created:**
- `econ_ra/current/estimation_function_usage.md` - Complete call graph documentation

**Approach:**
1. Read estimate_model_current_eqm_foc.jl (583 lines) to identify entry point functions
2. Traced main entry points: `model_moment_from_vector`, `recover_moments_from_init`, `fit_to_df`
3. Read model_functions.jl in chunks (6,433 lines total, 261KB file)
4. Used grep to identify all function definitions (92 functions total in model_functions.jl)
5. Traced transitive closure of calls through 8 levels of function dependencies
6. Documented iteration-specific behavior for 6-iteration estimation strategy

**Key Findings:**
- **73+ distinct functions** from model_functions.jl are called during estimation
- Organized into 6 major subsystems with clear separation of concerns
- **Critical path:** 8 levels deep from estimation entry point to low-level utilities
- **Bottleneck functions:** solve_fixed_point (100-1000+ iterations), normal_convolution_threedim_mc (2000 draws)
- **Iteration strategy:** Progressive complexity (no FOC → easy grad FOC → full grad FOC → SOC)

**Function Categories:**
1. **Parameter Management** (3 functions): build_param_from_vector, build_init, build_bounds
2. **Moment Computation** (11 functions): all_model_moments + 10 individual moment functions
3. **Equilibrium Solution** (15 functions): network_allocation, solve_subgame, solve_fixed_point, eqm_price_index
4. **Consumer Behavior** (18 functions): expected_wallet_shares, integrate_function_rc_draws, logit_shares
5. **Network Optimization** (12 functions): network_foc_all_entries, network_profits, normalize_foc
6. **Numerical Methods** (14+ functions): Gauss-Hermite derivatives, Anderson acceleration, integration

**Critical Path Functions (Always Called):**
- 25 essential functions called in every iteration
- 12 FOC functions conditional (iterations 3-6)
- 3 SOC functions conditional (iteration 5 only)

**Next Steps:**
- Task 3 would be to document function signatures and parameters
- Task 4 could analyze struct definitions (Allocation, SubgameResult, UsageParam, etc.)
