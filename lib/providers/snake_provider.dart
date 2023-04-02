import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/models/snake.dart';
import 'package:flutter_snake/providers/food_provider.dart';
import 'package:flutter_snake/providers/is_turned_provider.dart';
import 'package:flutter_snake/providers/sound_provider.dart';
import 'package:flutter_snake/providers/turn_provider.dart';

import '../utils/keyboard.dart';
import 'level_provider.dart';

class SnakeNotifier extends StateNotifier<Snake> {
  final LevelNotifier levelNotifier;
  final FoodNotifier foodNotifier;
  final IsTurnedNotifier tickerNotifier;
  final SoundNotifier soundNotifier;
  final TurnNotifier turnNotifier;

  SnakeNotifier({
    required this.levelNotifier,
    required this.foodNotifier,
    required this.tickerNotifier,
    required this.soundNotifier,
    required this.turnNotifier,
  }) : super(const Snake(
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

  void keyTurn(LogicalKeyboardKey key) {
    final direction = KeyboardMapper().fromKey(key);
    if (direction != null) {
      turn(direction);
    }
  }

  void turn(Direction direction) {
    turnNotifier.direction = direction;
  }

  // функция считывает значние направления из TurnNotifier
  // и меняет его у змейки если возможно
  void turnController() {
    final current = state.direction;
    if (tickerNotifier.isTurnedAlready) {
      return;
    }
    final direction = turnNotifier.direction;
    if (!((direction == Direction.top && current == Direction.bottom) ||
        (direction == Direction.bottom && current == Direction.top) ||
        (direction == Direction.right && current == Direction.left) ||
        (direction == Direction.left && current == Direction.right))) {
      state = state.copyWith(direction: direction);
      tickerNotifier.isTurnedAlready = true;
    }
  }

  set speed(Speed speed) => state = state.copyWith(speed: speed);

  bool move() {
    turnController();
    final direction = state.direction;

    final body = state.body;

    final row = levelNotifier.state.rows;
    final column = levelNotifier.state.columns;

    final count = levelNotifier.state.area;

    int next = 0;

    final head = body.last;
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
      soundNotifier.playSoundEat();
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
    levelNotifier: ref.watch(levelProvider.notifier),
    foodNotifier: ref.watch(foodProvider.notifier),
    tickerNotifier: ref.watch(isTurnedProvider.notifier),
    soundNotifier: ref.watch(soundProvider.notifier),
    turnNotifier: ref.watch(turnProvider.notifier),
  );
});
