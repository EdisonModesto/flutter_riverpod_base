import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/utils/logger.dart';
import 'package:fpdart/fpdart.dart';

final authApiProvider = StateProvider((ref) {
  return FireAuthApi();
});

class FireAuthApi {
  Future<Either<String, UserCredential>> signUpEmail(email, password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserCredential>> signInEmail(email, password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    } catch (e) {
      return Left(e.toString());
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
