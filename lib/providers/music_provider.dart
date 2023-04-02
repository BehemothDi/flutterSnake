import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SoundNotifierBack extends StateNotifier<AudioPlayer> {
  SoundNotifierBack() : super(AudioPlayer()..setVolume(0.1));
  bool _isPlaying = true;

  double _volume = 0.2;

  bool get isPlaying => _isPlaying;

  ReleaseMode mode = ReleaseMode.loop;

  void playMusic() {
    state.play(AssetSource('sound.mp3'));
    state.setReleaseMode(mode);
    _isPlaying = true;
  }

  void setVolume(double value) {
    state.setVolume(value);
    _volume = value;
  }

  double get volume => _volume;

  void pause() {
    state.pause();
    _isPlaying = false;
  }
}

final soundProviderBack =
    StateNotifierProvider<SoundNotifierBack, AudioPlayer>((ref) {
  return SoundNotifierBack();
});
