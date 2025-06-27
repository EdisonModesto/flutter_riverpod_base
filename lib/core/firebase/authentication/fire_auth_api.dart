import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/utils/logger.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fire_auth_api.g.dart';

@riverpod
FireAuthApi authApi(Ref ref) => FireAuthApi();

class FireAuthApi {
  Future<Either<String, UserCredential>> signUpEmail(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserCredential>> signInEmail(String email, String password) async {
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
