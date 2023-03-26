import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/models/level.dart';

class LevelNotifier extends StateNotifier<Level> {
  LevelNotifier()
      : super(
          Level(
            columns: 20,
            rows: 20,
          ),
        );
}

final levelProvider =
    StateNotifierProvider<LevelNotifier, Level>((ref) => LevelNotifier());
