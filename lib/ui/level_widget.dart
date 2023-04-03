import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/ui/pause_screen.dart';

import '../models/snake.dart';
import '../providers/ground_provider.dart';
import '../providers/is_active.dart';
import '../providers/level_provider.dart';
import '../providers/music_provider.dart';
import '../providers/snake_provider.dart';
import '../providers/timer_povider.dart';

class LevelWidget extends ConsumerStatefulWidget {
  const LevelWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LevelWidget> createState() => _LevelWidgetState();
}

class _LevelWidgetState extends ConsumerState<LevelWidget> {
  Duration duration = const Duration(milliseconds: 100);

  void openHelp() {
    ref.read(isActiveProvider.notifier).isActive = false;
  }

  @override
  void initState() {
    super.initState();
    ref.read(soundProviderBack.notifier).playMusic();
    ref.read(timerProvider);
  }

  @override
  Widget build(BuildContext context) {
    final level = ref.watch(levelProvider);
    final grid = ref.watch(gridProvider);

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 400,
                minHeight: 700,
                maxHeight: 700,
                maxWidth: 400,
              ),
              child: GridView.count(
                crossAxisCount: level.columns,
                children: grid,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ControllerWidget(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: openHelp,
              icon: const Icon(
                Icons.pause,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ControllerWidget extends ConsumerWidget {
  const ControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snakeNotifier = ref.watch(snakeProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            snakeNotifier.turn(Direction.top);
          },
          child: const Text('top'),
        ),
        ElevatedButton(
          onPressed: () {
            snakeNotifier.turn(Direction.bottom);
          },
          child: const Text('bottom'),
        ),
        ElevatedButton(
          onPressed: () {
            snakeNotifier.turn(Direction.left);
          },
          child: const Text('left'),
        ),
        ElevatedButton(
          onPressed: () {
            snakeNotifier.turn(Direction.right);
          },
          child: const Text('right'),
        ),
      ],
    );
  }
}
