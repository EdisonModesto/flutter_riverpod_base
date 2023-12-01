import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/feature/authentication/repository/auth_repository.dart';
import 'package:flutter_riverpod_base/feature/authentication/repository/firestore_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';

final authControllerProvider = StateProvider((ref) {
  final authRepo = ref.watch(authRepoProvider);
  final storeRepo = ref.watch(authStoreRepoProvider);

  return AuthController(authRepo: authRepo, storeRepo: storeRepo);
});

class AuthController {
  AuthRepo authRepo;
  StoreAuthRepo storeRepo;

  AuthController({required this.authRepo, required this.storeRepo});

  Future<dynamic> signInEmail(String email, String password) async {
    final result = await authRepo.signInEmail(email, password);
    result.fold(
      (error) {
        EasyLoading.showError(error);
        throw Exception(error);
      },
      (credential) {
        return credential;
      },
    );
  }

  Future<dynamic> signUpEmail(String email, String password) async {
    final result = await authRepo.signUpEmail(email, password);
    result.fold(
      (error) {
        EasyLoading.showError(error);
        throw Exception(error);
      },
      (credential) async {
        storeRepo.firestoreApi.userID = credential.user!.uid;
        final storeResult = await storeRepo.createUser(email, password);
        storeResult.fold(
          (error) {
            Fluttertoast.showToast(msg: error);
            return Exception(error);
          },
          (success) {
            Fluttertoast.showToast(msg: 'Account created in firestore');
            return success;
          },
        );

        return credential;
      },
    );
  }
}
