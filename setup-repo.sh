#!/bin/bash
# Code Sentinel — Push to GitHub
# Run this script from inside the code-sentinel folder:
#   cd /path/to/code-sentinel
#   chmod +x setup-repo.sh
#   ./setup-repo.sh

set -e

echo "🛡️  Code Sentinel — Setting up GitHub repository..."

# Remove this script from the repo (it's a one-time setup tool)
SCRIPT_NAME="setup-repo.sh"

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    git init
    echo "✅ Git initialized"
else
    echo "✅ Git already initialized"
fi

# Add remote if not already set
if ! git remote get-url origin &>/dev/null; then
    git remote add origin git@github.com:tnramalho/code-sentinel.git
    echo "✅ Remote origin added"
else
    echo "✅ Remote origin already set"
fi

# Stage all files except this script
git add .gitignore CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE README.md SKILL.md references/

# Create the initial commit
git commit -m "feat: initial release of Code Sentinel v1.0.0

Production-grade code quality analysis skill for AI agents (Claude Code,
Codex, Cursor, etc.). Analyzes codebases across 13 weighted dimensions
including architecture, security, scalability, resilience, and more.
Generates a structured markdown report with scores, vulnerabilities,
risks, and a prioritized action plan.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"

echo "✅ Initial commit created"

# Set branch to main and push
git branch -M main
git push -u origin main

echo ""
echo "🎉 Done! Code Sentinel is live at:"
echo "   https://github.com/tnramalho/code-sentinel"
echo ""
echo "You can now delete this setup script:"
echo "   rm setup-repo.sh"
