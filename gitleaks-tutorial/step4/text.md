# Step 4: Gitleaks Configuration

Sometimes Gitleaks flags "secrets" that aren't actually sensitive, like mock data in test files. Let's learn how to configure Gitleaks to ignore these false positives!

## 1: Add a test file with mock data

First, let's add a test file that contains a mock API key:

````bash
wget https://raw.githubusercontent.com/Stagge/gitleaks-tutorial/refs/heads/main/gitleaks-tutorial/assets/demo-repo/test.py
git add test.py
git commit -m "Add test file"
```{{exec}}

## 2: Run Gitleaks and see the problem

```bash
gitleaks detect --source . -v
```{{exec}}

You should see that Gitleaks flags the `MOCK_API_KEY` as a potential secret, even though it's just test data.

## 3: Create a Gitleaks configuration file

Let's create a `.gitleaks.toml` file to configure Gitleaks:

```bash
cat > ~/demo-repo/.gitleaks.toml << 'EOF'
[allowlist]
description = "Allow mock API keys in test files"
paths = [
    "test.py"
]
regexes = [
    "MOCK_API_KEY"
]
EOF
```{{exec}}

## 4: Test the configuration

Now let's run Gitleaks with our custom configuration:

```bash
gitleaks detect --source . --config .gitleaks.toml -v
```{{exec}}

Perfect! The `MOCK_API_KEY` should no longer be flagged as a secret.

## 5: Update pre-commit to use the config

Let's update our pre-commit configuration to use the custom Gitleaks config:

```bash
cat > ~/demo-repo/.pre-commit-config.yaml << 'EOF'
repos:
  - repo: local
    hooks:
      - id: gitleaks
        name: gitleaks
        entry: gitleaks detect --source . --config .gitleaks.toml
        language: system
EOF
```{{exec}}

## 6: Reinstall the hooks

```bash
source ~/venv/bin/activate
pre-commit install
```{{exec}}

## 7: Test the updated pre-commit hook

Let's test that our pre-commit hook now uses the configuration:

```bash
git add .
git commit -m "Add Gitleaks configuration"
```{{exec}}

Great! The commit should go through because the mock API key is now allowed.

## 8: Test with a real secret

Let's verify that real secrets are still blocked:

```bash
echo 'REAL_SECRET="sk-1234567890abcdef"' >> app.py
git add app.py
git commit -m "Add real secret"
```{{exec}}

Perfect! The pre-commit hook should still block real secrets.

## 9: Clean up

```bash
sed -i '/REAL_SECRET/d' app.py
git add app.py
git commit -m "Remove real secret"
```{{exec}}

## Configuration options

Gitleaks offers many configuration options:

- **Paths**: Exclude entire files or directories
- **Regexes**: Allow specific patterns
- **Commits**: Exclude specific commits
- **Rules**: Customize or disable built-in rules
- **Entropy**: Adjust sensitivity for random-looking strings

This flexibility makes it easy to adapt Gitleaks to your project's needs! 🎉
````
