#!/bin/bash
# Make sample repo

apt install python3.12-venv -y

cd ~/demo-repo

# Copy file and commit
wget https://raw.githubusercontent.com/Stagge/gitleaks-tutorial/refs/heads/main/gitleaks-tutorial/assets/demo-repo/test.py
git add test.py
git commit -m "Add test file" 
