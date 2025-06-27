import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/models/user.dart';

import '../../core/firebase/firestore/fire_firestore_api.dart';
import 'fire_auth_provider.dart';

final userDataProvider = StreamProvider<UserModel>((ref) {
  final idStream = ref.watch(userIdProvider);
  final storeApi = ref.watch(firestoreApiProvider);

  final streamController = StreamController<UserModel>();

  if (idStream.value != null) {
    storeApi.getUser().asStream().listen((event) {
      return event.fold((l) {}, (r) {
        r.listen((event) {
          log('new data added');
          streamController.add(UserModel.fromJson(event.data()!));
        });
      });
    });
  }

  return streamController.stream;
});
