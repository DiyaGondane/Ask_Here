import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/topic.dart';
import '../provider/topic_notifier.dart';



class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn;

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future login() async {
    isSigningIn = true;

    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    }
    else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      isSigningIn = false;
      notifyListeners();
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }


// getTopics(TopicNotifier topicNotifier) async {
//   QuerySnapshot snapshot = await Firestore.instance
//       .collection('Topics')
//       .orderBy("createdAt", descending: true)
//       .getDocuments();
//
//   List<Topic> _topicList = [];
//
//   snapshot.documents.forEach((document) {
//     Topic topic = Topic.fromMap(document.data);
//     _topicList.add(topic);
//   });
//
//   topicNotifier.topicList = _topicList;
//
}
