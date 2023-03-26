import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/models/snake.dart';
import 'package:flutter_snake/providers/ground_provider.dart';
import 'package:flutter_snake/providers/level_provider.dart';
import 'package:flutter_snake/providers/snake_provider.dart';
import 'package:flutter_snake/providers/ticker_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Snake',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LevelWidget(),
    );
  }
}

class LevelWidget extends ConsumerStatefulWidget {
  const LevelWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LevelWidget> createState() => _LevelWidgetState();
}

class _LevelWidgetState extends ConsumerState<LevelWidget> {
  Duration duration = const Duration(milliseconds: 100);
  late Timer timer;

  bool isActive = true;

  void update() {
    if (isActive) {
      bool value = ref.read(groundProvider.notifier).update();
      if (value) {
        isActive = false;

        // Если вернулось true - значит проиграли
        // показать экран проигрыша
        // сейчас там экран hehe
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('hehe'),
              ),
            ),
          ),
        );
      }
      ref.read(tickerProvider.notifier).isTurnedAlready = false;
    } else {
      print('no');
    }
  }

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(duration, (timer) {
      update();
    });
  }

  @override
  Widget build(BuildContext context) {
    final level = ref.watch(levelProvider);

    final grid = ref.watch(gridProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 100),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: GridView.count(
                crossAxisCount: level.columns,
                children: grid,
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: ControllerWidget(),
            )
          ],
        ),
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