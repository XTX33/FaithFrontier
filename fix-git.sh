#!/bin/bash

cd /workspaces/FaithFrontier || exit 1

echo "Staging changes..."
git add _opra/
git add _config.yml
git add _data/docket/atl-l-003252-25.yml
git add _cases/atl-l-003252-25/index.md
git add scripts/rename-opra-files.js
git add scripts/rename-opra-files.sh

echo ""
echo "Git status:"
git status --short

echo ""
echo "Ready to commit. Run this command:"
echo 'git commit -m "feat: activate OPRA collection and update case docket"'
