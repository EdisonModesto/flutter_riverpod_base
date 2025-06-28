import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/core/firebase/authentication/fire_auth_api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fpdart/fpdart.dart';

import '../../../utils/logger.dart';

final authRepoProvider = StateProvider((ref) {
  final fireAuthApi = ref.watch(authApiProvider);
  return AuthRepo(fireAuthApi: fireAuthApi);
});

class AuthRepo {
  FireAuthApi fireAuthApi;

  AuthRepo({required this.fireAuthApi});

  Future<Either<String, UserCredential>> signUpEmail(
    String email,
    String password,
  ) async {
    Log().info('Registering user with email: $email');
    final result = await fireAuthApi.signUpEmail(email, password);
    return result.fold(
      (error) {
        Log().error(error);
        return Left(error);
      },
      (credential) {
        Log().info('Sign up success');
        return Right(credential);
      },
    );
  }

  Future<Either<String, UserCredential>> signInEmail(
    String email,
    String password,
  ) async {
    Log().info('Signing in user with email: $email');
    final result = await fireAuthApi.signInEmail(email, password);
    return result.fold(
      (error) {
        Log().error(error);
        return Left(error);
      },
      (credential) {
        Log().info('Sign in success');
        return Right(credential);
      },
    );
  }

  Future<void> signOut() async {
    try {
      await fireAuthApi.signOut();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
