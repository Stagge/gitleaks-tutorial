#!/bin/bash

# Set up the demo repository for step 4 (Gitleaks configuration)
cd ~/demo-repo

# Ensure we have a clean state
git reset --hard HEAD
git clean -fd

# Add some content to make commits meaningful
echo "# Demo Application" > README.md
echo "This is a demo application for testing Gitleaks configuration." >> README.md

# Add a file with a mock secret that should be allowed
cat > mock_config.py << 'EOF'
# Mock configuration for testing
MOCK_API_KEY = "sk-mock123456789"
DATABASE_URL = "postgresql://user:password@localhost/db"
EOF

# Add a legitimate config file
cat > config.py << 'EOF'
# Application configuration
DEBUG = True
LOG_LEVEL = "INFO"
EOF

# Stage all files
git add .
git commit -m "Add demo files for Gitleaks configuration testing"

echo "Demo repository ready for Gitleaks configuration testing!"
