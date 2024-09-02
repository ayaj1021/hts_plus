import 'dart:async';
import 'dart:developer';


import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hts_plus/data/local_data_source/storage_keys.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Add cross-flavor configuration here
  await Hive.initFlutter();
  await Hive.openBox(HiveKeys.appBox);

  runApp(await builder());
}
