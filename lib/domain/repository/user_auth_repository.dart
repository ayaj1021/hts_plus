// ignore_for_file: avoid_positional_boolean_parameters

import 'dart:convert';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/data/local_data_source/local_storage.dart';
import 'package:hts_plus/data/local_data_source/local_storage_impl.dart';
import 'package:hts_plus/data/local_data_source/storage_keys.dart';
import 'package:hts_plus/domain/model/auth_response.dart';

class UserAuthRepository {
  UserAuthRepository(
    this._localStorage,
  );
  final LocalStorage _localStorage;

  Future<void> saveToken(Tokens token) async {
    final n =
        await _localStorage.put(HiveKeys.token, json.encode(token.toJson()));
    return n;
  }

  Tokens getToken() {
    final tokens = _localStorage.get(HiveKeys.token);
    return Tokens.fromJson(
      tokens == null
          ? {}
          : json.decode(tokens as String) as Map<String, dynamic>,
    );
  }

  // Future<void> saveCurrentState(CurrentState val) async {
  //   await _localStorage.put(HiveKeys.currentState, val.name);
  // }

  // CurrentState getCurrentState() {
  //   final state = _localStorage.get(HiveKeys.currentState) as String?;
  //   return CurrentState.values.firstWhere(
  //     (element) => element.name == state,
  //     orElse: () => CurrentState.none,
  //   );
  // }

  bool get hasEnabledBiometrics {
    return _localStorage.get(HiveKeys.hasEnabledBiometrics) as bool? ?? false;
  }

  Future<void> saveHasEnabledBiometrics(bool val) async {
    await _localStorage.put(HiveKeys.hasEnabledBiometrics, val);
  }

  String get userPin {
    return _localStorage.get(HiveKeys.userPin) as String? ?? '';
  }

  Future<void> saveUserPin(String val) async {
    await _localStorage.put(HiveKeys.userPin, val);
  }

  String get userPassword {
    return _localStorage.get(HiveKeys.userPassword) as String? ?? '';
  }

  Future<void> saveUserPassword(String val) async {
    await _localStorage.put(HiveKeys.userPassword, val);
  }

  Future<void> logout() async {
    await _localStorage.clear();
    // await saveCurrentState(CurrentState.onboarded);
  }
}

final userAuthRepositoryProvider = Provider<UserAuthRepository>(
  (ref) => UserAuthRepository(
    ref.read(localStorageProvider),
  ),
);
