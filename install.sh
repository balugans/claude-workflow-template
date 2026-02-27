#!/usr/bin/env bash
set -e

# Ask for template choice
read -p "Which template? (se/ml): " TEMPLATE

if [[ "$TEMPLATE" != "se" && "$TEMPLATE" != "ml" ]]; then
  echo "Invalid choice. Must be 'se' or 'ml'."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="$(pwd)"

# Create .claude/commands/ and .claude/agents/ if they don't exist
mkdir -p "$DEST_DIR/.claude/commands"
mkdir -p "$DEST_DIR/.claude/agents"

# Copy shared commands and agents
cp "$SCRIPT_DIR/shared/commands/"* "$DEST_DIR/.claude/commands/"
cp "$SCRIPT_DIR/shared/agents/"* "$DEST_DIR/.claude/agents/"

# Copy profile-specific commands and agents (if any files exist)
if compgen -G "$SCRIPT_DIR/$TEMPLATE/commands/*" > /dev/null 2>&1; then
  cp "$SCRIPT_DIR/$TEMPLATE/commands/"* "$DEST_DIR/.claude/commands/"
fi

if compgen -G "$SCRIPT_DIR/$TEMPLATE/agents/*" > /dev/null 2>&1; then
  cp "$SCRIPT_DIR/$TEMPLATE/agents/"* "$DEST_DIR/.claude/agents/"
fi

# Copy base files
cp "$SCRIPT_DIR/CLAUDE.md" "$DEST_DIR/CLAUDE.md"
cp "$SCRIPT_DIR/WORKFLOW.md" "$DEST_DIR/WORKFLOW.md"
cp "$SCRIPT_DIR/.claudeignore" "$DEST_DIR/.claudeignore"

echo "Done. Edit CLAUDE.md with your stack and run: claude"
