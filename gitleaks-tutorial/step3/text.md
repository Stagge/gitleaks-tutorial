# Step 3: Custom Rules and Allowlists

Sometimes Gitleaks flags "secrets" that aren't actually sensitive.  
For example, our repo now contains a `MOCK_API_KEY` that we don’t care about. 


Let's explore how we can configure Gitleaks to avoid this problem!

## 1: Run Gitleaks and see the problem

```
gitleaks detect --source ~/demo-repo -v
```{{exec}}
You should see a finding for MOCK_API_KEY.

## 2: Add a custom config
We can configure Gitleaks with a `.gitleaks.toml` file to ignore this mocked key. 


Create a file ~/demo-repo/.gitleaks.toml with this content:
```toml
[[rules]]
description = "Ignore mock API key"
id = "mock-api-key"
regex = '''MOCK_API_KEY'''
[allowlist]
description = "Allow mock api key"
regexes = ['''MOCK_API_KEY\s*=\s*"?12345"?''']
```

## 3: Run Gitleaks with the config
```
cd ~/demo-repo
gitleaks detect --source . --config-path .gitleaks.toml -v
```{{exec}}
This time, the MOCK_API_KEY should not be reported.


Gitleaks allows you to configure in many other ways beyond simple regex allowlists. You can silence false positives inline with comments like # gitleaks:allow, exclude entire files or commits through the configuration file, or even adjust entropy thresholds to reduce noise from random-looking strings such as UUIDs or hashes. Built-in rules can also be disabled or customized, giving you fine-grained control over what gets flagged. This flexibility makes it easy to adapt Gitleaks to your project’s needs, whether you’re dealing with test data, placeholder values, or legacy files.