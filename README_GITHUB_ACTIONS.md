# MSW Video App - Deployment Guide

1. Run ./inject_keys.sh and paste your Firebase project keys.
2. Create a GitHub repo and push these files (use push_to_github.sh).
3. On your local machine run: npm install -g firebase-tools && firebase login:ci
4. Copy the token from firebase login:ci and save it as GitHub secret FIREBASE_TOKEN.
5. Push to main branch; GitHub Actions will deploy backend and web automatically.
6. For mobile: open mobile_app in Android Studio / VSCode and run flutter pub get; then flutter build appbundle to create .aab
