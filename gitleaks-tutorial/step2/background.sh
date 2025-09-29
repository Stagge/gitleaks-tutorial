#!/bin/bash
# Make sample repo
mkdir -p ~/demo-repo && cd ~/demo-repo
git init -q

# Copy first file and commit
wget https://raw.githubusercontent.com/Stagge/gitleaks-tutorial/refs/heads/main/gitleaks-tutorial/assets/demo-repo/app.py
git add app.py
git commit -m "Initial commit" >/dev/null 2>&1

# Copy second file and commit
wget https://raw.githubusercontent.com/Stagge/gitleaks-tutorial/refs/heads/main/gitleaks-tutorial/assets/demo-repo/api.py
git add api.py
git commit -m "Add API file" >/dev/null 2>&1
