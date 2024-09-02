import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/data/local_data_source/local_storage.dart';
import 'package:hts_plus/data/local_data_source/local_storage_impl.dart';
import 'package:hts_plus/data/local_data_source/storage_keys.dart';
import 'package:hts_plus/presentation/features/signup/data/model/sign_up_response.dart';

class UserRepository {
  UserRepository(this._storage, this.onUpdateuser);
  final LocalStorage _storage;
  final void Function(HTSUser user) onUpdateuser;

  HTSUser getUser() {
    final response = _storage.get<String?>(HiveKeys.user);
    final user = HTSUser.fromJson(
      response == null
          ? {}
          : json.decode(response as String) as Map<String, dynamic>,
    );
    return user;
  }

  Future<void> updateUser(HTSUser user) async {
    await saveCurrentUser(user);
    onUpdateuser(user);
  }

  Future<void> saveCurrentUser(HTSUser val) async {
    final js = val.toJson();
    await _storage.put(HiveKeys.user, json.encode(js));
  }
}

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepository(
    ref.read(localStorageProvider),
    (p0) {
      ref.read(currentUserProvider.notifier).state = p0;
    },
  ),
);

final currentUserProvider = StateProvider<HTSUser>((ref) {
  final response = ref.read(localStorageProvider).get<String?>(HiveKeys.user);
  final user = HTSUser.fromJson(
    response == null
        ? {}
        : json.decode(response as String) as Map<String, dynamic>,
  );
  return user;
});
