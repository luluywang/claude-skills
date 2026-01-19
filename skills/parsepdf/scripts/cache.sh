#!/bin/bash
# cache.sh - Cache management utility
# Usage: ./cache.sh status|clear [paper_name]

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# SKILL_DIR is the parsepdf skill root (parent of scripts/)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILL_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"
CACHE_DIR="$SKILL_DIR/cache"

show_help() {
    echo "Usage: $0 <command> [paper_name]"
    echo ""
    echo "Commands:"
    echo "  status              Show all cached papers with sizes"
    echo "  status <paper>      Show cache details for specific paper"
    echo "  clear               Clear all cache"
    echo "  clear <paper>       Clear cache for specific paper"
    echo ""
    echo "Examples:"
    echo "  ./cache.sh status"
    echo "  ./cache.sh clear"
    echo "  ./cache.sh clear \"Buchak et al. - 2018\""
}

cmd_status() {
    local paper="$1"

    if [ ! -d "$CACHE_DIR" ]; then
        echo -e "${YELLOW}No cache directory exists${NC}"
        exit 0
    fi

    if [ -n "$paper" ]; then
        # Status for specific paper
        if [ -d "$CACHE_DIR/$paper" ]; then
            echo -e "${BLUE}Cache for: $paper${NC}"
            echo "----------------------------------------"
            du -sh "$CACHE_DIR/$paper"/* 2>/dev/null || echo "Empty"
            echo "----------------------------------------"
            du -sh "$CACHE_DIR/$paper" | awk '{print "Total: " $1}'
        else
            echo -e "${RED}No cache found for: $paper${NC}"
            exit 1
        fi
    else
        # Status for all papers
        echo -e "${BLUE}Cached papers:${NC}"
        echo "========================================"

        shopt -s nullglob
        papers=("$CACHE_DIR"/*/)
        shopt -u nullglob

        if [ ${#papers[@]} -eq 0 ]; then
            echo -e "${YELLOW}No cached papers${NC}"
            exit 0
        fi

        for dir in "${papers[@]}"; do
            paper_name=$(basename "$dir")
            size=$(du -sh "$dir" 2>/dev/null | awk '{print $1}')
            echo -e "  ${GREEN}$size${NC}  $paper_name"
        done

        echo "========================================"
        total=$(du -sh "$CACHE_DIR" 2>/dev/null | awk '{print $1}')
        echo -e "Total cache: ${GREEN}$total${NC}"
    fi
}

cmd_clear() {
    local paper="$1"

    if [ ! -d "$CACHE_DIR" ]; then
        echo -e "${YELLOW}No cache directory exists${NC}"
        exit 0
    fi

    if [ -n "$paper" ]; then
        # Clear specific paper
        if [ -d "$CACHE_DIR/$paper" ]; then
            size=$(du -sh "$CACHE_DIR/$paper" 2>/dev/null | awk '{print $1}')
            rm -rf "$CACHE_DIR/$paper"
            echo -e "${GREEN}Cleared cache for: $paper ($size)${NC}"
        else
            echo -e "${RED}No cache found for: $paper${NC}"
            exit 1
        fi
    else
        # Clear all cache
        shopt -s nullglob
        papers=("$CACHE_DIR"/*/)
        shopt -u nullglob

        if [ ${#papers[@]} -eq 0 ]; then
            echo -e "${YELLOW}No cached papers to clear${NC}"
            exit 0
        fi

        total=$(du -sh "$CACHE_DIR" 2>/dev/null | awk '{print $1}')
        rm -rf "$CACHE_DIR"/*/
        echo -e "${GREEN}Cleared all cache ($total)${NC}"
    fi
}

# Main
case "${1:-}" in
    status)
        cmd_status "$2"
        ;;
    clear)
        cmd_clear "$2"
        ;;
    --help|-h|help)
        show_help
        ;;
    *)
        show_help
        exit 1
        ;;
esac
