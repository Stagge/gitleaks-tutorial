# Step 2: Scanning a Repository

Let's start scanning! Run this command to make Gitleaks scan our repo for any leaks.

`gitleaks detect --source ~/demo-repo -v`{{exec}}

## Fixing our mistakes

Uh oh! We seemed to have forgotten to move our API key to an environment file before our most recent commit.
Lets try to fix this.
Luckily, since we have not yet pushed to a remote repository, this is easily fixed by simply removing it from the code and rewriting the last commit.

### 1: Start an interactive rebase

Run:
```
cd ~/demo-repo
git rebase -i HEAD~1
```{{exec}}

- This opens an editor listing your most recent commit.
- Change pick to edit for the commit containing the secret.
- Save and close the editor.

### 2: Remove the secret

Edit the file containing the API key. For demo purposes you can just leave it blank, but in reality we would probably move it to an environment file.
Edit the file using the *Editor* tab, or use `nano api.py`{{exec}}

### 3: Amend the commit
Run:
```
git add api.py
git commit --amend --no-edit
```{{exec}}
This updates the commit without changing the message.

### 4: Continue the rebase
Run:
```
git rebase --continue
```{{exec}}
The commit history is now fixed.

### 5: Verify the fix
Run:
```
gitleaks detect --source ~/demo-repo -v
```{{exec}}
You should no longer see the API key in the output!🥳


