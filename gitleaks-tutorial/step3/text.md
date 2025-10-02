# Step 3: Pre-commit Hook

Now let's set up a pre-commit hook using the pre-commit framework to automatically prevent secrets from being committed!

## 1: Install pre-commit

First, let's create a virtual environment and install the pre-commit framework:

````bash
python3 -m venv ~/venv
source ~/venv/bin/activate
pip install pre-commit
```{{exec}}

## 2: Create pre-commit configuration

Create a `.pre-commit-config.yaml` file:

```bash
cat > ~/demo-repo/.pre-commit-config.yaml << 'EOF'
repos:
  - repo: https://github.com/gitleaks/gitleaks
    rev: v8.28.0
    hooks:
      - id: gitleaks
        args: ['--staged', '--verbose']
EOF
```{{exec}}

## 3: Install the hooks

```bash
cd ~/demo-repo
source ~/venv/bin/activate
pre-commit install
```{{exec}}

## 4: Test the hook with a clean commit

Let's try to commit our current changes (should work since no secrets):

```bash
source ~/venv/bin/activate
git add .
git commit -m "Add pre-commit configuration"
```{{exec}}

Great! The commit went through because no secrets were detected.

## 5: Test the hook by trying to commit a secret

Now let's test the protection by adding a secret and trying to commit it:

```bash
source ~/venv/bin/activate
echo 'API_KEY="sk-1234567890abcdef"' >> app.py
git add app.py
git commit -m "Add secret API key"
```{{exec}}

Perfect! The pre-commit hook blocked the commit because it detected a secret.

## 6: Clean up and commit properly

Let's remove the secret and commit properly:

```bash
source ~/venv/bin/activate
sed -i '/API_KEY/d' app.py
git add app.py
git commit -m "Update app without secrets"
```{{exec}}


Excellent! Now the commit goes through because we removed the secret.

## How it works

The pre-commit framework:
- Automatically downloads and manages the Gitleaks binary
- Runs Gitleaks on staged files before each commit
- Blocks commits if secrets are detected
- Provides consistent behavior across different machines

This prevents secrets from ever entering your Git history! 🎉

````
