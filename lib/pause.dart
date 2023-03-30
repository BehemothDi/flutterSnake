import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/providers/music.dart';
import 'package:flutter_snake/providers/sound.dart';

class PauseScreen extends ConsumerWidget {
  //AudioCache audioCache = AudioCache();
  //final player = AudioPlayer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final music = ref.watch(soundProviderBack.notifier);
    final sound = ref.watch(soundProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Пауза'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                  music.isPlaying == true ? Icons.music_note : Icons.music_off),
              onPressed: () {
                if (music.isPlaying) {
                  music.pause();
                } else {
                  music.setMusic();
                }
              },
            ),
            IconButton(
              icon: Icon(sound.isPlaying == true
                  ? Icons.volume_down
                  : Icons.volume_off),
              onPressed: () {
                if (sound.isPlaying) {
                  sound.pauseSoundEat();
                } else {
                  sound.setSoundEat();
                }
              },
            ),
            IconButton(
              icon: Icon(sound.isPlaying == true
                  ? Icons.volume_down
                  : Icons.volume_off),
              onPressed: () {
                if (sound.isPlaying) {
                  sound.pauseSoundDied();
                } else {
                  sound.pauseSoundDied();
                }
              },
            ),
            Slider(
              value: music.vol,
              onChanged: (value) {
                music.setVolume(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
