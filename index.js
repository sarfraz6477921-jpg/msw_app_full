const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.hello = functions.https.onRequest((req, res) => {
  res.send('MSW Video App Functions OK');
});

exports.onComment = functions.firestore.document('comments/{id}').onCreate(async (snap, ctx) => {
  const data = snap.data();
  // placeholder: send notification to video owner
  console.log('New comment for video', data.videoId);
});
