#!/bin/bash

# Verify that the pre-commit framework is working
cd ~/demo-repo

# Check if .pre-commit-config.yaml exists
if [ ! -f .pre-commit-config.yaml ]; then
    echo "❌ .pre-commit-config.yaml not found"
    exit 1
fi

# Check if pre-commit is installed
if ! command -v pre-commit &> /dev/null; then
    echo "❌ pre-commit not installed"
    exit 1
fi

# Check if gitleaks is configured in the config
if ! grep -q "gitleaks" .pre-commit-config.yaml; then
    echo "❌ Gitleaks not configured in pre-commit"
    exit 1
fi

# Test that the hook blocks commits with secrets
echo 'TEST_SECRET="sk-test123456789"' >> test_secret.py
git add test_secret.py

# This should fail (exit code 1)
if git commit -m "Test commit with secret" 2>/dev/null; then
    echo "❌ Pre-commit hook failed to block secret commit"
    git reset --soft HEAD~1  # undo the commit
    exit 1
fi

# Clean up
git reset HEAD test_secret.py
rm test_secret.py

echo "✅ Pre-commit framework with Gitleaks is working correctly!"