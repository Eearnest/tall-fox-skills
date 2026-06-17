#!/bin/bash

# IronClaw Skills Installer
# Installs all 38 skills into ~/.ironclaw/skills/
# Usage: bash install-skills.sh
# Run from the folder where your skill .md files are located

set -e

SKILLS_DIR="$HOME/.ironclaw/skills"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo "================================================"
echo "   IronClaw Skills Installer — 38 Skills"
echo "================================================"
echo ""

# Check that skill files exist in the same directory as this script
if [ ! -f "$SCRIPT_DIR/web-search.md" ]; then
  echo -e "${RED}ERROR: Skill .md files not found in the same folder as this script.${NC}"
  echo "Make sure all your downloaded .md files are in the same folder as install-skills.sh"
  echo "Expected location: $SCRIPT_DIR"
  exit 1
fi

# Create base skills directory if it doesn't exist
mkdir -p "$SKILLS_DIR"
echo -e "${GREEN}✓ Skills directory ready: $SKILLS_DIR${NC}"
echo ""

# Define all 38 skills
SKILLS=(
  # Research & Data
  "web-search"
  "crypto-tracker"
  "news-fetcher"

  # Communication
  "email-writer"
  "summarizer"
  "translator"

  # Dev & Tech
  "code-reviewer"
  "bug-finder"
  "api-caller"

  # Reasoning
  "decision-maker"
  "planner"
  "fact-checker"

  # Finance
  "portfolio-analyzer"
  "defi-navigator"
  "on-chain-reader"

  # Memecoin Trading
  "memecoin-scanner"
  "rug-detector"
  "memecoin-entry"
  "memecoin-exit"

  # Polymarket
  "market-researcher"
  "odds-analyzer"
  "event-tracker"
  "position-manager"

  # Perps Trading
  "perps-setup"
  "funding-rate-watcher"
  "liquidation-hunter"
  "perps-risk-manager"

  # Market Analysis
  "chart-reader"
  "indicator-analyst"
  "trend-detector"

  # Sentiment & News
  "market-sentiment"
  "alpha-hunter"
  "news-trader"

  # Strategy
  "trade-planner"
  "risk-manager"
  "dca-strategist"

  # Execution
  "order-builder"
  "defi-trader"
  "arbitrage-spotter"
)

INSTALLED=0
SKIPPED=0
FAILED=0

for SKILL in "${SKILLS[@]}"; do
  SRC="$SCRIPT_DIR/${SKILL}.md"
  DEST_DIR="$SKILLS_DIR/$SKILL"
  DEST="$DEST_DIR/SKILL.md"

  # Check source file exists
  if [ ! -f "$SRC" ]; then
    echo -e "${YELLOW}⚠ SKIPPED: ${SKILL}.md not found${NC}"
    ((SKIPPED++))
    continue
  fi

  # Create skill subdirectory
  mkdir -p "$DEST_DIR"

  # Copy skill file
  if cp "$SRC" "$DEST"; then
    echo -e "${GREEN}✓ Installed: $SKILL${NC}"
    ((INSTALLED++))
  else
    echo -e "${RED}✗ FAILED: $SKILL${NC}"
    ((FAILED++))
  fi
done

echo ""
echo "================================================"
echo "   Install Complete"
echo "================================================"
echo -e "${GREEN}✓ Installed: $INSTALLED skills${NC}"
[ $SKIPPED -gt 0 ] && echo -e "${YELLOW}⚠ Skipped:   $SKIPPED skills (file not found)${NC}"
[ $FAILED -gt 0 ]  && echo -e "${RED}✗ Failed:    $FAILED skills${NC}"
echo ""
echo "Next steps:"
echo "  1. Verify:  ironclaw skills list"
echo "  2. Restart: ironclaw restart  (or restart your agent)"
echo ""
echo "Skills installed to: $SKILLS_DIR"
echo "================================================"
