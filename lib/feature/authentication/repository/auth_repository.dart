import 'package:flutter_riverpod_base/core/firebase/fire_auth_api.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../utils/logger.dart';

class AuthRepo {
  FireAuthApi fireAuthApi = FireAuthApi();

  Future<void> signInEmail(email, password) async {
    try {
      Log().info('Signing in user with email: $email');
      await fireAuthApi.signInEmail(email, password);
    } catch (e) {
      Log().info('error');

      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> signUpEmail(email, password) async {
    try {
      await fireAuthApi.signUpEmail(email, password);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await fireAuthApi.signOut();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
