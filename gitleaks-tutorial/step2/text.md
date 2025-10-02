# Step 2: Scanning a Repository

Let's start scanning! Run this command to make Gitleaks scan our repo for any leaks.

`gitleaks detect --source ~/demo-repo -v`{{exec}}

## Fixing our mistakes

Uh oh! We seemed to have forgotten to move our API key to an environment file before our most recent commit.
Let's fix this by removing the secret and updating the commit.

### 1: Remove the secret

Edit the file containing the API key. For demo purposes you can just leave it blank, but in reality we would probably move it to an environment file.
Edit the file using the _Editor_ tab, or use `nano api.py`{{exec}}

### 2: Update the commit

Run:

````
cd ~/demo-repo
git add api.py
git commit --amend --no-edit
```{{exec}}
This updates the commit without changing the message.

### 3: Verify the fix
Run:
````

gitleaks detect --source ~/demo-repo -v

```{{exec}}
You should no longer see the API key in the output!🥳


```
