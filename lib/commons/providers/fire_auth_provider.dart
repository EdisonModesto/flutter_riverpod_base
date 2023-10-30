import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/utils/logger.dart';

final userIdProvider = StreamProvider<String?>((ref) {
  FirebaseAuth auth = FirebaseAuth.instance;
  final idStream = auth.authStateChanges().map((User? user) => user?.uid);

  idStream.listen((event) {
    if (event == null) {
      Log().info('Event is null');
    } else {
      Log().info('Event is not null');
    }
  });

  return idStream;
});
