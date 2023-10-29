import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod_base/utils/logger.dart';

class FireAuthApi {
  Future<void> signInEmail(email, password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Log().error(e.toString());
      throw e.code;
    } catch (e) {
      Log().error(e.toString());
    }
  }

  Future<void> signUpEmail(email, password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Log().error('The password provided is too weak.');
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Log().error('The account already exists for that email.');
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      Log().error(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Log().error(e.toString());
      throw e.toString();
    }
  }
}
