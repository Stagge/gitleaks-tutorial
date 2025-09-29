#!/bin/bash
cd ~/demo-repo

# Run gitleaks
# if gitleaks detect --source . >/dev/null 2>&1; then
#   echo "No secrets found — good job!"
#   exit 0
# else
#   echo "Gitleaks found secrets! Make sure you removed them from the last commit."
#   exit 1
# fi