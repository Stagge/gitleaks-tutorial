#!/bin/bash

# Verify that Gitleaks configuration is working
cd ~/demo-repo

# Check if .gitleaks.toml exists
if [ ! -f .gitleaks.toml ]; then
    echo "❌ .gitleaks.toml not found"
    exit 1
fi

# Check if test.py exists
if [ ! -f test.py ]; then
    echo "❌ test.py not found"
    exit 1
fi

# Check if the config contains allowlist for test.py
if ! grep -q "test.py" .gitleaks.toml; then
    echo "❌ .gitleaks.toml doesn't allowlist test.py"
    exit 1
fi

# Check if the config contains MOCK_API_KEY regex
if ! grep -q "MOCK_API_KEY" .gitleaks.toml; then
    echo "❌ .gitleaks.toml doesn't allowlist MOCK_API_KEY"
    exit 1
fi

# Test that gitleaks with config doesn't flag test.py
if ! gitleaks detect --source . --config .gitleaks.toml >/dev/null 2>&1; then
    echo "❌ Gitleaks with config still flags test.py"
    exit 1
fi

echo "✅ Gitleaks configuration is working correctly!"
