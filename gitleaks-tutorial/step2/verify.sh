#!/bin/bash
# verify.sh for Step 2

#!/bin/bash
cd ~/demo-repo

# Run gitleaks
if gitleaks detect --source . | grep -q "API_KEY"; then
  echo "API_KEY is still present! Make sure you removed it from your last commit."
  exit 1
fi

echo "API_KEY removed successfully!"
exit 0