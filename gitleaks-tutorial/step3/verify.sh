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