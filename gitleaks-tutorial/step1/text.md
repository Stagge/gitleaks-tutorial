# Step 1: Installing and Running Gitleaks

Gitleaks is distributed as a single binary — no Python, Node, or heavy setup needed.

We’ll install it locally and run it once to verify everything is working.

---

## 1. Download the binary

Click **Run** to download the latest release:

`wget -q https://github.com/gitleaks/gitleaks/releases/download/v8.28.0/gitleaks_8.28.0_linux_x64.tar.gz`{{exec}}

## 2. Extract and move to PATH

```
tar -xzf gitleaks_8.28.0_linux_x64.tar.gz
mv gitleaks /usr/local/bin/
```{{exec}}

## 3. Verify the installation
`gitleaks version`{{exec}}

Great! You now have Gitleaks installed locally. In the next step, we’ll scan a repo for secrets.
