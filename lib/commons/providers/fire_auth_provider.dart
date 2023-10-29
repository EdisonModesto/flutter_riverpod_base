import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userIdProvider = StreamProvider<String?>((ref) {
  FirebaseAuth auth = FirebaseAuth.instance;
  return auth.authStateChanges().map((User? user) => user?.uid);
});
