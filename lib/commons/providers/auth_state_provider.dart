import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier() {
    FirebaseAuth.instance.userChanges().listen((_) {
      print('notifying logout');
    });

    FirebaseAuth.instance.idTokenChanges().listen((_) {
      notifyListeners();
    });
  }

  void update() {
    notifyListeners();
  }
}
