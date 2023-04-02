import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameOverNotifier extends StateNotifier<bool> {
  GameOverNotifier() : super(false);

  bool get isOver => state;

  set isOver(bool value) => state = value;
}

final gameOverProvider = StateNotifierProvider<GameOverNotifier, bool>((ref) {
  return GameOverNotifier();
});
