import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsActiveNotifier extends StateNotifier<bool> {
  IsActiveNotifier() : super(true);

  void toggle() => state = !state;

  set isActive(bool value) => state = value;

  bool get isActive => state;
}

final isActiveProvider = StateNotifierProvider<IsActiveNotifier, bool>((ref) {
  return IsActiveNotifier();
});
