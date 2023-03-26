import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'level_provider.dart';

class FoodNotifier extends StateNotifier<int> {
  final LevelNotifier levelNotifier;

  FoodNotifier(this.levelNotifier)
      : super(
          Random().nextInt(levelNotifier.state.area),
        );

  set food(int value) => state = value;

  int get food => state;

  void generateFood() {
    state = Random().nextInt(levelNotifier.state.area);
  }
}

final foodProvider = StateNotifierProvider<FoodNotifier, int>((ref) {
  return FoodNotifier(ref.watch(levelProvider.notifier));
});
