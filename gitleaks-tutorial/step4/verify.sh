#!/bin/bash

# Verify that the pre-commit hook is working
cd ~/demo-repo

# Check if pre-commit hook exists and is executable
if [ ! -f .git/hooks/pre-commit ] || [ ! -x .git/hooks/pre-commit ]; then
    echo "❌ Pre-commit hook not found or not executable"
    exit 1
fi

# Check if the hook contains gitleaks command
if ! grep -q "gitleaks detect" .git/hooks/pre-commit; then
    echo "❌ Pre-commit hook doesn't contain gitleaks command"
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

echo "✅ Pre-commit hook is working correctly!"
