#!/bin/bash
# verify.sh for Step 1

# Check if gitleaks is in PATH
if ! command -v gitleaks >/dev/null 2>&1; then
  echo "Gitleaks not installed or not in PATH."
  exit 1
fi

# Check if version command works
if ! gitleaks version >/dev/null 2>&1; then
  echo "Gitleaks is installed but not working correctly."
  exit 1
fi

echo "Gitleaks is installed and working!"
exit 0