
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/utils/enums.dart';

final logoutProvider = StateProvider<ActivityStatus>(
  (ref) {
    return ActivityStatus.inApp;
  },
);
