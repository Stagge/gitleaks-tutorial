# Step 1: Installing and Running Gitleaks

Gitleaks is distributed as a single binary — no Python, Node, or heavy setup needed.

We’ll install it locally and run it once to verify everything is working.

---

## 1. Download the binary

Click **Run** to download the latest release:

```bash, runnable
wget -q https://github.com/gitleaks/gitleaks/releases/download/v8.28.0/gitleaks_8.28.0_linux_x64.tar.gz
```
## 2. Extract and move to PATH
```bash, runnable
tar -xzf gitleaks_8.18.1_linux_x64.tar.gz
mv gitleaks /usr/local/bin/
```

## 3. Verify the installation
```bash, runnable
gitleaks version
```

Great! You now have Gitleaks installed locally. In the next step, we’ll scan a repo for secrets.