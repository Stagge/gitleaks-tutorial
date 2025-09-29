#!/bin/bash
cd ~/demo-repo

# Run gitleaks with custom config
if gitleaks detect --source . --config-path .gitleaks.toml >/dev/null 2>&1; then
  echo "Custom config worked — DUMMY_API_KEY ignored successfully!"
  exit 0
else
  echo "Gitleaks still reports secrets. Make sure you added .gitleaks.toml with the allowlist."
  exit 1
fi