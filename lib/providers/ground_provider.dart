import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/models/block.dart';
import 'package:flutter_snake/models/ground.dart';
import 'package:flutter_snake/providers/food_provider.dart';
import 'package:flutter_snake/providers/is_game_over.dart';
import 'package:flutter_snake/providers/level_provider.dart';
import 'package:flutter_snake/providers/snake_provider.dart';

class GroundNotifier extends StateNotifier<Ground> {
  final LevelNotifier levelNotifier;
  final SnakeNotifier snakeNotifier;
  final FoodNotifier foodNotifier;
  final GameOverNotifier gameOverNotifier;

  GroundNotifier(
    this.levelNotifier,
    this.snakeNotifier,
    this.foodNotifier,
    this.gameOverNotifier,
  ) : super(
          Ground(
            grid: List.generate(
              levelNotifier.state.columns * levelNotifier.state.rows,
              (index) => const Block(
                type: BlockType.blank,
              ),
            ),
          ),
        );

  void update() {
    final isLose = snakeNotifier.move();

    if (isLose) {
      gameOverNotifier.isOver = true;
    }

    final snakeBody = snakeNotifier.state.body;
    for (int element in snakeBody) {
      setBlock(element, BlockType.snake);
    }

    final columns = levelNotifier.state.columns;
    final rows = levelNotifier.state.rows;
    for (int i = 0; i < columns * rows; i++) {
      if (snakeBody.contains(i)) {
        setBlock(i, BlockType.snake);
      } else if (i == foodNotifier.food) {
        setBlock(i, BlockType.food);
      } else {
        setBlock(i, BlockType.blank);
      }
    }
  }

  void setBlock(
    int index,
    BlockType type,
  ) {
    List<Block> tempList = List.from(grid);
    tempList.removeAt(index);
    tempList.insert(index, Block(type: type));

    state = state.copyWith(grid: tempList);
  }

  List<Block> get grid => state.grid;

  set grid(List<Block> value) => state.copyWith(grid: value);
}

final groundProvider = StateNotifierProvider<GroundNotifier, Ground>((ref) {
  return GroundNotifier(
    ref.watch(levelProvider.notifier),
    ref.watch(snakeProvider.notifier),
    ref.watch(foodProvider.notifier),
    ref.watch(gameOverProvider.notifier),
  );
});

final gridProvider = StateProvider<List<Widget>>((ref) {
  Color colorFromType(BlockType type) {
    switch (type) {
      case BlockType.blank:
        return Colors.white38;
      case BlockType.snake:
        return Colors.white;
      case BlockType.food:
        return Colors.green;
      case BlockType.wall:
        return Colors.orange;
    }
  }

  Widget toWidget(Block block) => Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          decoration: BoxDecoration(
            color: colorFromType(block.type),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      );

  return ref.watch(groundProvider).grid.map((e) => toWidget(e)).toList();
});
