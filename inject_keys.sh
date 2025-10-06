#!/bin/bash
echo "Inject Firebase keys into web and mobile placeholders"
read -p "API_KEY: " API_KEY
read -p "PROJECT_ID: " PROJECT_ID
read -p "STORAGE_BUCKET (e.g. PROJECT.appspot.com): " STORAGE_BUCKET
read -p "SENDER_ID: " SENDER_ID
read -p "APP_ID: " APP_ID
AUTH_DOMAIN="$PROJECT_ID.firebaseapp.com"
cat > web_app/.env.local <<EOL
NEXT_PUBLIC_FIREBASE_API_KEY=$API_KEY
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=$AUTH_DOMAIN
NEXT_PUBLIC_FIREBASE_PROJECT_ID=$PROJECT_ID
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=$STORAGE_BUCKET
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=$SENDER_ID
NEXT_PUBLIC_FIREBASE_APP_ID=$APP_ID
EOL
cat > mobile_app/lib/firebase_options.dart <<EOL
// AUTO-GENERATED FILE
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform,kIsWeb,TargetPlatform;
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android: return android;
      case TargetPlatform.iOS: return ios;
      default: throw UnsupportedError('Unsupported platform');
    }
  }
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: '$API_KEY',
    appId: '$APP_ID',
    messagingSenderId: '$SENDER_ID',
    projectId: '$PROJECT_ID',
    authDomain: '$AUTH_DOMAIN',
    storageBucket: '$STORAGE_BUCKET',
  );
  static const FirebaseOptions android = web;
  static const FirebaseOptions ios = web;
}
EOL
echo "Done."
