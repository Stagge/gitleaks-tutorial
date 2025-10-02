#!/bin/bash
# Make sample repo

apt install python3.12-venv -y

# update go version
wget -q https://golang.org/dl/go1.23.2.linux-386.tar.gz
tar -C /usr/local -xzf go1.23.2.linux-386.tar.gz
ln -s /usr/local/go/bin/go /usr/bin/go
rm go1.23.2.linux-386.tar.gz

cd ~/demo-repo

# Copy file and commit
wget https://raw.githubusercontent.com/Stagge/gitleaks-tutorial/refs/heads/main/gitleaks-tutorial/assets/demo-repo/test.py
git add test.py
git commit -m "Add test file" 
