import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/models/snake.dart';
import 'package:flutter_snake/providers/food_provider.dart';
import 'package:flutter_snake/providers/is_turned_provider.dart';
import 'package:flutter_snake/providers/sound.dart';

import 'level_provider.dart';

class SnakeNotifier extends StateNotifier<Snake> {
  final LevelNotifier levelNotifier;
  final FoodNotifier foodNotifier;
  final IsTurnedNotifier tickerNotifier;
  final SoundNotifier soundNotifier;

  SnakeNotifier(
    this.levelNotifier,
    this.foodNotifier,
    this.tickerNotifier,
    this.soundNotifier,
  ) : super(const Snake(
          body: [],
          direction: Direction.top,
          speed: Speed.slow,
        )) {
    final row = levelNotifier.state.rows;
    final column = levelNotifier.state.columns;
    final first = (row * column + column) ~/ 2;
    final list = [
      first,
      first - column,
      first - 2 * column,
    ];
    state = state.copyWith(body: list);
  }

  void turn(Direction direction) {
    final current = state.direction;
    if (tickerNotifier.state) {
      return;
    }
    print("$direction  $current");
    if (!((direction == Direction.top && current == Direction.bottom) ||
        (direction == Direction.bottom && current == Direction.top) ||
        (direction == Direction.right && current == Direction.left) ||
        (direction == Direction.left && current == Direction.right))) {
      state = state.copyWith(direction: direction);
      print(state.direction);
    }

    tickerNotifier.isTurnedAlready = true;
  }

  set speed(Speed speed) => state = state.copyWith(speed: speed);

  bool move() {
    final direction = state.direction;
    final body = state.body;

    final row = levelNotifier.state.rows;
    final column = levelNotifier.state.columns;

    final count = levelNotifier.state.area;

    int next = 0;

    final head = body.last;
    print(state.body);
    switch (direction) {
      case Direction.top:
        next = (head - column < 0) ? head - column + count : head - column;
        break;
      case Direction.left:
        next =
            ((head - 1) % column == column - 1) ? head + column - 1 : head - 1;
        break;
      case Direction.bottom:
        next = (head + column >= count) ? head + column - count : head + column;
        break;
      case Direction.right:
        next = ((head + 1) % column == 0) ? head - column + 1 : head + 1;
        break;
    }

    List<int> list = List.from(body);
    list.add(next);

    final food = foodNotifier.food;
    if (list.last != food) {
      list.removeAt(0);
    } else {
      soundNotifier.setSoundEat();
      foodNotifier.generateFood();
    }

    if (body.toSet().length != body.length) {
      return true;
    }

    state = state.copyWith(body: list);
    return false;
  }
}

final snakeProvider = StateNotifierProvider<SnakeNotifier, Snake>((ref) {
  return SnakeNotifier(
    ref.watch(levelProvider.notifier),
    ref.watch(foodProvider.notifier),
    ref.watch(isTurnedProvider.notifier),
    ref.watch(soundProvider.notifier),
  );
});
