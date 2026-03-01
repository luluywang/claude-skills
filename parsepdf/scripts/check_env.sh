#!/bin/bash
# check_env.sh - Verify parsepdf environment dependencies
# Usage: ./check_env.sh
#
# Checks that all required system tools and Python packages are present.
# Prints PASS or FAIL for each dependency and exits 1 if any check fails.

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

PASS_COUNT=0
FAIL_COUNT=0

pass() {
    echo -e "  ${GREEN}PASS${NC}  $1"
    PASS_COUNT=$((PASS_COUNT + 1))
}

fail() {
    echo -e "  ${RED}FAIL${NC}  $1"
    FAIL_COUNT=$((FAIL_COUNT + 1))
}

# ─── System tools ─────────────────────────────────────────────────────────────

echo -e "${BLUE}System tools (poppler-utils)${NC}"

if command -v pdfinfo >/dev/null 2>&1; then
    pass "pdfinfo"
else
    fail "pdfinfo  →  brew install poppler  |  apt-get install poppler-utils"
fi

if command -v pdftotext >/dev/null 2>&1; then
    pass "pdftotext"
else
    fail "pdftotext  →  brew install poppler  |  apt-get install poppler-utils"
fi

if command -v pdfseparate >/dev/null 2>&1; then
    pass "pdfseparate"
else
    fail "pdfseparate  →  brew install poppler  |  apt-get install poppler-utils"
fi

echo ""

# ─── Python runtime ───────────────────────────────────────────────────────────

echo -e "${BLUE}Python runtime${NC}"

if command -v python3 >/dev/null 2>&1; then
    PY_VERSION=$(python3 --version 2>&1)
    pass "python3  ($PY_VERSION)"
else
    fail "python3  →  install Python 3 or activate a conda/mamba environment"
fi

echo ""

# ─── Python packages ──────────────────────────────────────────────────────────

echo -e "${BLUE}Python packages${NC}"

check_py_package() {
    local pkg="$1"
    local install_hint="$2"
    if python3 -c "import $pkg" 2>/dev/null; then
        local version
        version=$(python3 -c "import $pkg; print(getattr($pkg, '__version__', 'unknown'))" 2>/dev/null || echo "unknown")
        pass "$pkg  ($version)"
    else
        fail "$pkg  →  $install_hint"
    fi
}

check_py_package "pdfplumber" "pip install pdfplumber>=0.10.0  |  mamba install -c conda-forge pdfplumber"
check_py_package "fitz"       "pip install pymupdf>=1.23.0    |  mamba install -c conda-forge pymupdf"

echo ""

# ─── Summary ──────────────────────────────────────────────────────────────────

TOTAL=$((PASS_COUNT + FAIL_COUNT))
echo "========================================"
if [ "$FAIL_COUNT" -eq 0 ]; then
    echo -e "${GREEN}All $TOTAL checks passed. Environment is ready.${NC}"
else
    echo -e "${RED}$FAIL_COUNT of $TOTAL checks failed.${NC}"
    echo ""
    echo -e "${YELLOW}Quick fix (conda/mamba environment):${NC}"
    echo "  mamba activate <your-env>"
    echo "  mamba install -c conda-forge pdfplumber pymupdf"
    echo "  brew install poppler   # macOS only; for Linux: apt-get install poppler-utils"
    echo ""
    exit 1
fi
