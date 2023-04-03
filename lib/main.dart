import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/providers/is_active.dart';
import 'package:flutter_snake/providers/is_game_over.dart';
import 'package:flutter_snake/ui/end_screen.dart';
import 'package:flutter_snake/ui/level_widget.dart';
import 'package:flutter_snake/ui/main_menu_screen.dart';
import 'package:flutter_snake/ui/pause_screen.dart';
import 'package:flutter_snake/utils/keyboard.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white)),
      home: MyKeyboardListener(
        child: Stack(
          children: [
            const MainMenuScreen(),
            Visibility(
              visible:
                  ref.watch(isActiveProvider) || !ref.watch(gameOverProvider),
              child: const LevelWidget(),
            ),
            Visibility(
              visible: !ref.watch(isActiveProvider) &&
                  !ref.watch(gameOverProvider.notifier).isOver,
              child: const PauseScreen(),
            ),
            Visibility(
              visible: ref.watch(gameOverProvider),
              child: const EndScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
