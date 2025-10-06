#!/bin/bash
read -p "GitHub username: " USERNAME
read -p "Repository name: " REPO
git init
git add .
git commit -m "Initial commit - MSW Video App Full"
git branch -M main
git remote add origin https://github.com/$USERNAME/$REPO.git
git push -u origin main
echo "Pushed to GitHub. Add FIREBASE_TOKEN secret for CI deploy."
