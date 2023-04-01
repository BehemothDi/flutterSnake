import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/providers/is_turned_provider.dart';
import 'package:flutter_snake/providers/sound.dart';

import 'ground_provider.dart';

class TimerNotifier extends StateNotifier<Timer> {
  final GroundNotifier groundNotifier;
  final IsActiveNotifier isActiveNotifier;
  final IsTurnedNotifier isTurnedNotifier;
  final SoundNotifier soundNotifier;

  TimerNotifier(
    this.groundNotifier,
    this.isActiveNotifier,
    this.isTurnedNotifier,
    this.soundNotifier,
  ) : super(
          Timer.periodic(
            Duration(milliseconds: 400),
            (timer) {
              if (isActiveNotifier.isActive) {
                final value = groundNotifier.update();
                if (value) {
                  isActiveNotifier.isActive = false;
                  soundNotifier.setSoundDied();
                  // Если вернулось true - значит проиграли
                  // показать экран проигрыша
                  // сейчас там экран hehe
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Scaffold(
                  //       body: Center(
                  //         child: Text('hehe'),
                  //       ),
                  //     ),
                  //   ),
                  // );
                }
                isTurnedNotifier.isTurnedAlready = false;
              }
            },
          ),
        );

  set isTurnedAlready(Timer value) => state = value;
}

final timerProvider = StateNotifierProvider<TimerNotifier, Timer>((ref) {
  final groundNotifier = ref.watch(groundProvider.notifier);
  final isActiveNotifier = ref.watch(isActiveProvider.notifier);
  final isTurnedNotifier = ref.watch(isTurnedProvider.notifier);
  final soundNotifier = ref.watch(soundProvider.notifier);
  return TimerNotifier(
      groundNotifier, isActiveNotifier, isTurnedNotifier, soundNotifier);
});

class IsActiveNotifier extends StateNotifier<bool> {
  IsActiveNotifier() : super(true);

  set isActive(bool value) => state = value;

  bool get isActive => state;
}

final isActiveProvider = StateNotifierProvider<IsActiveNotifier, bool>((ref) {
  return IsActiveNotifier();
});
