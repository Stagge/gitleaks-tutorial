# Step 4: Git Hooks - Blocking Commits with Secrets

Now let's set up Gitleaks to automatically prevent secrets from being committed in the first place! We'll create a pre-commit hook that runs Gitleaks before each commit.

## 1: Create the pre-commit hook

First, let's create the hooks directory and our pre-commit script:

```bash
mkdir -p ~/demo-repo/.git/hooks
```{{exec}}

Now create the pre-commit hook:

```bash
cat > ~/demo-repo/.git/hooks/pre-commit << 'EOF'
#!/bin/bash

# Run Gitleaks on staged files
echo "🔍 Running Gitleaks pre-commit scan..."

# Check if gitleaks is available
if ! command -v gitleaks &> /dev/null; then
    echo "❌ Gitleaks not found. Please install Gitleaks first."
    exit 1
fi

# Run gitleaks on staged files
if gitleaks detect --source . --staged --verbose; then
    echo "✅ No secrets detected. Commit allowed."
    exit 0
else
    echo "❌ Secrets detected! Commit blocked."
    echo "Please remove secrets before committing."
    exit 1
fi
EOF
```{{exec}}

## 2: Make the hook executable

```bash
chmod +x ~/demo-repo/.git/hooks/pre-commit
```{{exec}}

## 3: Test the hook with a clean commit

Let's first make sure our repo is clean:

```bash
cd ~/demo-repo
gitleaks detect --source . --staged -v
```{{exec}}

Now let's try to commit our current changes (should work since no secrets):

```bash
git add .
git commit -m "Add Gitleaks configuration"
```{{exec}}

Great! The commit went through because no secrets were detected.

## 4: Test the hook by trying to commit a secret

Now let's test the protection by adding a secret and trying to commit it:

```bash
echo 'API_KEY="sk-1234567890abcdef"' >> app.py
git add app.py
git commit -m "Add secret API key"
```{{exec}}

Perfect! The pre-commit hook blocked the commit because it detected a secret. 

## 5: Clean up and commit properly

Let's remove the secret and commit properly:

```bash
# Remove the secret line
sed -i '/API_KEY="sk-1234567890abcdef"/d' app.py
git add app.py
git commit -m "Update app without secrets"
```{{exec}}

Excellent! Now the commit goes through because we removed the secret.

## How it works

The pre-commit hook runs automatically before every commit and:
- Scans only the staged files (`--staged` flag)
- Blocks the commit if any secrets are found
- Allows the commit if no secrets are detected

This prevents secrets from ever entering your Git history, making it much easier to maintain security in your repositories.

In a real project, you might also want to:
- Add a pre-push hook for extra protection
- Use tools like `pre-commit` framework for more complex hook management
- Set up team-wide hook installation scripts
