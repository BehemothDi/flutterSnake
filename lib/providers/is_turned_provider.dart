import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsTurnedNotifier extends StateNotifier<bool> {
  IsTurnedNotifier() : super(false);

  set isTurnedAlready(bool value) => state = value;
}

final isTurnedProvider = StateNotifierProvider<IsTurnedNotifier, bool>((ref) {
  return IsTurnedNotifier();
});
